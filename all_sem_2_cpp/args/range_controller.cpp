//
// Created by atvlg on 18.09.2025.
//

#include "range_controller.hpp"
#include <ctime>
#include <cstdlib>
#include <cstdio>

void RangeController::make_array() {
    // array already initialized from [...cctor]
    // time to initialize random
    srand(static_cast<int>(time(nullptr)));

    for (int i = 0; i < safe_size; i++)
    {
        bool same;
        do
        {
            same = false;
            array[i] = rand() % max_bound + min_bound; // SIGSEGV?

            // Check if the new array number is a duplicate:
            for (int check = 0; check < i; check++)
            {
                if (array[i] == array[check])
                {
                    same = true;
                    break;
                }
            }
        } while (same);
    }
}

void RangeController::print_array() {
    printf("[ ");

    for (int i = 0; i < safe_size; ++i) {
        printf("%d ", array[i]);
    }
    printf("]\r\n");
}

int RangeController::get_size() const {
    return safe_size;
}
int ** RangeController::get_array() {
    return &array;
}