//
// Created by David on 2020-12-09.
//

#include "FileReader.h"
#include <fstream>

using namespace std;

vector<string>* FileReader::read(const string &path) {
    ifstream stream(path);
    auto *input = new vector<string>();
    string line;

    if(stream.is_open()){
        while(getline(stream, line))
            input->push_back(line);
    }
    return input;
}