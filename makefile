PORT=/dev/ttyUSB0
BAUDRATE=115200

compile:
	xtensa-esp32-elf-as -o blink.o blink.s
	xtensa-esp32-elf-ld -T esp32.ld -o blink.elf blink.o
	xtensa-esp32-elf-objcopy -O binary blink.elf blink.bin

upload:
	esptool.py --chip esp32 --port $(PORT) --baud $(BAUDRATE) write_flash 0x1000 blink.bin