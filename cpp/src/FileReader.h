//
// Created by David on 2020-12-09.
//

#ifndef ADVENTOFCODE2020_FILEREADER_H
#define ADVENTOFCODE2020_FILEREADER_H

#include <string>
#include <vector>
#include <sstream>
using namespace std;

class FileReader {
public:
    static vector<string>* read(const string &path);
    static int str_to_int(const string &str) {
        stringstream ss(str);
        int num;
        ss >> num;
        return num;
    }
};


#endif //ADVENTOFCODE2020_FILEREADER_H
