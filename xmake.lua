set_project("xmake-example")
set_languages("c++17")
add_rules("mode.debug", "mode.release")
-- cmake packages
add_requires("cmake::LibXml2", {system = true})
add_requires("cmake::OpenCV", {system = true})
-- conan packages
add_requires("conan::xpack 1.0.2","conan::sqlite_orm 1.7.1")  

-- native xmake packages
add_requires("tbox master", {debug = true})
add_requires("openssl", {alias = "openssl",
    configs = {options = "OpenSSL:shared=True"}})
add_requires("yaml-cpp 0.7.0","fmt 9.1.0","coost 3.0.0","cppzmq 4.8.1","toml++ 3.2.0","cpr 1.8.3","sqlite_orm ","concurrentqueue","xtensor","xtl","xtensor-blas") 


target("test")
    set_kind("static")
    add_files("src/test.cpp")
    -- add_packages("pcre2", {public = true})

target("console")
    set_kind("binary")
    add_deps("test")
    add_files("src/*.cpp")
    add_includedirs("include")
    add_headerfiles("include/*.h","include/*.hpp")

    
    add_packages("cmake::LibXml2","cmake::OpenCV")
    add_packages("conan::xpack","conan::sqlite_orm")  
    add_packages("tbox","yaml-cpp","fmt","coost","cppzmq","loguru")

    add_defines("LOGURU_WITH_STREAMS","LOGURU_USE_FMTLIB")
