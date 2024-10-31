cmake_minimum_required(VERSION 3.28)
project(labs C)

set(CMAKE_C_STANDARD 99)

add_executable(labs main.c
        labs/lab1.h
        labs/lab1.c)
