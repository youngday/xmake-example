set_project("xmake-example")
set_languages("c++20")
add_rules("mode.debug", "mode.release")

add_requires("openssl", {alias = "openssl", configs = { options = "OpenSSL:shared=True" }})
add_requires( "yaml-cpp 0.7.0", "fmt 10.0.0", "cppzmq 4.10.0", "toml++ 3.4.0","coost 3.0.1","quill 3.3.1")
add_requires("nlohmann_json 3.11.2")
-- add_requires("rapidcsv")
-- add_requires("opencv 4.6.0","sqlite3 3.39.0")
add_requires("matplotplusplus 1.2.0")
add_requires("xtensor 0.24.3","xtl 0.7")
add_requires("drogon 1.8.2")


add_includedirs("include","src/utils", "include/utils")
add_includedirs("include/concurrentqueue")

add_packages("yaml-cpp", "fmt","coost","toml++","nlohmann_json")
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
    add_packages("eigen")  

target("log_quill_backtrace")
    set_kind("binary")
    add_files("src/log_quill/example_backtrace.cpp")
    add_packages("quill")

--     add_executable(quill_example_backtrace example_backtrace.cpp)
-- target_link_libraries(quill_example_backtrace quill)

-- add_executable(quill_example_configure_backend example_configure_backend.cpp)
-- target_link_libraries(quill_example_configure_backend quill)

-- add_executable(quill_example_console_colours example_console_colours.cpp)
-- target_link_libraries(quill_example_console_colours quill)

-- add_executable(quill_example_console_colours_with_custom_formatter example_console_colours_with_custom_formatter.cpp)
-- target_link_libraries(quill_example_console_colours_with_custom_formatter quill)

-- add_executable(quill_example_custom_clock example_custom_clock.cpp)
-- target_link_libraries(quill_example_custom_clock quill)

-- add_executable(quill_example_custom_clock_advanced example_custom_clock_advanced.cpp)
-- target_link_libraries(quill_example_custom_clock_advanced quill)

-- add_executable(quill_example_custom_console_colours example_custom_console_colours.cpp)
-- target_link_libraries(quill_example_custom_console_colours quill)

-- add_executable(quill_example_trivial example_trivial.cpp)
-- target_link_libraries(quill_example_trivial quill)

-- add_executable(quill_example_logging_to_file example_logging_to_file.cpp)
-- target_link_libraries(quill_example_logging_to_file quill)

-- add_executable(quill_example_multiple_handlers example_multiple_handlers.cpp)
-- target_link_libraries(quill_example_multiple_handlers quill)

-- add_executable(quill_example_quick_start example_quick_start.cpp)
-- target_link_libraries(quill_example_quick_start quill)

-- add_executable(quill_example_signal_handler example_signal_handler.cpp)
-- target_link_libraries(quill_example_signal_handler quill)

-- add_executable(quill_example_stdout_multiple_formatters example_stdout_multiple_formatters.cpp)
-- target_link_libraries(quill_example_stdout_multiple_formatters quill)

-- add_executable(quill_example_custom_formatter example_custom_formatter.cpp)
-- target_link_libraries(quill_example_custom_formatter quill)

-- add_executable(quill_example_custom_formatter_thread_name example_custom_formatter_thread_name.cpp)
-- target_link_libraries(quill_example_custom_formatter_thread_name quill)

-- add_executable(quill_example_custom_handler example_custom_handler.cpp)
-- target_link_libraries(quill_example_custom_handler quill)

-- add_executable(quill_example_daily_file_rotation example_daily_file_rotation.cpp)
-- target_link_libraries(quill_example_daily_file_rotation quill)

-- add_executable(quill_example_file_rotation example_file_rotation.cpp)
-- target_link_libraries(quill_example_file_rotation quill)

-- add_executable(quill_example_filters example_filters.cpp)
-- target_link_libraries(quill_example_filters quill)

-- add_executable(quill_example_handler_log_levels example_handler_log_levels.cpp)
-- target_link_libraries(quill_example_handler_log_levels quill)

-- add_executable(quill_example_json_structured_log example_json_structured_log.cpp)
-- target_link_libraries(quill_example_json_structured_log quill)

-- add_executable(quill_example_trivial_system_clock example_trivial_system_clock.cpp)
-- target_link_libraries(quill_example_trivial_system_clock quill)

-- add_executable(quill_example_trivial_file_logging example_trivial_file_logging.cpp)
-- target_link_libraries(quill_example_trivial_file_logging quill)

-- add_executable(quill_example_user_defined_types example_user_defined_types.cpp)
-- target_link_libraries(quill_example_user_defined_types quill)

-- add_executable(quill_example_bounded_queue_message_dropping example_bounded_queue_message_dropping.cpp)
-- target_link_libraries(quill_example_bounded_queue_message_dropping quill)
-- target_compile_definitions(quill_example_bounded_queue_message_dropping PUBLIC QUILL_USE_BOUNDED_QUEUE)

-- add_executable(quill_example_bounded_queue_blocking example_bounded_queue_blocking.cpp)
-- target_link_libraries(quill_example_bounded_queue_blocking quill)
-- target_compile_definitions(quill_example_bounded_queue_blocking PUBLIC QUILL_USE_BOUNDED_BLOCKING_QUEUE)

-- add_executable(quill_example_file_callbacks example_file_callbacks.cpp)
-- target_link_libraries(quill_example_file_callbacks quill)

-- add_executable(quill_example_wake_up_logging_thread example_wake_up_logging_thread.cpp)
-- target_link_libraries(quill_example_wake_up_logging_thread quill) 
