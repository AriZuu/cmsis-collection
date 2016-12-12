include $(MOD)/../module.inc
NRF5_DEFINES ?= NRF51 NRF51822

DIR_MODINC += $(MOD)/sdk/components/device \
	$(MOD)/sdk/components/toolchain \
	$(MOD)/sdk/components/drivers_nrf/hal \
	$(MOD)/sdk/components/libraries/util \
	$(MOD)/sdk/components/drivers_nrf/common \
	$(MOD)/sdk/components/libraries/log \
	$(MOD)/sdk/components/libraries/log/src \
	$(MOD)/sdk/components/drivers_nrf/uart \
	$(MOD)/sdk/components/drivers_nrf/rtc

ifeq '$(strip $(NRF5_SOFTDEVICE))' ''
DIR_MODINC += $(MOD)/sdk/components/drivers_nrf/nrf_soc_nosd
else
DIR_MODINC += $(MOD)/sdk/components/softdevice/$(NRF5_SOFTDEVICE)/headers/
endif

CDEFINES += $(NRF5_DEFINES)
export NRF5_DEFINES
export NRF5_SOFTDEVICE
