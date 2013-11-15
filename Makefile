#
# These are just defaults, not really useful, but allow
# some compilation testing. Correct values should be
# set in program's Makefile.
#
CMSIS ?= stm32f10x
CMSIS_INCLUDES ?= $(CMSIS)/inc
CMSIS_DEFINES ?= =STM32F10X_MD USE_STDPERIPH_DRIVER

export CMSIS CMSIS_INCLUDES CMSIS_DEFINES


all: extract
	$(MAKE) -f Makefile.inc

clean:
	$(MAKE) -f Makefile.inc clean

include $(CMSIS)/cmsis.mak
