#include "args/arguments.hpp"
#include "args/range_controller.hpp"
#include "args/sort_controller.hpp"
#include <cstdio>

/*
 * Задание для Толстопятова Алексея
 * Заданный массив целых чисел _упорядочить_ **методом прямой вставки** или **методом Шелла**
 * (алгоритм сортировки выбирает пользователь – диалог с пользователем при запуске программы,
 * массив вводится пользователем или генерируется псевдослучайным образом).
 *
 * Для заданного целого числа определить, содержится ли оно в массиве (использовать бинарный
 * поиск); если да, то найти его индекс, если нет, то добавить его с сохранением упорядоченности
 * массива.
 *
 * Каждый алгоритм – в виде отдельной функции; использовать динамические массивы
 * (распределение памяти с помощью new), не использовать STL (контейнеры типа vector и тп,
 * готовые алгоритмы – нельзя).
 *
 */

int main(int argc, char ** argv) {
    auto args_ptr = new Arguments(argc, argv);

    if (!args_ptr->is_valid()) {
        return -1; // rax will hold this win32 execution state
    }

    auto type = args_ptr->get_sorting_type();
    auto randomctl_ptr = new RangeController(13);
    auto sortctl_ptr = new SortController(*randomctl_ptr->get_array(), randomctl_ptr->get_size());

    auto item_index = -1;
    sortctl_ptr->try_find(args_ptr->get_target(), &item_index);

    switch (type) {
        case SortingType::ShellSort:
            sortctl_ptr->replace_by_shellsort();
            break;
        case SortingType::DirectInsertionSort:
            sortctl_ptr->replace_by_directsort();
            break;
    }

    if (item_index >= 0){
        printf("target integer {%d} stores by array[%d]", args_ptr->get_target(), item_index);
    }
    else {
        printf("target wasn't found and pushed to the array.");
    }

    sortctl_ptr->print_location(); // verbose output
    sortctl_ptr->print_array();

    delete randomctl_ptr;
    delete sortctl_ptr;
    delete args_ptr; // free heap information
    return 0;        // [rax] stores this value after far call.
                     // Use FastCall to clear registers and stack
}