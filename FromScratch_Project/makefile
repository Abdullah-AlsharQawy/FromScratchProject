
CC = arm-none-eabi-gcc

CFLAGS = -c -mcpu=$(MACH) -std=gnu11 -mthumb -Wall

LDFLAGS = -T STM32f446_LS.ld -nostdlib -Wl,-Map=final.map

MACH = cortex-m4


main.o:main.c
	$(CC) $(CFLAGS) $^ -o $@

GPIO_Prog.o:GPIO_Prog.c
	$(CC) $(CFLAGS) $^ -o $@

RCC_Prog.o:RCC_Prog.c
	$(CC) $(CFLAGS) $^ -o $@

SysTick_Prog.o:SysTick_Prog.c
	$(CC) $(CFLAGS) $^ -o $@

STM32F446reStartup.o:STM32F446reStartup.c
	$(CC) $(CFLAGS) $^ -o $@

final.elf: main.o GPIO_Prog.o RCC_Prog.o SysTick_Prog.o STM32F446reStartup.o
	$(CC) $(LDFLAGS) $^ -o $@
	
all:main.o GPIO_Prog.o RCC_Prog.o SysTick_Prog.o STM32F446reStartup.o final.elf

clean:
	rm -rf *.o