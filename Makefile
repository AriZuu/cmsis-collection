#
# Copyright (c) 2012-2013, Ari Suutari <ari@stonepile.fi>.
# All rights reserved. 
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. The name of the author may not be used to endorse or promote
#     products derived from this software without specific prior written
#     permission. 
# 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
# OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
# INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

#
# Compile CMSIS library using Pico]OS library Makefile
#

RELROOT = ../picoos/
PORT ?= cortex-m
BUILD ?= RELEASE

#
# These are just defaults, not really useful, but allow
# some compilation testing. Correct values should be
# set in program's Makefile.
#
CMSIS ?= stm32f10x
CMSIS_INCLUDES ?= $(CMSIS)/inc
CMSIS_DEFINES ?= =STM32F10X_MD USE_STDPERIPH_DRIVER

include $(RELROOT)make/common.mak

TARGET = cmsis
EXTRA_CFLAGS =  -Wno-missing-prototypes -Wno-missing-declarations

#
# Include CMSIS-specific makefile fragment
#
ifneq '$(CMSIS)' ''
include $(CMSIS)/cmsis.mak
endif

# 
# Set output directory.
#
ifeq '$(strip $(DIR_OUTPUT))' ''
DIR_OUTPUT = $(CURRENTDIR)/bin
endif

include $(MAKE_LIB)

