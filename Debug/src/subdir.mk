################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/hal_entry.cpp 

CC_SRCS += \
../src/model.cc 

SREC += \
renesas-RA6E1-speech-recognition.srec 

CC_DEPS += \
./src/model.d 

OBJS += \
./src/hal_entry.o \
./src/model.o 

MAP += \
renesas-RA6E1-speech-recognition.map 

CPP_DEPS += \
./src/hal_entry.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fpermissive -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -D_RENESAS_RA_ -D_RA_CORE=CM33 -D_RA_ORDINAL=1 -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/api" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/instances" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_gen" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg/bsp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/gemmlowp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/ruy" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/kissfft" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/flatbuffers/include" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/PrivateInclude" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/Include" -std=c++11 -fabi-version=0 -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<" -Os)
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"
src/%.o: ../src/%.cc
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fpermissive -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -D_RENESAS_RA_ -D_RA_CORE=CM33 -D_RA_ORDINAL=1 -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/api" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/fsp/inc/instances" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_gen" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg/bsp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra_cfg/fsp_cfg" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/gemmlowp" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/ruy" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/kissfft" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/src/third_party/flatbuffers/include" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/PrivateInclude" -I"C:/d_disk/RenesasMCUHWM/RCar/Gen4/R-Car_V4M/code/VoiceRecognization/renesas-RA6E1-speech-recognition/ra/arm/CMSIS-DSP/Include" -std=c++11 -fabi-version=0 -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<" -Os)
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

