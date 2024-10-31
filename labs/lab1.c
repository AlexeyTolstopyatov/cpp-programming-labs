//
// Created by AlexeyTolstopyatov on 29.10.2024.
//

#include "lab1.h"
 /*
  * Age Calculator
  * Выводит информацию о возрасте, на основе
  * года рождения.
  */
void calc() {
    char name[30];
    int age;

    scanf("%s", name);
    scanf("%d: ", &age);

    printf("\n%s\n%d", name, age);
}

/*
 * Information
 * выводит введенную информацию
 */
void info(){
    char
        name[30],
        surname[30],
        fathername[30],
        city[30],
        school[20];
    int age = 0;
    scanf("%s", name);
    scanf("%s", surname);
    scanf("%s", fathername);
    scanf("%s", school);
    scanf("%s", city);

    printf("%s\n", name);
    printf("%s\n", surname);
    printf("%s\n", fathername);
    printf("Finished school %s\n", school);
    printf("From %s city\n", city);
}

/*
 * Set Numerics
 * выводит подробную информацию о введенных данных
 */
void setno(){
    int i4 = 0;
    unsigned int u4 = 0;
    float f2 = 0;
    double f4 = 0;

    printf("Waiting negative Integer value:");
    scanf("%d", &i4);
    printf("Waiting positive Integer value:");
    scanf("%ud", &u4);
    printf("Waiting positive float value:");
    scanf("%f", &f2);
    printf("Waiting negative float value:");
    scanf("%lf", &f4);

    printvt(&i4, &u4, &f2, &f4);
}

/*
 * Print Values Table
 * выводит таблицу значений
 */
static void printvt(const int * i32,
                    const unsigned int * u32,
                    const float * f32,
                    const double * f64){
    printf("Integer Positive\t%u\n", *u32);
    printf("Integer Negative\t%d\n", *i32);
    printf("Floating-point Positive\t%f\n", *f32);
    printf("Floating-point Negative\t%f\n", *f64);
}

/*
 * Difference
 * Выводит сумму и разность двух введенных чисел (i32)
 */
void diff(){
    int acc = 0,
        base = 0;

    printf("Accumulator: ");
    scanf("%d", &acc);
    printf("Base: ");
    scanf("%d", &base);

    printf("a + b = %d\n", (acc + base));
    printf("|a - b| = %d\n", abs((acc - base)));

    /* Нельзя допустить b = 0 */
    if (base != 0) {
        printf("a / b = %f\n", ((float)acc / (float)base));
        printf("floor %d\n", acc / base);
        printf("reminder %d\f", acc % base);
    }
}

/*
 * Division
 * Производит операции деление,
 * взятие остатка и округление
 */
 void divv(){
    int
        acc = 0,
        base = 0;

    printf("Accumulator: ");
    scanf("%d", &acc);
    printf("Base: ");
    scanf("%d", &base);

    /* Нельзя допустить b = 0 */
    if (base != 0) {
        printf("a / b = %f\n", ((float)acc / (float)base));
        printf("floor %d\n", acc / base);
        printf("reminder %d\f", acc % base);
    }
    else
    {
        printf("Division by zero.");
    }
 }

/*
 * Centre
 * Выводит среднее арифметическое число
 * на основании массива (i32)
 */
void centre(){
    const int segment[5] = {
            1,
            2,
            54,
            46,
            66,
    };
    int sum = 0;

    //      Почему в качестве границы не надо брать sizeof(segment)?
    // Потому что sizeof размер элемента с учетом типа данных
    // Всего в массиве 5 ячеек, но в каждой содержится int32_t значение
    // 5 * 4 (байта) = 20 байт. потому что int32 это 32 бита => 8 * 4 бита => 4 байта.
    printf("SizeOf(segment)=%zu\n", sizeof(segment));

    for (int i = 0; i < 5; ++i) {
        sum += segment[i];
        printf("[%d]=%d\n", i, segment[i]);
    }
    printf("sum=%d\n", sum);
    size_t cnt = sum / sizeof(segment);

    printf("Centre: %zu\n", cnt);
}

/*
 * Byte-Logical operations result
 * Выводит результаты побитовых операций
    1. a=a&b;
    2. a&=b;
    3. a=a|b;
    4. a|=b;
    5. a=a+b;
    6. a+=b;
    7. a=a*b;
    8. a*=b;
 *
 */
void blresult(){
    unsigned char
        a = 0xAA,
        b = 0xFF; // byte (0..255)
    printf("BITE AND\t%c\n", a & b);
    printf("BITE OR\t%c\n", a | b);
    printf("SUM\t%c\n", a + b);
    printf("MUL\t%c\n", a * b);
    a += b;
    printf("SUM EQ\t%c\n", a);
    a = 0xAA;
    a &= b;
    printf("AND EQ\t%c\n", a);
    a = 0xAA;
    a |= b;
    printf("OR EQ\t%c\n", a);
    a = 0xFF;
    a += b;
    printf("a + ++b\t%c\n", a + ++b);
    printf("a + b++\t%c\n", a + b++);
    a = 0xFF;
    a *= b; // подозреваю усечение данных.
    printf("a * b\t%c\n", a);
    b <<= 1;
    a >>= 1;
    printf("b >> 1\t%c\n", a);
    printf("a << 1\t%c\n", b);
    a = 0xFF;
    b = 0xAA;
    printf("%c", a ^ b);
}
/*
 * Rectangle
 * Выводит площадь и периметр прямоугольника
 * (Вариант 1: Квадрат)
 */
void rect(){
    int a = 324;
    printf("Summary of all sides: %d", a * 2);
    printf("Square of figure: %d", a * a);
}

/*
 * Expression
 * Считает выражение, указанное в варианте
 * (Вариант 1: (a+b*c)(a-b/c)
 *      a = 1.25
 *      b = 3.3
 *      c = 10)
 */
void expron() {
    float
        a = 1.25,
        b = 3.3,
        c = 10;
    printf("(a+b*c)(a-b/c) = %f", ((a+b*c)*(a-b/c)));
}