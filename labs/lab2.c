//
// Created by MagicBook on 31.10.2024.
//
#include "lab2.h"

/*
 * Members Summary
 * Сумма членов последовательности от ... до ...
 */
void membersum(int from, int to){
    int sigma = 0;
    for (int i = from; i < to; ++i){
        sigma += i;
    }
    wprintf(L"Сумма чисел от %d до %d: %d", from, to, sigma);
}

/*
 * Members Scan
 * Сумма чисел последовательности от ... до ...
 * (Указывается вручную)
 */
void memberscan() {
    /*membersum(40, 50);*/
    int from = 0, to = 0, sigma = 0;
    wprintf(L"Введите число [n]:");
    wscanf(L"%d", &from);
    wprintf(L"Введите число [N]:");
    wscanf(L"%d", &to);

    for (int i = from; i < to; ++i){
        sigma += i;
    }
    wprintf(L"Сумма чисел от %d до %d: %d", from, to, sigma);
}

/*
 * Members Scan (While)
 * Сумма чисел последовательности от ... до ...
 * (Указывается вручную)
 * (использовать while)
 */
void memberscanw(){
    int from = 0, to = 0, sigma = 0, i = 0;
    wprintf(L"Введите число [n]:");
    wscanf(L"%d", &from);
    wprintf(L"Введите число [N]:");
    wscanf(L"%d", &to);
    while (i < to){
        sigma += i;
        ++i;
    }
}

/*
 * Members Summary (While)
 * Сумма чисел последоваательноти от ... до ...
 *
 */
void membersumw(int from, int to){
    int sigma = 0, i = 0;
    while(i < to){
        sigma += i;
        ++i;
    }
    wprintf(L"Сумма чисел от %d до %d: %d", from, to, sigma);
}

/*
 * Print Sequence
 * Выводит последовательность чисел на экран
 * удовлетворяющую условию (Вариант 1)
 * (Все нечетные числа до 100)
 */
void printseq(){
    for (int i = 1; i < 100; i += 2){
        // Модель нечетного числа: 2n + 1, при условии, что n > 0
        printf("%d\n", i);
    }
}

/*
 * Print Sequence (While)
 * Выводит последовательность чисел на экран
 * которая удовлетворяет условию (Вариант 1)
 * (Все нечетные числа до 100)
 * (Использовать While)
 */
void printseqw(){
    int i = 1;
    while (i < 100){
        printf("%d ", i);
        i += 2;
    }
}

/*
 * Members Summary Do
 * Сумма чисел последовательности от ... до ...
 * (Вариант 1)
 * (Использовать do-while)
 */
void membersumdw(int from, int to){
    int i = 0, sigma = 0;
    do {
        i++;
        sigma += i;
    }while (i < to);
    wprintf(L"Сумма чисел %d от до %d: %d", from, to, sigma);
}

/*
 * Members Scan Do
 * Сумма чисел последовательности от ... до ...
 * (Вариант 1)
 * (Использовать do-while)
 */
void memberscandw(){
    int from = 0, to = 0, sigma = 0, i = 0;
    wprintf(L"Введите число [n]:");
    wscanf(L"%d", &from);
    wprintf(L"Введите число [N]:");
    wscanf(L"%d", &to);
    do{
        i++;
        sigma += i;
    }while(i < to);
    wprintf(L"Сумма чисел %d от до %d: %d", from, to, sigma);
}

/*
 * Wide-String Maximum
 * Возвращает максимальное число из трех переданных
 */
int wmax(int a, int b, int c){
    return (a < b < c) ? c : (a < c < b) ? b : a;
}

/*
 * Wide-String Minimum
 * Возвращает минимальное число из трех переданных
 */
int wmin(int a, int b, int c){
    return abs(wmax(-a, -b, -c));
}

/*
 * Wide-string Mark Message
 * Выводит сообщение о вашей успеваемости (на основе балла)
 */
void wmark(){
    int m = 0;
    wprintf(L"Введите оценку (балл):");
    wscanf(L"%d", &m);
    wprintf(L"Ваша оценка: ");

    if (m >= 55 & m < 69) {
        wprintf(L"Удовлетворительно");
    }
    else if (m >= 70 && m < 89){
        wprintf(L"Хорошо!");
    }
    else if (m >= 90 && m <= 100){
        wprintf(L"Отлично!");
    }
    else {
        wprintf(L"Недовлетворительно!");
    }
}

/*
 * Wide-String Number Revision
 * С помощью оператора switch распознает: понравилось ли число
 * или нет.
 */
void wnum(){
    wprintf(L"Введите цифру");
    int n = 0;
    wscanf(L"%d", &n);
    switch (n) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            wprintf(L"Вы ввели: %d", n);
            break;
        default:
            wprintf(L"Нельзя было что-то проще придумать?");
            break;
    }
}

