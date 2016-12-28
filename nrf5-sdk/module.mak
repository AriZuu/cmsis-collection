include $(MOD)/../module.inc
NRF5_DEFINES ?= NRF51 NRF51822

DIR_MODINC += $(MOD)/sdk/components/device \
	$(MOD)/sdk/components/toolchain \
	$(MOD)/sdk/components/drivers_nrf/hal \
	$(MOD)/sdk/components/libraries/util \
	$(MOD)/sdk/components/libraries/log

ifeq '$(strip $(NRF5_SOFTDEVICE))' ''
DIR_MODINC += $(MOD)/sdk/components/drivers_nrf/nrf_soc_nosd
else
DIR_MODINC +=	$(MOD)/sdk/components/softdevice/$(NRF5_SOFTDEVICE)/headers \
		$(MOD)/sdk/components/softdevice/common/softdevice_handler

NRF5_SOFTDEVICE_UPPER := $(shell echo $(NRF5_SOFTDEVICE) | tr '[:lower:]' '[:upper:]')
CDEFINES += SOFTDEVICE_PRESENT $(NRF5_SOFTDEVICE_UPPER)
endif

CDEFINES += $(NRF5_DEFINES)
ifeq '$(BUILD)' 'DEBUG'
CDEFINES += DEBUG
endif

export NRF5_DEFINES
export NRF5_SOFTDEVICE
