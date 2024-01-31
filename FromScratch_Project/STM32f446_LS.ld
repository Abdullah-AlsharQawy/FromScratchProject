
ENTRY(Reset_Handler)

MEMORY
{
	FLASH(RX) : ORIGIN = 0x08000000 , LENGTH = 512k
	SRAM(RWX) : ORIGIN = 0x20000000 , LENGTH = 128k
}

SECTIONS
{
	.text :
	{
		*(.isr_vector)
		*(.text)
		*(.rodata)
		. = ALIGN(4);
		_etext = . ;
	}>FLASH
	
	.data : 
	{
		. = ALIGN(4);
		_sdata = . ;
		*(.data)
		. = ALIGN(4);
		_edata = . ;
	}>SRAM AT> FLASH
	
	.bss :
	{
		. = ALIGN(4);
		_sbss = . ;
		*(.bss)
		. = ALIGN(4);
		_ebss = . ;
	}>SRAM
}