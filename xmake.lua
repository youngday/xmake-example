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
add_requires( "nlohmann_json 3.12.0","simdutf 6.2", "toml11 4.4.0","quill 9.0.3","fmt 11.2.0","libnpy 1.0.1","argparse 3.2")
add_requires( "concurrentqueue 1.0.4","libhv 1.3.3","cppzmq 4.10.0","drogon 1.9.10")
add_requires("xsimd 11.0.0","xtensor 0.25.0","xtensor-blas 0.20.0","xtl 0.7")
add_requires("imgui 1.91.9", {configs = {glfw= true,opengl3 = true,sdl2 = true}})
add_requires("glad 0.1.36")
add_packages("imgui", "glad")  
add_packages( "nlohmann_json","simdutf", "toml11","quill","fmt","libnpy")
add_packages( "cppzmq","concurrentqueue","libhv","drogon")
add_requires("ffmpeg 7.1")
add_packages("ffmpeg")
add_requires("sqlite_orm 1.9 ")



add_packages("xtensor","xtensor-blas","xtl","xsimd")

add_packages("sqlite_orm")


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

target("implot3d")
    set_kind("binary")
    add_files("src/plot/main_implot3d.cpp")
    add_files("src/plot/implot3d/*.cpp")
    add_includedirs("src/plot/implot3d")
    add_packages("imgui","glad","nativefiledialog-extended","cxxopts")
target("implot3d_csv")
    set_kind("binary")
    add_files("src/plot/main_implot3d_csv.cpp")

    add_files("src/plot/implot3d/*.cpp")
    add_includedirs("src/plot/implot3d")
    add_packages("imgui","glad","nativefiledialog-extended","cxxopts")

target("base64")
    set_kind("binary")
    add_files("src/base64/base64.cpp")
