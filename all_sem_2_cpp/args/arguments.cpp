//
// Created by atvlg on 18.09.2025.
//


// imported modules are not part of STL
// they are specially rewritten to C++ parts of C standard library
#include "arguments.hpp"
#include "cstdio"
#include "cstdlib"

/**
 * Static private procedure, calls when "is_valid() -> bool" returns false.
 */
void Arguments::show_manual_page() {
    printf("Usage: \r\n");
    printf("--alg <integer>  Algotithm type\r\n");
    printf("                 1 -- Shell's Algorithm\r\n");
    printf("                 2 -- Direct insertion\r\n");
    printf("--seek <integer> Target integer value what needed to be found\r\n");
}

/**
 * Checks out commandline arguments for current
 * app session.
 *
 * @return false and that means application must free all resources
 *         true if all conditions passed and application
 */
bool Arguments::is_valid() {
    // default count of arguments:
    // ./app --alg 1 --seek 100
    //   0      1  2     3   4
    if (args_count != 5) {
        show_manual_page();
        return false; // <-- unexpected count of args.
    }
    // try extract specific values
    int dw_alg_type = atoi(args_vector[2]);
    int dw_target = atoi(args_vector[4]);

    if (dw_alg_type != 1 && dw_alg_type != 2) {
        show_manual_page();
        return false;
    }
    // save changes and exit
    alg_type = dw_alg_type;
    alg_target = dw_target;

    return true;
}

SortingType Arguments::get_sorting_type() const {
    return static_cast<SortingType>(alg_type);
}

int Arguments::get_target() {
    return alg_target;
}
