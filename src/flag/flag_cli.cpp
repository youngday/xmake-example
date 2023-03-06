#include "main.h"

DEF_bool(btest,false,"bool test",b);
DEF_string(stest, "hello", "xxx",s);

int main(int argc, char** argv) {
   flag::init(argc, argv);
    
   if (!FLG_btest) std::cout << "b is false" << std::endl;
   FLG_stest += " world";
   std::cout << FLG_stest << std::endl;
    
    return 0;
}