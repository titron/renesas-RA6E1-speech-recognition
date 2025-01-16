################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../src/examples/hello_world/constants.cc \
../src/examples/hello_world/hello_world_model_data.cc \
../src/examples/hello_world/main.cc \
../src/examples/hello_world/main_functions.cc \
../src/examples/hello_world/output_handler.cc 

SREC += \
renesas-RA6E1-speech-recognition.srec 

CC_DEPS += \
./src/examples/hello_world/constants.d \
./src/examples/hello_world/hello_world_model_data.d \
./src/examples/hello_world/main.d \
./src/examples/hello_world/main_functions.d \
./src/examples/hello_world/output_handler.d 

OBJS += \
./src/examples/hello_world/constants.o \
./src/examples/hello_world/hello_world_model_data.o \
./src/examples/hello_world/main.o \
./src/examples/hello_world/main_functions.o \
./src/examples/hello_world/output_handler.o 

MAP += \
renesas-RA6E1-speech-recognition.map 


# Each subdirectory must supply rules for building sources it contributes
src/examples/hello_world/%.o: ../src/examples/hello_world/%.cc
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fpermissive -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -D_RENESAS_RA_ -D_RA_CORE=CM33 -D_RA_ORDINAL=1 -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/api" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/instances" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_gen" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg/bsp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/gemmlowp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/ruy" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/kissfft" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/flatbuffers/include" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/PrivateInclude" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/Include" -std=c++11 -fabi-version=0 -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<" -Os)
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

