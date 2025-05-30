set_xmakever("2.9.0")
set_project("xmake-example")
set_languages("c++20")
-- set_policy("build.warning", true)--warn
-- set_warnings("all", "extra")--warn
add_rules("mode.debug", "mode.release")
-- https://xmake.io/mirror/zh-cn/plugin/more_plugins.html
-- add_rules("plugin.compile_commands.autoupdate", {outputdir = ".vscode"})
add_rules("plugin.compile_commands.autoupdate")

add_requires("opencv", {system = true})
add_requires("openssl", {alias = "openssl", configs = { options = "OpenSSL:shared=True" }})
add_requires( "nlohmann_json 3.11.3","simdutf 6.2","yaml-cpp 0.8.0", "toml++ 3.4.0","quill 8.2","fmt 11.1")
add_requires( "cppzmq 4.10.0","argparse 3.2","atomic_queue 1.5.0","concurrentqueue 1.0.4","libhv 1.3.3")
add_requires("xsimd 11.0.0","xtensor 0.25.0","xtensor-blas 0.20.0","xtl 0.7")

add_requires("libaio 0.3.113","drogon 1.9.8")
add_requires("sqlite_orm 1.9 ", "sqlite3 3.45.0+300")
add_requires("matplotplusplus 1.2.1")--gnuplot 2d/3d
add_requires("glad 0.1.36","nativefiledialog-extended 1.1.1","cxxopts 3.2.1","libcurl 8.5.0")
-- for ffmpeg c lib, require and link static lib
-- https://github.com/xmake-io/xmake/issues/4089

add_requires("libavutil")
add_requires("libavcodec")
add_requires("libavformat")
add_requires("libavdevice")
add_requires("libavfilter")
add_requires("libswscale")
add_requires("libswresample")
add_requires("libpostproc")


add_packages( "nlohmann_json","simdutf","yaml-cpp", "toml++","quill","fmt")
add_packages( "cppzmq","argparse","atomic_queue","concurrentqueue","libhv")
add_packages("xtensor","xtensor-blas","xtl","xsimd")
add_packages("drogon")
add_packages("sqlite_orm","sqlite3")

add_links("atomic") --NOTE: clang donot link atomic ,need add manually .if not ,issue:undefined reference to `__atomic_is_lock_free'

add_includedirs("src/utils")
add_files("src/utils/*.cpp")

add_includedirs("src/")
target("test")
    set_kind("binary")
    add_files("src/async/test.cpp")

target("sqlite_orm")
    set_kind("binary")
    add_files("src/sqlite_orm/main.cpp")

-- config log
target("config_toml")
    set_kind("binary")
    add_files("src/config/config_toml.cpp")
    
target("serial")
    set_kind("binary")
    add_linkdirs("lib")
    add_links("CppLinuxSerial")
    add_files("src/serial/FlowControl.cpp")
    add_includedirs("src/CppLinuxSerial")

-- noblock mpmc_block mpmc_bulk
target("queue_nonblock")
    set_kind("binary")
    add_files("src/concurrentqueue/nonblock.cpp")

target("queue_block")
    set_kind("binary")
    add_files("src/concurrentqueue/block.cpp")

-- add_links("atomic") --NOTE: clang donot link atomic ,need add manually .if not ,issue:undefined reference to `__atomic_is_lock_free'
target("atomic_queue")
    set_kind("binary")
    add_files("src/atomic_queue/example.cc")
target("atomic_queue_block")
    set_kind("binary")
    add_files("src/atomic_queue/block.cpp")
target("atomic_queue_nonblock")
    set_kind("binary")
    add_files("src/atomic_queue/nonblock.cpp")

target("json")
    set_kind("binary")
    add_files("src/json/json.cpp")
target("async")
    set_kind("binary")
    add_files("src/async/async.cpp")
    -- drogon
target("http_file_upload")
    set_kind("binary")
    add_files("src/drogon/file_upload/file_upload.cc")
target("websocket_client")
    set_kind("binary")
    add_files("src/drogon/websocket_client/WebSocketClient.cc")
target("websocket_server")
    set_kind("binary")
    add_files("src/drogon/websocket_server/WebSocketServer.cc")


-- libhv
target("hv_udp_client")
    set_kind("binary")
    add_files("src/hv_udp/UdpClient_test.cpp")
target("hv_udp_server")
    set_kind("binary")
    add_files("src/hv_udp/UdpServer_test.cpp")        
target("hv_tcp_client")
    set_kind("binary")
    add_files("src/hv_tcp/TcpClient_test.cpp")
target("hv_tcp_client_loop")
    set_kind("binary")
    add_files("src/hv_tcp/TcpClientEventLoop_test.cpp")
target("hv_tcp_server")
    set_kind("binary")
    add_files("src/hv_tcp/TcpServer_test.cpp")    
target("hv_http_client")
    set_kind("binary")
    add_files("src/hv_http/http_client_test.cpp")
target("hv_http_server")
    set_kind("binary")
    add_files("src/hv_http/http_server_test.cpp")    
target("hv_websocket_client")
    set_kind("binary")
    add_files("src/hv_websocket/websocket_client_test.cpp")
target("hv_websocket_server")
    set_kind("binary")
    add_files("src/hv_websocket/websocket_server_test.cpp")

-- srpc  rpc(proto,msgpack,json)
target("xtensor")
    set_kind("binary")
    add_files("src/xtensor/xtensor.cpp")
    add_packages("xtensor") 
    add_packages("xtensor-blas") 
 
target("ffmpeg")
    set_kind("binary")
    add_files("src/streamer/*.cpp")
    add_includedirs("src/streamer")
    -- add_packages("ffmpeg", {public = true})
    add_packages("opencv")
    add_links("avfilter", "avdevice", "avformat", "avcodec", "swscale", "swresample", "avutil","postproc")

target("base64")
    set_kind("binary")
    add_files("src/base64/base64.cpp")
