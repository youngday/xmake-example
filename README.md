# xmake-example

## local dependent packages

wei get from github and cmake or xmake ,and installed.
  xmake install --admin 
  at /usr/local/

* cpplinuxserial
* gnuplot ,apt install .

## xmake package

* matplotplusplus
like matplotlib of python,data analyzer .
* rapidcsv
read datas from csv file,and plot them out.

## example

### coost example

udp ,tcp,flag_cli

### other examples

lock-free concurrentqueue, cppzmq, matplot,csv
🐞

### ffmpeg example

forked from 

[opencv_ffmpeg_streaming](https://github.com/andreanobile/opencv_ffmpeg_streaming)

run zlmediakit:

```sh
sudo ./zlmediakit
```

check your v4l2 carmera dev/video?

```cpp
video_fname = std::string("0");
```

|function|lib|alternate|note|
|-|-|-|-|
|frame|coost|boost, asio, libhv|lightweight frame work|
|argparse|co/flag|argparse, cli++|cmd line param parser|
|log|quill|co/log fmtlog loguru |lightweight log|
|csv|rapidcsv|csv2 |csv parser|
|structor data file|npy|csv |share numpy files|
|queue|concurrentqueue|mpmcqueue|lock-free concurrent queue|
|serial port|cpplinuxserial|asio,cserialport,libserial|ws|
|udp/tcp|coost|| udp tcp http with coroutine|
|http/websocket|cinatra|cpr|http websocket|
|zero mq|cppzmq||message queue between other language|
|plot|matplotplusplus|cvplot|plot 2D/3D ,depend on gnuplot|
|json|nlohmann_json|co::Json,rapidjson|co::Json output fastring,not std::string,rapidson ,not update often|
|format|fmt|cout|print vector directly,with LOG_S(INFO)<< fmt::format("vector data:{}",data),#include "fmt/core.h",#include "fmt/ranges.h"|
|stream|ffmpeg||video streamer|
