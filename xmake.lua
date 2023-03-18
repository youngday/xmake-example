set_project("xmake-example")
set_languages("c++17")
add_rules("mode.debug", "mode.release")
-- apt packages
-- add_requires("apt::xxx", {system = true})
add_requires("opencv", {system = true})
-- cmake packages
-- add_requires("cmake::OpenCV", {system = true})
-- conan packages
-- add_requires("conan::xpack 1.0.2", {alias = "xpack",debug = true})
-- native xmake packages and make install package in "/usr/local/lib"
add_requires("tbox master", {debug = true})
add_requires("openssl", {alias = "openssl", configs = { options = "OpenSSL:shared=True" }})
add_requires("sqlite3 3.39.0", "yaml-cpp 0.7.0", "fmt 9.1.0", "cppzmq 4.8.1", "toml++ 3.3.0", "concurrentqueue","coost 3.0.0","libbacktrace 1.0")
add_requires("CppLinuxSerial", "libhv","nlohmann_json 3.11.2")
-- add_requires("opencv 4.6.0")
add_requires("matplotplusplus 1.1.0", "xtensor", "xtl", "xtensor-blas", "rapidcsv 8.50")
add_defines("LOGURU_WITH_STREAMS", "LOGURU_USE_FMTLIB")


-- websocketpp-0.8.2  drogon-v1.8.2 
-- cmake  uwebsocket 



-- add_links("co")
-- add_linkdirs("lib/")

target("test")
    set_kind("static")
    add_files("src/test.cpp")
    add_includedirs("include")

target("console")
    set_kind("binary")
    add_deps("test")

    add_files("src/main.cpp")
    add_files("src/test_cppzmq.cpp")
    add_files("src/utils/*.cpp")
    add_includedirs("include")
    add_includedirs("include/utils")
    add_includedirs("include/xpack")
    add_packages("opencv")
    add_packages("sqlite_orm", "fmt","coost","libbacktrace")
    add_packages("tbox", "yaml-cpp", "cppzmq", "sqlite3")

-- flag argparse cli  cmdline
target("flag_cli")
    set_kind("binary")
    add_files("src/flag/flag_cli.cpp")
    add_includedirs("include", "include/utils")
    add_packages("tbox", "yaml-cpp", "fmt","coost","libbacktrace")
target("toml_config")
    set_kind("binary")
    add_files("src/config/toml_config.cpp")
    add_includedirs("include")
    add_packages("tbox", "yaml-cpp", "fmt","coost","libbacktrace","toml++")

target("serial")
    set_kind("binary")
    add_files("src/serial/FlowControl.cpp")
    add_includedirs("include", "include/utils")
    add_packages("tbox", "yaml-cpp", "cppzmq", "fmt", "CppLinuxSerial")
-- noblock mpmc_block mpmc_bulk
target("mpmc_noblock")
    set_kind("binary")
    add_files("src/mpmc_queue/noblock.cpp")
    add_includedirs("include")
    add_packages("tbox", "yaml-cpp", "cppzmq", "fmt", "concurrentqueue")

target("matplot")
    set_kind("binary")
    add_files("src/plot/plot.cpp")
    add_includedirs("include")
    add_packages("tbox", "yaml-cpp", "cppzmq", "fmt", "concurrentqueue", "matplotplusplus")
target("matplotcsv")
    set_kind("binary")
    add_files("src/plot/plot_csv.cpp")
    add_includedirs("include")
    add_packages("tbox", "yaml-cpp", "cppzmq", "fmt", "concurrentqueue", "matplotplusplus", "rapidcsv")
target("json")
    set_kind("binary")
    add_files("src/json/json.cpp")
    add_includedirs("include")
    add_includedirs("include/utils")
    add_packages("tbox", "yaml-cpp", "fmt","coost","libbacktrace","toml++","nlohmann_json")
target("async")
    set_kind("binary")
    add_files("src/async/async.cpp")
    add_includedirs("include")
    add_includedirs("include/utils")
    add_packages("tbox", "yaml-cpp", "fmt","coost","libbacktrace","toml++","nlohmann_json")
