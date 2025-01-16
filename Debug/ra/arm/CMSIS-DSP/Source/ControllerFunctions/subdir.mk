################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_f32.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_q15.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_q31.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_f32.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_q15.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_q31.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_sin_cos_f32.c \
../ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_sin_cos_q31.c 

SREC += \
renesas-RA6E1-speech-recognition.srec 

C_DEPS += \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_f32.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_q15.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_q31.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_f32.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_q15.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_q31.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_sin_cos_f32.d \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_sin_cos_q31.d 

OBJS += \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_f32.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_q15.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_init_q31.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_f32.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_q15.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_pid_reset_q31.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_sin_cos_f32.o \
./ra/arm/CMSIS-DSP/Source/ControllerFunctions/arm_sin_cos_q31.o 

MAP += \
renesas-RA6E1-speech-recognition.map 


# Each subdirectory must supply rules for building sources it contributes
ra/arm/CMSIS-DSP/Source/ControllerFunctions/%.o: ../ra/arm/CMSIS-DSP/Source/ControllerFunctions/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fpermissive -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -D_RENESAS_RA_ -D_RA_CORE=CM33 -D_RA_ORDINAL=1 -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/api" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/instances" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_gen" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg/bsp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/gemmlowp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/ruy" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/kissfft" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/flatbuffers/include" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/PrivateInclude" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/Include" -std=c99 -Os -w -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

