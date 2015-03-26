DIR_MODINC += $(MOD)/tivaware $(MOD)/inc
CDEFINES += gcc $(TIVA_DEFINES)

ifeq '$(BUILD)' 'DEBUG'
CDEFINES += DEBUG
endif
