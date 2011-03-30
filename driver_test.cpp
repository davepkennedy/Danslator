#include "driver.h"
#include <iostream>
#include <sstream>

int main (int argc, char* argv)
{
    int token;
    std::ostringstream stream;
    Driver d (&std::cin, &stream);
    d.parse ();
//    std::cout << "Parse complete" << std::endl;
    std::cout /*<< "Parse data "*/ << stream.str () << std::endl;
    return 0;
}
