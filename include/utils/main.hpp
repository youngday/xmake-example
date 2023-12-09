#ifndef MAIN_HPP
#define MAIN_HPP

#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <future>
#include <iostream>
#include <memory>
#include <sstream>
#include <string>
#include <string_view>
#include <thread>

#include "co/all.h"
#include "loguru.hpp"
#include "mytime.hpp"
#include "nlohmann/json.hpp"
#include <yaml-cpp/yaml.h>

#include <fmt/core.h>
#include <fmt/ranges.h>

#include "log.hpp"

struct YamlParam {
  std::string userName;
  std::string passWord;
  std::string serialNum;

  std::string pcLocalIP;
  std::string pcRemoteIP;
  std::string cppLocalIP;
  std::string cppRemoteIP;
  std::string javaLocalIP;
  std::string javaRemoteIP;
  std::string PLCIP;
  std::string PLCPort;
  std::string sendPLCPort;
  std::string rcvPLCPort;
};

 extern quill::Logger *logger;

#endif // MAIN_HPP
