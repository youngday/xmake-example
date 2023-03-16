#include "main.h"
#include "nlohmann/json.hpp"

using std::cout,std::endl,std::string;

int main(int argc, char** argv) {


using json = nlohmann::json;

json ex1 = json::parse(R"(
  {
    "pi": "3.141",
    "happy": true
  }
)");

cout<<"ex1_pi:"<<ex1["pi"].get<string>()<<endl;

cout<< ex1.dump()<<endl;
cout<< json::parse(ex1.dump())<<endl;

    return 0;
}