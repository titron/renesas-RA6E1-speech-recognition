/* Copyright 2020 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#include "main_functions.h"

#include "model_tflite.h"

#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "constants.h"
#include "hello_world_model_data.h"
#include "output_handler.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/system_setup.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "hal_data.h"


#include <dsp/basic_math_functions.h>
#include <dsp/transform_functions.h>
#include <dsp/window_functions.h>
#include <dsp/fast_math_functions.h>
//#include <tensorflow/lite/micro/micro_log.h>
#include <tensorflow/lite/micro/micro_mutable_op_resolver.h>
#include <tensorflow/lite/micro/micro_op_resolver.h>
#include <tensorflow/lite/micro/micro_profiler.h>
#include <tensorflow/lite/micro/recording_micro_interpreter.h>

// Globals, used for compatibility with Arduino-style sketches.
namespace {
tflite::ErrorReporter* error_reporter = nullptr;
const tflite::Model* model = nullptr;
tflite::MicroInterpreter* interpreter = nullptr;
TfLiteTensor* input = nullptr;
TfLiteTensor* output = nullptr;
int inference_count = 0;

constexpr int kTensorArenaSize = 2000;
uint8_t tensor_arena[kTensorArenaSize];
}  // namespace

#if COMMENT_RAW_CODE

// The name of this function is important for Arduino compatibility.
void setup() {
  tflite::InitializeTarget();

  // Set up logging. Google style is to avoid globals or statics because of
  // lifetime uncertainty, but since this has a trivial destructor it's okay.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::MicroErrorReporter micro_error_reporter;
  error_reporter = &micro_error_reporter;

  // Map the model into a usable data structure. This doesn't involve any
  // copying or parsing, it's a very lightweight operation.
  model = tflite::GetModel(g_hello_world_model_data);
  if (model->version() != TFLITE_SCHEMA_VERSION) {
    TF_LITE_REPORT_ERROR(error_reporter,
                         "Model provided is schema version %d not equal "
                         "to supported version %d.",
                         model->version(), TFLITE_SCHEMA_VERSION);
    return;
  }

  // This pulls in all the operation implementations we need.
  // NOLINTNEXTLINE(runtime-global-variables)
  static tflite::AllOpsResolver resolver;

  // Build an interpreter to run the model with.
  static tflite::MicroInterpreter static_interpreter(
      model, resolver, tensor_arena, kTensorArenaSize, error_reporter);
  interpreter = &static_interpreter;

  // Allocate memory from the tensor_arena for the model's tensors.
  TfLiteStatus allocate_status = interpreter->AllocateTensors();
  if (allocate_status != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "AllocateTensors() failed");
    return;
  }

  // Obtain pointers to the model's input and output tensors.
  input = interpreter->input(0);
  output = interpreter->output(0);

  // Keep track of how many inferences we have performed.
  inference_count = 0;
}
#else

void PrintModelDetails(const tflite::Model *model)
{
    my_printf("TFlite schema version: %lu\n\r", model->version());
    assert(model->version() == TFLITE_SCHEMA_VERSION);

    // Primary subgraph usually at index 0
    const tflite::SubGraph *subgraph = model->subgraphs()->Get(0);

    my_printf("Number of tensors: %lu\n\r", subgraph->tensors()->size());
    for (size_t i = 0; i < subgraph->tensors()->size(); i++) {
        const tflite::Tensor *tensor = subgraph->tensors()->Get(i);
        my_printf(
            "    %u: %s\n\r", i,
            (char *)tflite::EnumNameTensorType(tensor->type()));
    }
    my_printf("Number of operators: %lu\n\r",
             subgraph->operators()->size());

    // Iterate over operators and print their details
    for (size_t i = 0; i < subgraph->operators()->size(); i++) {
        const tflite::Operator *op = subgraph->operators()->Get(i);
        const tflite::OperatorCode *op_code =
            model->operator_codes()->Get(op->opcode_index());

        const char *op_name = tflite::EnumNameBuiltinOperator(
            static_cast<tflite::BuiltinOperator>(
                op_code->builtin_code()));

        my_printf("    %u: %s\n\r", i, op_name);

        my_printf("        Inputs: ");
        for (size_t j = 0; j < op->inputs()->size(); j++) {
            printf("%lu ", op->inputs()->Get(j));
        }
        my_printf("\n\r");

        my_printf("        Outputs: ");
        for (size_t j = 0; j < op->outputs()->size(); j++) {
            printf("%lu ", op->outputs()->Get(j));
        }
        my_printf("\n\r");
    }
}

void setup()
{
//    double temp = 100.03;
//    my_printf("integer = %d, temp = %g, hex = 0x%x.\n\r",100, temp, 0x55);
    tflite::InitializeTarget();

    const static uint32_t window_size = 256;
    const static uint32_t frame_step = 128;

    arm_rfft_fast_instance_f32 fft;
    if (arm_rfft_fast_init_256_f32(&fft) != ARM_MATH_SUCCESS) {
        assert(!"Failed to init RFFT");
    }

    static float hanning[window_size];
    arm_hanning_f32(hanning, window_size);

    const tflite::Model *model = tflite::GetModel(model_tflite);
    my_printf("Model architecture:\n\r");
    my_printf("==============================================\n\r");
    PrintModelDetails(model);

    tflite::MicroMutableOpResolver<8> op_resolver;

    // Not really sure which ops to add
    if (op_resolver.AddRelu() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddConv2D() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddMaxPool2D() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddReshape() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddFullyConnected() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddSoftmax() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddResizeBilinear() != kTfLiteOk) {
        assert(!"Failed to add op");
    }
    if (op_resolver.AddQuantize() != kTfLiteOk) {
        assert(!"Failed to add op");
    }

    my_printf("Added operations to OpsResolver.\n\r");


}
#endif

// The name of this function is important for Arduino compatibility.
void loop() {
  // Calculate an x value to feed into the model. We compare the current
  // inference_count to the number of inferences per cycle to determine
  // our position within the range of possible x values the model was
  // trained on, and use this to calculate a value.
  float position = static_cast<float>(inference_count) /
                   static_cast<float>(kInferencesPerCycle);
  float x = position * kXrange;

  // Quantize the input from floating-point to integer
  int8_t x_quantized = x / input->params.scale + input->params.zero_point;
  // Place the quantized input in the model's input tensor
  input->data.int8[0] = x_quantized;

  // Run inference, and report any error
  TfLiteStatus invoke_status = interpreter->Invoke();
  if (invoke_status != kTfLiteOk) {


    TF_LITE_REPORT_ERROR(error_reporter, "Invoke failed on x: %f\n",
                         static_cast<double>(x));
    return;
  }

  // Obtain the quantized output from model's output tensor
  int8_t y_quantized = output->data.int8[0];
  // Dequantize the output from integer to floating-point
  float y = (y_quantized - output->params.zero_point) * output->params.scale;

  // Output the results. A custom HandleOutput function can be implemented
  // for each supported hardware target.
  R_BSP_SoftwareDelay(2000,  BSP_DELAY_UNITS_MILLISECONDS);

  HandleOutput(error_reporter, x, y);

  // Increment the inference_counter, and reset it if we have reached
  // the total number per cycle
  inference_count += 1;
  if (inference_count >= kInferencesPerCycle) inference_count = 0;
}
