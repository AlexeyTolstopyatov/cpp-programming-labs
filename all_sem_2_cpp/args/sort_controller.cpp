//
// Created by atvlg on 19.09.2025.
//

#include "sort_controller.hpp"
#include <cstdio>

void SortController::print_array() {
    printf("[ ");

    for (int i = 0; i < safe_size; ++i) {
        printf("%d ", array[i]);
    }
    printf("]\r\n");
}
/**
 * Prints size_t pointer of array
 */
void SortController::print_location() {
    printf("base of 1'st item: 0x%p\r\n", array);
}
/**
 * Represents the Shell's sorting algorithm with
 * default step per 1 entry in the array.
 *
 * Just replaces the elements in unsafe array
 * @param array unsafe dynamic array of integers
 * @param safe_size actual count of elements in array
 */
void SortController::replace_by_shellsort() {
    auto h = 1;

    // let startup interval will be Martin Ciura's sequence
    while (h < safe_size / 3) {
        h = h * 3 + 1;
    }

    // make interval less by the iteration
    while (h > 0) {
        for (int i = h; i < safe_size; ++i) {
            int temp = array[i];
            int j;
            // replace item till the target position found
            for (j = i; j >= h && array[j - h] > temp; j -= h) {
                array[j] = array[j - h];
            }
            array[j] = temp;
        }
        h /= 3; // decrement interval
    }
}
/**
 * Implements the Insertion Sorting algorithm
 * only in single procedure.
 */
void SortController::replace_by_directsort() {
    for (int i = 1; i < safe_size; ++i) {
        for (int j = i; j > 0; --j) {
            if (array[j] < array[j - 1]) {
                int a = array[j];
                array[j] = array[j - 1];
                array[j - 1] = a;
            }
            else break;
        }
    }
}
/**
 * Tries to find target integer. Returns index to array or not changes value.
 * If target not found - pushes the target into array.
 * @param t target
 * @param result reference to the result cell.
 * @return true if found
 */
bool SortController::try_find(int t, int * result) {
    if (result == nullptr)
        return false; // <-- avoid dereference

    auto min = 0;
    auto max = safe_size - 1;

    while (min <= max) {
        int mid = (min + max) / 2; // integer middle value for the array
        if (t == array[mid]) {
            *result = mid;
            return true; // <-- force exit | save changes.
        }
        else if (array[mid] > t) {
            max = --mid;
        }
        else if (array[mid] < t) {
            min = ++mid;
        }
    }
    // if force exit at 88:13 not happened
    auto backup = array;
    auto backup_size = safe_size;

    array = new int[++safe_size]; // firstly update the array's size
    array[0] = t;  // <-- push the target.

    for (int i = 1; i < backup_size; ++i) {
        array[i] = backup[i];
    }

    return false;
}
