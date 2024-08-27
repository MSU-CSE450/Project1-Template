// -- Some header files that are likely to be useful --
#include <fstream>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

// -- Uncomment the line below once you have setup your lexer! --
// #include "lexer.hpp"

int main(int argc, char * argv[])
{
  if (argc != 2) {
    std::cout << "Format: " << argv[0] << " [filename]" << std::endl;
    exit(1);
  }

  std::string filename = argv[0];
  // -- Replace the line below with code to load in the file and interpret its contents --
  std::cout << "Replace me with a microCalc interpreter!!" << std::endl;
}
