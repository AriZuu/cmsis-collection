include_guard(GLOBAL)

include(${CMAKE_CURRENT_LIST_DIR}/../cmsis-common.cmake)

set(DIST ${DISTFILES}/stm32f4_dsp_stdperiph_lib.zip)
set(SOURCE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/work/STM32F4xx_DSP_StdPeriph_Lib_V1.6.1/Libraries)
set(DEVICE_SOURCE ${SOURCE_ROOT}/CMSIS/Device/ST/STM32F4xx/Source/Templates)
set(DEVICE_INCLUDE ${SOURCE_ROOT}/CMSIS/Device/ST/STM32F4xx/Include)
set(PERIPH_SOURCE ${SOURCE_ROOT}/STM32F4xx_StdPeriph_Driver/src)
set(PERIPH_INCLUDE ${SOURCE_ROOT}/STM32F4xx_StdPeriph_Driver/inc)

set(SOURCE
    ${DEVICE_SOURCE}/system_stm32f4xx.c
    ${PERIPH_SOURCE}/misc.c
    ${PERIPH_SOURCE}/stm32f4xx_adc.c
    ${PERIPH_SOURCE}/stm32f4xx_can.c
    ${PERIPH_SOURCE}/stm32f4xx_cec.c
    ${PERIPH_SOURCE}/stm32f4xx_crc.c
    ${PERIPH_SOURCE}/stm32f4xx_cryp_aes.c
    ${PERIPH_SOURCE}/stm32f4xx_cryp_des.c
    ${PERIPH_SOURCE}/stm32f4xx_cryp_tdes.c
    ${PERIPH_SOURCE}/stm32f4xx_cryp.c
    ${PERIPH_SOURCE}/stm32f4xx_dac.c
    ${PERIPH_SOURCE}/stm32f4xx_dbgmcu.c
    ${PERIPH_SOURCE}/stm32f4xx_dcmi.c
    ${PERIPH_SOURCE}/stm32f4xx_dma.c
    ${PERIPH_SOURCE}/stm32f4xx_dma2d.c
    ${PERIPH_SOURCE}/stm32f4xx_dsi.c
    ${PERIPH_SOURCE}/stm32f4xx_exti.c
    ${PERIPH_SOURCE}/stm32f4xx_flash_ramfunc.c
    ${PERIPH_SOURCE}/stm32f4xx_flash.c
    ${PERIPH_SOURCE}/stm32f4xx_fmpi2c.c
    ${PERIPH_SOURCE}/stm32f4xx_gpio.c
    ${PERIPH_SOURCE}/stm32f4xx_hash_md5.c
    ${PERIPH_SOURCE}/stm32f4xx_hash_sha1.c
    ${PERIPH_SOURCE}/stm32f4xx_hash.c
    ${PERIPH_SOURCE}/stm32f4xx_i2c.c
    ${PERIPH_SOURCE}/stm32f4xx_iwdg.c
    ${PERIPH_SOURCE}/stm32f4xx_lptim.c
    ${PERIPH_SOURCE}/stm32f4xx_ltdc.c
    ${PERIPH_SOURCE}/stm32f4xx_pwr.c
    ${PERIPH_SOURCE}/stm32f4xx_qspi.c
    ${PERIPH_SOURCE}/stm32f4xx_rcc.c
    ${PERIPH_SOURCE}/stm32f4xx_rng.c
    ${PERIPH_SOURCE}/stm32f4xx_rtc.c
    ${PERIPH_SOURCE}/stm32f4xx_sai.c
    ${PERIPH_SOURCE}/stm32f4xx_sdio.c
    ${PERIPH_SOURCE}/stm32f4xx_spdifrx.c
    ${PERIPH_SOURCE}/stm32f4xx_spi.c
    ${PERIPH_SOURCE}/stm32f4xx_syscfg.c
    ${PERIPH_SOURCE}/stm32f4xx_tim.c
    ${PERIPH_SOURCE}/stm32f4xx_usart.c
    ${PERIPH_SOURCE}/stm32f4xx_wwdg.c)

add_custom_command(
  OUTPUT ${SOURCE}
  COMMAND mkdir -p work
  COMMAND tar -xvf ${DIST} -m -C work
  DEPENDS ${DIST}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  COMMENT "unpacking stuff")

add_library(cmsis STATIC ${SOURCE})

target_include_directories(cmsis
  PUBLIC ${DEVICE_INCLUDE} ${PERIPH_INCLUDE} ../CMSIS/CMSIS/Include
  PRIVATE ${DIR_CONFIG})

target_compile_definitions(cmsis
  PUBLIC ${STM32_DEFINES} USE_STDPERIPH_DRIVER ${STM32_CHIP})

target_compile_options(cmsis PRIVATE -Wno-misleading-indentation -Wno-missing-prototypes -Wno-aggregate-return)
