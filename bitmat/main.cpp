#include "bitmat.hpp"
#include <iostream>

int main() {
    struct bitmat mat{
        .rows = 4,
        .columns = 4,
        .data = new uint64_t[4] // <-- heap allocation required
    };

    for (int i = 0; i < 4; ++i) {
        mat.data[i] = 0;
    }

    for (int i = 0; i < 4; ++i) {
        bitmat_set(mat, i, i);
    }

    bitmat_print(mat);

    delete mat.data; // <-- release heap
    return 0;
}
