//
// Created by coffeelake on 13.02.2026.
//

#ifndef BITMAT_BITMAT_HPP
#define BITMAT_BITMAT_HPP

//#include <cstdint>
#include <stdint.h>

struct bitmat {
    /// Used maximum rows count
    uint8_t rows;
    /// Used maximum columns count
    uint8_t columns; 
    /// Vector of 64-bit integers
    /// bit values contains in the bytemasks 
    uint64_t * data;
};

void bitmat_set(bitmat& instance, uint8_t i, uint8_t j);
void bitmat_reset(bitmat& instance, uint8_t i, uint8_t j);
uint64_t bitmat_get_exact(bitmat& instance, uint8_t i, uint8_t j);
bool bitmat_get(bitmat& instance, uint8_t i, uint8_t j);

void bitmat_print(bitmat& instance);
void bitmat_fprint(bitmat& instance, const char * path);
bool bitmat_try_load(bitmat& instance, const char * path);

#endif //BITMAT_BITMAT_HPP
