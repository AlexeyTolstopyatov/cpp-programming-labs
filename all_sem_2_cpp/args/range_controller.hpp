//
// Created by atvlg on 18.09.2025.
//

#ifndef WATCOM_TMP_RANGE_CONTROLLER_HPP
#define WATCOM_TMP_RANGE_CONTROLLER_HPP


class RangeController {
private:
    int safe_size;
    int max_bound;
    int min_bound;
    void make_array();
    int * array;
public:
    void print_array();
    int get_size() const;
    int ** get_array();
    /**
     * Makes an instance with default range.
     * Default range set in constructor (-30; +30);
     * @param count Count of entries in array array of integers.
     */
    explicit RangeController(int count) { // "single-argument" [.cctor]s must be marked *explicit* to avoid unintentional implicit cast
        safe_size = count;
        min_bound = -30;
        max_bound = +30;

        array = new int[count]; // resize an array.

        make_array();
    }
    /**
     * Makes an instance with manually set items range
     * Range bounds set in constructor method applies for each
     * array item in array of integers.
     * @param count Count of items in array
     * @param min_bound minimum integer
     * @param max_bound maximum integer
     */
    RangeController(int count, int min, int max) { // many arguments [.cctor] isn't language's casting feature
        safe_size = count;
        max_bound = max;
        min_bound = min;
        array = new int[count];

        make_array();
    }

    ~RangeController() {
        delete array;
    };
};


#endif //WATCOM_TMP_RANGE_CONTROLLER_HPP
