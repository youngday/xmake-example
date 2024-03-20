set_xmakever("2.8.1")
set_project("xmake-example")
set_languages("c++20")
add_rules("mode.debug", "mode.release")

add_requires("opencv", {system = true})
add_requires("openssl", {alias = "openssl", configs = { options = "OpenSSL:shared=True" }})
add_requires( "yaml-cpp 0.8.0",  "cppzmq 4.10.0", "toml++ 3.4.0","coost 3.0.1","quill 3.3.1","fmt 10.1.1",
"nlohmann_json 3.11.2","atomic_queue 1.5.0","concurrentqueue 1.0.4")
add_requires("drogon 1.9.1")
add_requires("xtensor 0.24.7","xtensor-blas 0.20.0","xtl 0.7")
add_requires("matplotplusplus 1.2.0")
add_requires("async_simple 1.3","asio 1.29.0")

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


add_packages("yaml-cpp", "coost","toml++","nlohmann_json","fmt","quill","drogon","atomic_queue","concurrentqueue")
add_packages("async_simple","asio")
add_links("atomic") --NOTE: clang donot link atomic ,need add manually .if not ,issue:undefined reference to `__atomic_is_lock_free'

add_includedirs("src/utils")
add_files("src/utils/*.cpp")

add_includedirs("src/async_simple")
add_includedirs("src/async_simple/executors")
add_includedirs("src/")

-- -- flag argparse cli  cmdline
-- target("flag_cli")
--     set_kind("binary")
--     add_files("src/flag/flag_cli.cpp")
-- target("toml_config")
--     set_kind("binary")
--     add_files("src/config/toml_config.cpp")
    
-- target("serial")
--     set_kind("binary")
--     add_linkdirs("lib")
--     add_links("CppLinuxSerial")
--     add_files("src/serial/FlowControl.cpp")
--     add_includedirs("src/CppLinuxSerial")

-- -- noblock mpmc_block mpmc_bulk
-- target("concurrentqueue")
--     set_kind("binary")
--     add_files("src/concurrentqueue/nonblock.cpp")

-- -- add_links("atomic") --NOTE: clang donot link atomic ,need add manually .if not ,issue:undefined reference to `__atomic_is_lock_free'
-- target("atomic_queue")
--     set_kind("binary")
--     add_files("src/atomic_queue/example.cc")

-- target("atomic_queue_block")
--     set_kind("binary")
--     add_files("src/atomic_queue/block.cpp")
-- target("atomic_queue_nonblock")
--     set_kind("binary")
--     add_files("src/atomic_queue/nonblock.cpp")

-- target("matplot")
--     set_kind("binary")
--     add_files("src/plot/plot.cpp")
--     add_packages("matplotplusplus")
-- target("matplotcsv")
--     set_kind("binary")
--     add_files("src/plot/plot_csv.cpp")
--     add_packages( "matplotplusplus")
-- target("json")
--     set_kind("binary")
--     add_files("src/json/json.cpp")
--     add_packages("nlohmann_json")
-- target("async")
--     set_kind("binary")
--     add_files("src/async/async.cpp")
--     add_packages("nlohmann_json")

target("async_echo_client")
    set_kind("binary")
    add_files("src/async_simple/async_echo_client.cpp")
target("async_echo_server")
    set_kind("binary")
    add_files("src/async_simple/async_echo_server.cpp")
target("async_multiple_core_echo_server")
    set_kind("binary")
    add_files("src/async_simple/async_multiple_core_echo_server.cpp")
target("block_echo_client")
    set_kind("binary")
    add_files("src/async_simple/block_echo_client.cpp")
target("block_echo_server")
    set_kind("binary")
    add_files("src/async_simple/block_echo_server.cpp")
    target("CountChar")
    set_kind("binary")
    add_files("src/async_simple/CountChar.cpp")
    target("ReadFiles")
    set_kind("binary")
    add_files("src/async_simple/ReadFiles.cpp")


--     -- drogon
-- target("http_file_upload")
--     set_kind("binary")
--     add_files("src/http/file_upload/file_upload.cc")
-- target("websocket_client")
--     set_kind("binary")
--     add_files("src/http/file_upload/file_upload.cc")
   

-- target("xtensor")
--     set_kind("binary")
--     add_files("src/xtensor/xtensor.cpp")
--     add_packages("xtensor") 
--     add_packages("xtensor-blas") 
    
-- target("log_quill")
--     set_kind("binary")
--     add_files("src/log_quill/log_quill.cpp")

-- target("ffmpeg")
--     set_kind("binary")
--     add_files("src/streamer/*.cpp")
--     add_includedirs("src/streamer")
--     -- add_packages("ffmpeg", {public = true})
--     add_packages("opencv")
--     add_links("avfilter", "avdevice", "avformat", "avcodec", "swscale", "swresample", "avutil","postproc")

