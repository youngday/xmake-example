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
add_requires("openssl", {alias = "openssl",
    configs = {options = "OpenSSL:shared=True"}})
add_requires("sqlite3 3.39.0","yaml-cpp 0.7.0","fmt 9.1.0","cppzmq 4.8.1","toml++ 3.2.0","concurrentqueue") 
add_requires("CppLinuxSerial","libhv")
-- add_requires("opencv 4.6.0")
add_requires("matplotplusplus 1.1.0","xtensor","xtl","xtensor-blas","rapidcsv 8.50")
add_defines("LOGURU_WITH_STREAMS","LOGURU_USE_FMTLIB")
add_links("co")
add_linkdirs("lib/")

target("test")
    set_kind("static")
    add_files("src/test.cpp")
    add_includedirs("include")

target("console")
    set_kind("binary")
    add_deps("test")
    add_includedirs("include")
    add_includedirs("include/xpack")
    -- add_headerfiles("include/*.h","include/*.hpp")
    add_packages("opencv")
    add_packages("sqlite_orm","fmt")  
    add_packages("tbox","yaml-cpp","cppzmq","sqlite3")


target("serial")
    set_kind("binary")
    add_files("src/base/*.cpp","src/serial/FlowControl.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","CppLinuxSerial")
-- noblock mpmc_block mpmc_bulk
target("mpmc_noblock")
    set_kind("binary")
    add_files("src/base/*.cpp","src/mpmc_queue/noblock.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","concurrentqueue")

target("matplot")
    set_kind("binary")
    add_files("src/plot/plot.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","concurrentqueue","matplotplusplus")
target("matplotcsv")
    set_kind("binary")
    add_files("src/plot/plot_csv.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","concurrentqueue","matplotplusplus","rapidcsv")

