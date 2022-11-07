set_project("xmake-example")
set_languages("c++17")
add_rules("mode.debug", "mode.release")
-- cmake packages
add_requires("cmake::LibXml2", {system = true})
-- conan packages
add_requires("conan::openssl 1.1.1g", {alias = "openssl",
    configs = {options = "OpenSSL:shared=True"}})
add_requires("conan::xpack 1.0.2")  
add_requires("conan::sqlite_orm 1.7.1")  
-- native xmake packages
add_requires("tbox master", {debug = true})
add_requires("yaml-cpp","fmt","libbacktrace","coost","cppzmq") 
-- add_requires("loguru") 

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
    -- coost package should ahead,libbacktrace behind, or error appear below
--     error: /usr/bin/ld: /usr/local/lib/libco.a(stack_trace.cc.o): in function `___::log::StackTraceImpl::dump_stack(void*, int)':
-- /home/youngday/prj-cpp/coost/src/log/stack_trace.cc:134: undefined reference to `backtrace_create_state'
-- /usr/bin/ld: /home/youngday/prj-cpp/coost/src/log/stack_trace.cc:135: undefined reference to `backtrace_full'
-- collect2: error: ld returned 1 exit status
    add_packages("tbox","yaml-cpp","fmt","coost","libbacktrace","cppzmq","cmake::libco","conan::zlib", "conan::openssl", "conan::xpack","conan::sqlite_orm","cmake::LibXml2")
    add_defines("LOGURU_WITH_STREAMS","LOGURU_USE_FMTLIB")
