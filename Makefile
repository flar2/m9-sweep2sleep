KERNEL_BUILD := [YOUR KERNEL SOURCE HERE]
KERNEL_CROSS_COMPILE := [YOUR TOOLCHAIN HERE]

obj-m += s2s_mod.o

all:
	make -C $(KERNEL_BUILD) CFLAGS_MODULE=-fno-pic CROSS_COMPILE=$(KERNEL_CROSS_COMPILE) M=$(PWD) modules

clean:
	make -C $(KERNEL_BUILD) M=$(PWD) clean 2> /dev/null
	rm -f modules.order *~
