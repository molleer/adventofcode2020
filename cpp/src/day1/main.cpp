//
// Created by David on 2020-12-08.
//
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include "../FileReader.h"

using namespace std;

int main() {
    auto *input = FileReader::read("../input/day1.txt");
    int *nums = new int[input->size()];
    for(int i = 0; i<input->size(); i++)
        nums[i] = FileReader::str_to_int(input->at(i));

    for(auto i = 0; i < input->size(); i++)
        for(auto j = i+1; j < input->size(); j++)
            for(auto k = j+1; k < input->size(); k++)
                if(nums[i] + nums[j] + nums[k] == 2020){
                    cout << nums[i] * nums[j] * nums[k] << endl;
                    return 0;
                }
    return 0;
}