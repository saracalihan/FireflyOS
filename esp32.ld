ENTRY(_start)

MEMORY
{
    # Data RAM (DRAM)
    dram0_0_seg (RW) : ORIGIN = 0x3FFB0000, LENGTH = 0x18000

    # Instruction RAM (IRAM)
    iram0_0_seg (RWX) : ORIGIN = 0x40080000, LENGTH = 0x20000

    # RTC slow memory
    rtc_slow_seg (RW) : ORIGIN = 0x50000000, LENGTH = 0x2000

    # Flash memory for code (IROM)
    irom0_0_seg (RX) : ORIGIN = 0x400D0000, LENGTH = 0x40000
}

SECTIONS
{
    .text :
    {
        *(.text)
        *(.text.*)
        *(.gnu.linkonce.t.*)
    } > iram0_0_seg

    .data :
    {
        *(.data)
        *(.data.*)
        *(.gnu.linkonce.d.*)
    } > dram0_0_seg

    .rodata :
    {
        *(.rodata)
        *(.rodata.*)
        *(.gnu.linkonce.r.*)
    } > dram0_0_seg

    .bss :
    {
        *(.bss)
        *(.bss.*)
        *(COMMON)
    } > dram0_0_seg
}
