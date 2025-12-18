//
// Created by atvlg on 18.09.2025.
//

#ifndef WATCOM_TMP_ARGUMENTS_HPP
#define WATCOM_TMP_ARGUMENTS_HPP

/**
 * This is a registered values of possible sorting algorithms
 */
enum SortingType {
    ShellSort = 1,
    DirectInsertionSort = 2,
};

/**
 * Specially demonstraction of class
 * for proof of C++ skills.
 *
 * This class has one main task - actually resolve arguments
 * lookup table. Procedures representing here encapsulates
 * the "main(...) -> i32" procedure logic
 */
class Arguments {
private:
    int alg_type;
    int alg_target;
    int args_count;
    char ** args_vector;

    static void show_manual_page();
public:
    bool is_valid();
    int get_target();
    SortingType get_sorting_type() const;

    Arguments(int argc, char ** argv) {
        args_count = argc;
        args_vector = argv;

        // special values which set by default; Tells about "How was the initialization passed?"
        alg_target = -1;
        alg_type = -1;
    }

    ~Arguments() = default; // OS automatically decides "how to release resources?"
};


#endif //WATCOM_TMP_ARGUMENTS_HPP
