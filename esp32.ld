MEMORY
{
  dram0_0_seg (RW)  : ORIGIN = 0x3FFAE000, LENGTH = 0x00002000
  iram0_0_seg (RX)  : ORIGIN = 0x40080000, LENGTH = 0x00080000
  flash (RX)        : ORIGIN = 0x10000, LENGTH = 0x00200000
}

ENTRY(_start);

SECTIONS
{
  .text : 
  {
    _start = .;
    *(.text)
  } > flash
}
