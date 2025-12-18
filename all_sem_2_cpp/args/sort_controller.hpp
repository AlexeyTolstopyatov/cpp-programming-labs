//
// Created by atvlg on 19.09.2025.
//

#ifndef WATCOM_TMP_SORT_CONTROLLER_HPP
#define WATCOM_TMP_SORT_CONTROLLER_HPP


class SortController {
private:
    int * array;
    int safe_size;
public:
    void print_array();
    void print_location();
    void replace_by_shellsort();
    void replace_by_directsort();
    bool try_find(int t, int * result);

    SortController(int * array_copy, int size) {
        array = array_copy;
        safe_size = size;
    }

    ~SortController() = default;
};


#endif //WATCOM_TMP_SORT_CONTROLLER_HPP
