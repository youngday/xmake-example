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
|queue|concurrentqueue|atomic_queue|lock-free concurrent queue|
|serial port|cpplinuxserial|asio,cserialport,libserial|ws|
|tcp/http|coost||tcp http with coroutine|
|websocket|drogon/libhv(cross)|(uwebsocket not in xmake)|websocket|
|zero mq|cppzmq||message queue between other language|
|2D/3D plot|matplotplusplus|cvplot|plot 2D/3D static ,depend on gnuplot|
|2D/3D implot/implot3d|implot/implot3d|cvplot|plot 2D/3D,dynamic depend imgui|
|json|nlohmann_json|simdjson| simdjson just parser,do not have serializer,waiting for sonic-cpp having cross fun|
|base64|simdutf|cppcodec|simd depend|
|format|fmt|cout|print vector directly,with LOG_S(INFO)<< fmt::format("vector data:{}",data),#include "fmt/core.h",#include "fmt/ranges.h"|
|stream|ffmpeg||video streamer|
|database orm|sqlite_orm||database orm|



⏰🔑
