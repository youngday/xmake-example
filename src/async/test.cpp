#include "main.hpp"
#include <cstdio>
#include <future>
#include <string>
using std::string, std::this_thread::sleep_for;
using namespace std::literals;
using std::chrono::steady_clock;
// a non-optimized way of checking for prime numbers:
bool is_prime(int x) {
  LOG_INFO(logger,"Calculating. Please, wait...");
  for (int i = 2; i < x; ++i)
    if (x % i == 0)
      return false;
  return true;
}

int main() {

  quill_init();
  auto time_str = mylocal_time();

  LOG_INFO(logger, "⏰Starting at {}!", time_str);
  logger->flush_log();

  // auto start = steady_clock::now();
std::string out_str;

 char data[5]={0,1,2,3,0x0a};

  for(int i=0;i<5;i++){
    // out_str.append(std::to_string(data[i]));
    // out_str.append(",");
    char asc_str[2];
    snprintf(asc_str, 2, "%x",data[i]);
    out_str.append(asc_str);
    out_str.append(",");
  }
   LOG_INFO(logger,"test:{0}",out_str.c_str());

  // while (true) {


  //   LOG_INFO(logger,"while.");
  //   sleep_for(3s);
  // }

  return 0;
}
