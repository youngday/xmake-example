#ifndef MAIN_H
#define MAIN_H

#include <memory>
#include <iostream>
#include <sstream>
#include <cstdlib>
#include <cstdlib>
#include <cstring>
#include <string>
#include <filesystem>
#include <future>
#include <thread>
#include "xpack/json.h" // Json包含这个头文件，xml则包含xpack/xml.

#include <yaml-cpp/yaml.h>

#include"loguru.hpp"
#include "co/all.h"
#include "mytime.hpp"

struct YamlParam
{
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

  bool debugPC2;
  bool debugCpp;
  bool debugJava;
};


#endif // MAIN_H