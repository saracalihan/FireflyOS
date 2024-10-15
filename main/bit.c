#include "bit.h"

 void address_write(volatile uint32_t* address, const uint32_t data){
    *address = data;
}
 uint32_t address_read(const volatile uint32_t* address){
    return *address;
}

 void bit_write(volatile uint32_t* address, short int digit, const bool data){
    if (data)
        *address |= (1 << digit);
    else
        *address &= ~(1 << digit);
}
 bool bit_read(const volatile uint32_t* address, short int digit){
    return (*address & (1 << digit)) != 0;
}