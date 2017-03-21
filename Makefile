
ifeq ($(src),)
	src := $$PWD
endif



ifneq ($(KERNELRELEASE),)


kver_major:=$(shell echo $(KERNELRELEASE) | awk -F '.' '// { print $$2;}' )

obj-m += physmem_drv.o



all: default

default:
	@ $(MAKE) -C $(KDIR) M=$$PWD  modules


else

KDIR ?= /lib/modules/$(shell uname -r)/build
REL := $(subst ., , $(subst -, , $(shell uname -r)))
REL_MAJOR  := $(word 1,$(REL))
REL_MEDIUM := $(word 2,$(REL))
REL_MINOR  := $(word 3,$(REL))

all: default

default:
	@ $(MAKE) -C $(KDIR) M=$$PWD  modules

install:
	$(MAKE) -C $(KDIR) M=$$PWD  modules_install

help:
	$(MAKE) -C $(KDIR) M=$$PWD help

clean:
	rm -rf *.o *.ko* *.mod.* .*.cmd Module.symvers modules.order .tmp_versions/ *~ core .depend TAGS

TAGS:
	find $(KERNELDIR) -follow -name \*.h -o -name \*.c  |xargs etags

.PHONY: clean all help install default linksyms

endif
