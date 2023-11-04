set_project("xmake-example")
set_languages("c++20")
add_rules("mode.debug", "mode.release")

add_requires("openssl", {alias = "openssl", configs = { options = "OpenSSL:shared=True" }})
add_requires( "yaml-cpp 0.7.0", "fmt 10.0.0", "cppzmq 4.10.0", "toml++ 3.4.0","coost 3.0.1")
add_requires("nlohmann_json 3.11.2")
-- add_requires("rapidcsv")
-- add_requires("opencv 4.6.0","sqlite3 3.39.0")
add_requires("matplotplusplus 1.2.0")
add_requires("xtensor 0.24.3","xtl 0.7")
add_requires("drogon 1.8.2")
-- add_defines("LOGURU_WITH_STREAMS")
-- add_linkdirs("lib/")
-- add_rpathdirs("@loader_path/lib") -- load file path of shared file for debuging   

add_includedirs("include","src/utils", "include/utils")
add_includedirs("include/concurrentqueue")

add_packages("yaml-cpp", "fmt","coost","toml++","nlohmann_json")
add_files("src/utils/*.cpp")


target("test")
    set_kind("static")
    add_files("src/test.cpp")


target("console")
    set_kind("binary")
    add_deps("test")

    add_files("src/main.cpp")
    add_files("src/test_cppzmq.cpp")
    add_files("src/tcp_client_coro.cpp")
    -- add_includedirs("include/xtl")
    -- add_includedirs("include/xtensor")
    add_packages("opencv","cppzmq")

-- flag argparse cli  cmdline
target("flag_cli")
    set_kind("binary")
    add_files("src/flag/flag_cli.cpp")
target("toml_config")
    set_kind("binary")
    add_files("src/config/toml_config.cpp")
    

target("serial")
    set_kind("binary")
    add_linkdirs("lib")
    add_links("CppLinuxSerial")
    add_files("src/serial/FlowControl.cpp")
    add_includedirs("include", "include/utils","include/CppLinuxSerial")

-- noblock mpmc_block mpmc_bulk
target("mpmc_nonblock")
    set_kind("binary")
    add_files("src/mpmc_queue/nonblock.cpp")

target("matplot")
    set_kind("binary")
    add_files("src/plot/plot.cpp")
    add_packages("matplotplusplus")
target("matplotcsv")
    set_kind("binary")
    add_files("src/plot/plot_csv.cpp")
    add_packages( "matplotplusplus")
target("json")
    set_kind("binary")
    add_files("src/json/json.cpp")
    add_packages("nlohmann_json")
target("async")
    set_kind("binary")
    add_files("src/async/async.cpp")
    add_packages("nlohmann_json")
target("http_file_upload")
    set_kind("binary")
    add_files("src/http/file_upload/file_upload.cc")
    add_packages("drogon")
