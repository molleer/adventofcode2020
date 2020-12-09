# cmake_minimum_required(VERSION <specify CMake version here>)
project(adventofcode2020)

set(CMAKE_CXX_STANDARD 17)

add_executable(adventofcode2020 src/day1/day1.hpp src/FileReader.cpp src/FileReader.h src/main.cpp)
