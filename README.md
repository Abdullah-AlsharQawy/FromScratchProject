I tried a demo in which I used Stm32F446re microcontroller on the Nucleo board, the demo code was simply to toggle the 
user-led provided in the board.

In this demo I made a makefile to automate the building process and to keep track of the history of the generated files to 
minimize the building time as we re-build the edited files only.

Also, I made a linkerscript file using GNU linker command language in which I used multiple commands like;
	ENTRY      -> to specify the entry point
	MEMORY     -> to define the SRAM and Flash memories used, by defining their base address and size
	SECTIONS   -> to declare the different sections of both flash and RAM with the order they would be in the memory
	ALIGN      -> you can assign it to the Location Counter symbol "." so you can get the real address after alignment
In the linkerscript, I made symbols that I assigned to them the boundary addresses of .data and .bss sections.

After that, I made a startup file in which I made a vector table holding the addresses of all exceptions supported by the MCU. Then
I implemented the startup code with the help of the symbols I externed from the linkerscript so I can use them to load -in runtime- the
.data section from flash to RAM and to reserve a zero-valued space for the .bss section in RAM and then we can call the "main" function.
