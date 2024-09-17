    .global _start
    .section .text

    # Base addresses
    .equ GPIO_BASE, 0x3FF44000
    .equ GPIO_ENABLE_W1TS_REG, GPIO_BASE + 0x20
    .equ GPIO_OUT_W1TS_REG, GPIO_BASE + 0x04
    .equ GPIO_OUT_W1TC_REG, GPIO_BASE + 0x08
    .equ LED_PIN_MASK, (1 << 2)  # GPIO pin 2 (or another pin you are using)

    _start:
        # Set GPIO2 as output (enable it)
        movi a2, GPIO_ENABLE_W1TS_REG  # Load GPIO_ENABLE_W1TS_REG address directly
        movi a3, LED_PIN_MASK          # Load LED pin mask directly
        s32i a3, a2, 0                 # Write to GPIO enable register

    loop:
        # Turn on LED
        movi a2, GPIO_OUT_W1TS_REG     # Load GPIO_OUT_W1TS_REG address directly
        movi a3, LED_PIN_MASK          # Load LED pin mask directly
        s32i a3, a2, 0                 # Write to GPIO output register

        # Delay
        CALL0 delay

        # Turn off LED
        movi a2, GPIO_OUT_W1TC_REG     # Load GPIO_OUT_W1TC_REG address directly
        movi a3, LED_PIN_MASK          # Load LED pin mask directly
        s32i a3, a2, 0                 # Write to GPIO output clear register

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
