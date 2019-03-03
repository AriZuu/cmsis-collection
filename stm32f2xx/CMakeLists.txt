include_guard(GLOBAL)

include(${CMAKE_CURRENT_LIST_DIR}/../cmsis-common.cmake)

set(DIST ${DISTFILES}/stsw-stm32062.zip)
set(SOURCE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/work/STM32F2xx_StdPeriph_Lib_V1.1.0/Libraries)
set(DEVICE_SOURCE ${SOURCE_ROOT}/CMSIS/Device/ST/STM32F2xx/Source/Templates)
set(DEVICE_INCLUDE ${SOURCE_ROOT}/CMSIS/Device/ST/STM32F2xx/Include)
set(PERIPH_SOURCE ${SOURCE_ROOT}/STM32F2xx_StdPeriph_Driver/src)
set(PERIPH_INCLUDE ${SOURCE_ROOT}/STM32F2xx_StdPeriph_Driver/inc)

set(SOURCE 
  ${PERIPH_SOURCE}/misc.c
  ${PERIPH_SOURCE}/stm32f2xx_adc.c
  ${PERIPH_SOURCE}/stm32f2xx_can.c
  ${PERIPH_SOURCE}/stm32f2xx_crc.c
  ${PERIPH_SOURCE}/stm32f2xx_cryp_aes.c
  ${PERIPH_SOURCE}/stm32f2xx_cryp_des.c
  ${PERIPH_SOURCE}/stm32f2xx_cryp_tdes.c
  ${PERIPH_SOURCE}/stm32f2xx_cryp.c
  ${PERIPH_SOURCE}/stm32f2xx_dac.c
  ${PERIPH_SOURCE}/stm32f2xx_dbgmcu.c
  ${PERIPH_SOURCE}/stm32f2xx_dcmi.c
  ${PERIPH_SOURCE}/stm32f2xx_dma.c
  ${PERIPH_SOURCE}/stm32f2xx_exti.c
  ${PERIPH_SOURCE}/stm32f2xx_flash.c
  ${PERIPH_SOURCE}/stm32f2xx_fsmc.c
  ${PERIPH_SOURCE}/stm32f2xx_gpio.c
  ${PERIPH_SOURCE}/stm32f2xx_hash_md5.c
  ${PERIPH_SOURCE}/stm32f2xx_hash_sha1.c
  ${PERIPH_SOURCE}/stm32f2xx_hash.c
  ${PERIPH_SOURCE}/stm32f2xx_i2c.c
  ${PERIPH_SOURCE}/stm32f2xx_iwdg.c
  ${PERIPH_SOURCE}/stm32f2xx_pwr.c
  ${PERIPH_SOURCE}/stm32f2xx_rcc.c
  ${PERIPH_SOURCE}/stm32f2xx_rng.c
  ${PERIPH_SOURCE}/stm32f2xx_rtc.c
  ${PERIPH_SOURCE}/stm32f2xx_sdio.c
  ${PERIPH_SOURCE}/stm32f2xx_spi.c
  ${PERIPH_SOURCE}/stm32f2xx_syscfg.c
  ${PERIPH_SOURCE}/stm32f2xx_tim.c
  ${PERIPH_SOURCE}/stm32f2xx_usart.c
  ${PERIPH_SOURCE}/stm32f2xx_wwdg.c
  ${DEVICE_SOURCE}/system_stm32f2xx.c)

add_custom_command(
  OUTPUT ${SOURCE}
  COMMAND ${CMAKE_COMMAND} -E make_directory work
  COMMAND tar -xf ${DIST} -m -C work
  DEPENDS ${DIST}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  COMMENT "unpacking stuff")

add_library(cmsis STATIC ${SOURCE})

target_include_directories(cmsis
  PUBLIC ${DEVICE_INCLUDE} ${PERIPH_INCLUDE} ../CMSIS/CMSIS/Include
  PRIVATE ${DIR_CONFIG})

target_compile_definitions(cmsis
  PUBLIC ${STM32_DEFINES} USE_STDPERIPH_DRIVER ${STM32_CHIP})

target_compile_options(cmsis PRIVATE -Wno-misleading-indentation -Wno-missing-prototypes)
