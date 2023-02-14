set_project("xmake-example")
set_languages("c++17")
add_rules("mode.debug", "mode.release")
-- apt packages
-- add_requires("apt::xxx", {system = true})
add_requires("opencv", {system = true})
-- cmake packages
-- add_requires("cmake::LibXml2", {system = true})
-- add_requires("cmake::OpenCV", {system = true})
-- conan packages
-- add_requires("conan::xpack 1.0.2", {alias = "xpack",debug = true})
-- add_requires("conan::sqlite_orm 1.7.1", {alias = "sqlite_orm",debug = true})

-- native xmake packages and make install package in "/usr/local/lib"
add_requires("tbox master", {debug = true})
add_requires("openssl", {alias = "openssl",
    configs = {options = "OpenSSL:shared=True"}})
add_requires("sqlite3 3.39.0","yaml-cpp 0.7.0","fmt 9.1.0","cppzmq 4.8.1","toml++ 3.2.0","concurrentqueue","xtensor","xtl","xtensor-blas") 
add_requires("CppLinuxSerial","concurrentqueue","libhv")
-- add_requires("opencv 4.6.0")

add_defines("LOGURU_WITH_STREAMS","LOGURU_USE_FMTLIB")
add_links("co")
add_linkdirs("lib/")

target("test")
    set_kind("static")
    add_files("src/test.cpp")
    add_includedirs("include")
    -- add_packages("pcre2", {public = true})

target("console")
    set_kind("binary")
    add_deps("test")
    add_files("src/*.cpp","src/base/*.cpp")
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

target("mpmc_noblock")
    set_kind("binary")
    add_files("src/base/*.cpp","src/mpmc_queue/noblock.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","concurrentqueue")

target("mpmc_block")
    set_kind("binary")
    add_files("src/base/*.cpp","src/mpmc_queue/block.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","concurrentqueue")

target("mpmc_bulk")
    set_kind("binary")
    add_files("src/base/*.cpp","src/mpmc_queue/bulk.cpp")
    add_includedirs("include")
    add_packages("tbox","yaml-cpp","cppzmq","fmt","concurrentqueue")



