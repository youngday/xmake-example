add_rules("mode.debug", "mode.release")
-- cmake packages
-- add_requires("cmake::ZLIB", {system = true})
add_requires("cmake::LibXml2", {system = true})
-- add_requires("cmake::Boost", {system = true,
    -- configs = {components = {"regex", "system"}, presets = {Boost_USE_STATIC_LIB = true}}})
-- conan packages
add_requires("conan::zlib 1.2.11", {alias = "zlib", debug = true})
add_requires("conan::openssl 1.1.1g", {alias = "openssl",
    configs = {options = "OpenSSL:shared=True"}})

-- native xmake packages
add_requires("tbox master", {debug = true})
-- add_requires("zlib >=1.2.11")

add_rules("mode.debug", "mode.release")

target("test")
    set_kind("static")
    add_files("src/test.cpp")
    -- add_packages("pcre2", {public = true})

target("console")
    set_kind("binary")
    add_deps("test")
    add_files("src/*.cpp")
    add_packages("tbox","conan::zlib", "conan::openssl", "cmake::LibXml2")

