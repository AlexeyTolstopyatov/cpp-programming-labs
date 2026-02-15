//
// Created by coffeelake on 13.02.2026.
//
#include <iostream>
#include <fstream>
#include "bitmat.hpp"
/// Checks out: if argument less than maximum required
/// rows into matrix.
/// \param x current row index
/// \param i bitmat instance
/// \return True if index less than array bounds.
static bool valid_row(uint8_t x, bitmat& i) {
    return x < i.rows;
}
/// Checks out: if argument less than maximum required
/// columns count or maximum possible to allocate columns count.
/// \param x current column
/// \param i bitmat instance
/// \return True, then memory write is safe. False -> Might be a heap corruption
static bool valid_column(uint8_t x, bitmat& i){
    return x < i.columns;
}
/// Set the flag by current address
/// \param i row
/// \param j column
/// \param instance instance of bitmat
void bitmat_set( bitmat& instance, uint8_t i, uint8_t j) {
    if (!valid_column(j, instance) || !valid_row(i, instance))
        return;

    instance.data[i] |= (1ull << j);
}
/// Drop the set flag by current address
/// \param i row
/// \param j column
/// \param instance instance of bitmat
void bitmat_reset(bitmat& instance, uint8_t i, uint8_t j) {
    if (!valid_column(j, instance) || !valid_row(i, instance))
        return;

    instance.data[i] &= ~(1ull << j);
}
/// Returns 64-bit bytemask
/// \param i row
/// \param j column
/// \param instance bitmat instance
uint64_t bitmat_get_exact(bitmat& instance, uint8_t i, uint8_t j) {
    if (!valid_column(j, instance) || !valid_row(i, instance))
        return false;

    return (instance.data[i] >> j) & 1ull;
}
/// Makes a cast of raw bytemask into boolean value.
/// \param i
/// \param j
/// \param instance
bool bitmat_get(bitmat& instance, uint8_t i, uint8_t j) {
    return static_cast<bool>(bitmat_get_exact(instance, i, j));
}
/// Prints bit matrix into console
/// \param instance initialized bitmat instance
void bitmat_print(bitmat& instance) {
    // There's many different ways to implement one function
    // 1. reminder of integer division by 2 returns 0 or 1 -> acceptable
    // 2. static_cast of boolean type to integers returns 0 or 1 -> acceptable
    for (int i = 0; i < instance.rows; ++i) {
        for (int j = 0; j < instance.columns; ++j) {
            std::cout << bitmat_get(instance, i, j) << " ";
        }
        std::cout << std::endl;
    }
}
/// Prints bit matrix into file
/// \param path filename
/// \param instance instance of bitmat
void bitmat_fprint(bitmat& instance, char * path){
    std::ifstream stream(path);
    if (!stream)
        return;

    for (int i = 0; i < instance.rows; ++i) {
        for (int j = 0; j < instance.columns; ++j) {
            stream.out << bitmat_get(instance, i, j) << ' ';
        }

        stream.out << '\n';
    }
    stream.close();
}