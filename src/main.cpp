#include "main.hpp"
#include "pthread.h"

using namespace std;

extern int folderTest();
extern int tcp_client();
// extern int sqlite_orm_app();
extern int xtensor_test();
extern int cppzmq_app();
extern int tcp_client_coro(int argc, char **argv);

int main(int argc, char *argv[]) {
  auto time_str = mylocal_time();

  filesystem::path folder_path = "./log_quill/";
  filesystem::create_directory(folder_path);

  



  // xtensor_test();

  tcp_client_coro(argc, argv);
  //  for(;;){
  //   co::sleep(10000);
  //  }
  // sqlite_orm_app();

  //  cppzmq_app();
  for (;;) {
    co::sleep(10000);
  }
  // return app.exec();
}
