set_project("xmake-example")
set_languages("c++20")
add_rules("mode.debug", "mode.release")

add_requires("openssl", {alias = "openssl", configs = { options = "OpenSSL:shared=True" }})
add_requires( "yaml-cpp 0.7.0", "fmt 10.0.0", "cppzmq 4.10.0", "toml++ 3.4.0","coost 3.0.1","quill 3.3.1")

add_requires("nlohmann_json 3.11.2")
-- add_requires("opencv 4.6.0","sqlite3 3.39.0")
add_requires("matplotplusplus 1.2.0")
add_requires("xtensor 0.24.3","xtensor-blas 0.20.0","xtl 0.7")
-- add_requires("drogon 1.8.2")


add_includedirs("include","src/utils", "include/utils")
add_includedirs("include/concurrentqueue")

add_packages("yaml-cpp", "fmt","coost","toml++","nlohmann_json")

add_packages("quill")

add_files("src/utils/*.cpp")

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

target("xtensor")
    set_kind("binary")
    add_files("src/xtensor/xtensor.cpp")
    add_packages("xtensor") 
    add_packages("xtensor-blas") 
    
target("log_quill")
    set_kind("binary")
    add_files("src/log_quill/log_quill.cpp")

