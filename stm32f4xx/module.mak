include $(MOD)/../module.inc
DIR_MODINC += $(MOD)/inc
CDEFINES += $(STM32_DEFINES) $(STM32_CHIP) USE_STDPERIPH_DRIVER
export STM32_DEFINES
export STM32_CHIP