//
// Created by coffeelake on 13.02.2026.
//

#ifndef BITMAT_BITMAT_HPP
#define BITMAT_BITMAT_HPP

#include <cstdint>

struct bitmat {
    uint8_t rows;
    uint8_t columns;
    uint64_t * data;
};

void bitmat_set(bitmat& instance, uint8_t i, uint8_t j);
void bitmat_reset(bitmat& instance, uint8_t i, uint8_t j);
uint64_t bitmat_get_exact(bitmat& instance, uint8_t i, uint8_t j);
bool bitmat_get(bitmat& instance, uint8_t i, uint8_t j);

void bitmat_print(bitmat& instance);
void bitmat_fprint(bitmat& instance, char * path);

#endif //BITMAT_BITMAT_HPP
