set -ex

# compile
xtensa-esp32-elf-gcc -mtext-section-literals -o program.o -c ./main/bare-metal-gpio-toggle.c

#link
xtensa-esp32-elf-gcc -o program.elf program.o -T esp32.ld -nostartfiles

#create bin
xtensa-esp32-elf-objcopy -O binary program.elf program.bin

#load
esptool.py --chip esp32 -b 460800 --before=default_reset --after=hard_reset write_flash --flash_mode dio --flash_freq 40m --flash_size 2MB 0x1000 ./build/bootloader/bootloader.bin 0x10000 program.bin 0x8000 ./build/partition_table/partition-table.bin
