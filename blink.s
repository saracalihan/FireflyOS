    .global _start
    .section .text
    # 0x3f404024
    # Base addresses
    .equ PERIPHERALS_BASE,  0x3F400000
    .equ GPIO_BASE, PERIPHERALS_BASE + 0x00004000
    .equ GPIO_ENABLE_W1TS_REG, GPIO_BASE + 0x00000024
    .equ GPIO_OUT_W1TS_REG, GPIO_BASE + 0x0008
    .equ GPIO_OUT_W1TC_REG, GPIO_BASE + 0x000C
    .equ LED_PIN_MASK, (1 << 5)  # GPIO pin 5 (or another pin you are using)

    _start:
        # Set GPIO2 as output (enable it)
        movi a2, GPIO_ENABLE_W1TS_REG  # Load GPIO_ENABLE_W1TS_REG address directly
        #l32 a2, a2, 0
        movi a3, LED_PIN_MASK          # Load LED pin mask directly
        # s32i a3, a2, 0                 # Write to GPIO enable register

    loop:
        # Turn on LED
        movi a2, GPIO_OUT_W1TS_REG     # Load GPIO_OUT_W1TS_REG address directly
        movi a3, LED_PIN_MASK          # Load LED pin mask directly
        # s32i a3, a2, 0                 # Write to GPIO output register

        # Delay
        CALL0 delay

        # Turn off LED
        movi a2, GPIO_OUT_W1TC_REG     # Load GPIO_OUT_W1TC_REG address directly
        movi a3, LED_PIN_MASK          # Load LED pin mask directly
        # s32i a3, a2, 0                 # Write to GPIO output clear register

        # Delay
        CALL0 delay

        # Repeat loop
        j loop

    delay:
        movi a0, 0xFFFFF               # Adjust delay value here as needed
    delay_loop:
        addi a0, a0, -1
        bnez a0, delay_loop
        ret
