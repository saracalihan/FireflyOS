#ifndef BIT_H
#define BIT_H

#include <stdbool.h>
#include <stdint.h>

 void address_write(volatile uint32_t* address, const uint32_t data);
 uint32_t address_read(const volatile uint32_t* address);

 void bit_write(volatile uint32_t* address, short int digit, const bool data);
 bool bit_read(const volatile uint32_t* address, short int digit);
#endif // BIT_H
