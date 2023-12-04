# xmake-example

## local dependent packages

wei get from github and cmake or xmake ,and installed.
  xmake install --admin 
  at /usr/local/

* cpplinuxserial
* coost with latest source code
* gnuplot ,apt install .

## xmake package

* cpr
* matplotplusplus
like matplotlib of python,data analyzer .
* rapidcsv
read datas from csv file,and plot them out.

## example

### coost example

udp ,tcp,flag_cli

### other examples

lock-free concurrentqueue, cppzmq,loguru matplot,csv
🐞

|function|lib|alternate|note|
|-|-|-|-|
|frame|coost|boost, asio, libhv|lightweight frame work|
|argparse|co/flag|argparse, cli++|cmd line param parser|
|log|loguru(add quill)|co/log fmtlog glog spdlog|lightweight log|
|csv|rapidcsv|csv2 |csv parser|
|queue|concurrentqueue|mpmcqueue|lock-free concurrent queue|
|serial port|cpplinuxserial|asio,cserialport,libserial|ws|
|udp|co/udp||coost udp with coroutine|
|tcp|co/tcp||coost tcp with coroutine|
|http|cpr|cpp-httplib|http restful|
|zero mq|cppzmq||message queue between other language|
|plot|matplotplusplus|cvplot|plot 2D/3D ,depend on gnuplot|
|json|nlohmann_json|co::Json,rapidjson|co::Json output fastring,not std::string,rapidson ,not update often|
|format|fmt|cout|print vector directly,with LOG_S(INFO)<< fmt::format("vector data:{}",data),#include "fmt/core.h",#include "fmt/ranges.h"|
