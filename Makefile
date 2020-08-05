PHONY += menuconfig silentoldconfig clean distclean

Q            := @
obj          := $(CURDIR)/scripts/kconfig
SUBDIR       := kconfig
Kconfig      := Kconfig
SRC_DIR       += .
rm-distclean += include .config bin

export SRC_ROOT := $(shell pwd)
export CFLAGS += -I$(SRC_ROOT)/include/

CROSS_COMPILE = ../gcc-linaro-5.3.1-2016.05-x86_64_arm-eabi/bin/arm-eabi-


AS              = $(CROSS_COMPILE)as


CC              = $(CROSS_COMPILE)gcc
CPP             = $(CC) -E
AR              = $(CROSS_COMPILE)ar
NM              = $(CROSS_COMPILE)nm
LDR             = $(CROSS_COMPILE)ldr
STRIP           = $(CROSS_COMPILE)strip
OBJCOPY         = $(CROSS_COMPILE)objcopy
OBJDUMP         = $(CROSS_COMPILE)objdump



ifeq ($(quiet),silent_)
silent := -s
endif


ALL:
	$(foreach  dir,$(SRC_DIR),make -C $(dir);)

menuconfig : $(obj)/mconf $(obj)/conf
	$(Q)$< $(Kconfig)
	$(Q)$(MAKE) silentoldconfig


$(obj)/mconf:
	$(Q)$(MAKE) -C $(SUBDIR)


silentoldconfig: $(obj)/conf
	$(Q)mkdir -p include/generated include/config bin
	$(Q)$< -s --silentoldconfig $(Kconfig)

clean:
	$(foreach  dir,$(SRC_DIR),make -C $(dir) clean;)
	-rm -rf bin/*
distclean:clean
	-rm -rf  $(rm-distclean)
	$(MAKE)  -C kconfig clean


.PHONY : ALL







