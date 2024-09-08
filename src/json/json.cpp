#include "main.hpp"
#include <string>
#include <vector>
using std::cout, std::endl, std::string, std::vector;
using namespace simdjson;

int main(int argc, char **argv) {
  quill_init();
  LOG_INFO(logger, "⏰ Starting at {}!\n", mylocal_time());
  logger->flush_log();

  // auto sjson = padded_string::load("twitter.json"); // load JSON file
  auto cars_json = R"( [
  { "make": "Toyota", "model": "Camry",  "year": 2018, "tire_pressure": [ 40.1, 39.9, 37.7, 40.4 ] },
  { "make": "Kia",    "model": "Soul",   "year": 2012, "tire_pressure": [ 30.1, 31.0, 28.6, 28.7 ] },
  { "make": "Toyota", "model": "Tercel", "year": 1999, "tire_pressure": [ 29.8, 30.0, 30.2, 30.5 ] }
] )"_padded;

  string j_str = cars_json.data();
  LOG_INFO(logger, "j_str:\n{0}", j_str);
// dom vector ++++++++++++++++++++++++++++++++++++++++++++
  dom::parser dom_parser; // dom
  vector<double> vec_tire_pressure{};
  auto dom_cars = dom_parser.parse(cars_json);
  auto dom_tire_pressure=dom_cars.get_array().at(0)["tire_pressure"];
    double total_tire_pressure = 0;
    for (double data:dom_tire_pressure) {
      vec_tire_pressure.emplace_back(data);
    }

LOG_INFO(logger, "vec_tire_pressure size:{0},data:\n{1}", vec_tire_pressure.size(),vec_tire_pressure);


  // // dom+++++++++++++++++++++++++++++++++++++++++
  // // dom::parser dom_parser; // dom
  // // Iterating through an array of objects
  // for (dom::object car : dom_parser.parse(cars_json)) {
  //   cout << "Make/Model: " << car["make"] << "/" << car["model"] << endl;
  //   uint64_t year = car["year"];
  //   cout << "- This car is " << 2020 - year << "years old." << endl;
  //   double total_tire_pressure = 0;
  //   for (double tire_pressure : car["tire_pressure"]) {
  //     total_tire_pressure += tire_pressure;
  //   }
  //   cout << "- Average tire pressure: " << (total_tire_pressure / 4) << endl;
  //   for (auto field : car) {
  //     cout << "car: - " << field.key << ": " << field.value << endl;
  //   }
  // }
  return 0;
}
