#include "main.hpp"
using std::cout, std::endl, std::string;
using namespace simdjson;

int main(int argc, char **argv) {
  quill_init();
  LOG_INFO(logger, "⏰ Starting at {}!\n", mylocal_time());

  ondemand::parser parser;
  // auto sjson = padded_string::load("twitter.json"); // load JSON file
  auto cars_json = R"( [
  { "make": "Toyota", "model": "Camry",  "year": 2018, "tire_pressure": [ 40.1, 39.9, 37.7, 40.4 ] },
  { "make": "Kia",    "model": "Soul",   "year": 2012, "tire_pressure": [ 30.1, 31.0, 28.6, 28.7 ] },
  { "make": "Toyota", "model": "Tercel", "year": 1999, "tire_pressure": [ 29.8, 30.0, 30.2, 30.5 ] }
] )"_padded;

  cout << "cars_json:" << cars_json.data() << endl;


  auto doc = parser.iterate(cars_json);
  auto value = doc.get_array().at(0)["tire_pressure"].get_array().at(0).get_double();

  cout << value << endl; // Prints 3.14

  return 0;
}