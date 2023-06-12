#include <toml++/toml.h>
#include <iostream>
#include "main.h"
using namespace std;
int main(int argc, char *argv[])
{
      auto time_str = mylocal_time();

    filesystem::path folder_path = "./log/";
    filesystem::create_directory(folder_path) ? LOG_S(INFO) << "mkdir sucess." << folder_path << endl : LOG_S(INFO) << "dir exist." << folder_path << endl;

    string logfilename = "log/everything-" + time_str + ".log";
    loguru::init(argc, argv);
    loguru::add_file(logfilename.c_str(), loguru::Append,
                     loguru::Verbosity_MAX); // Verbosity_INFO  Verbosity_MAX
    // Only log INFO, WARNING, ERROR and FATAL to "latest_readable.log":
    logfilename = "log/latest_readable-" + time_str + ".log";
    loguru::add_file(logfilename.c_str(), loguru::Truncate,
                     loguru::Verbosity_INFO);
    LOG_S(INFO) << fmt::format("Starting at {}!\n", time_str);

    toml::table config;
    try
    {
        config = toml::parse_file("config/config.toml");
    }
    catch (const toml::parse_error &err)
    {
        std::cerr << "Parsing failed:\n"
                  << err << "\n";
        return 1;
    }

    // get key-value pairs
    std::string_view library_name = config["library"]["name"].value_or(""sv);
    std::string_view library_author = config["library"]["authors"][0].value_or(""sv);
    int64_t depends_on_cpp_version = config["dependencies"]["cpp"].value_or(0);
    vector<string> strTest;
    for (size_t i = 0; i < config["str_array"]["test"].as_array()->size(); i++)
    {
        strTest.emplace_back() = config["str_array"]["test"][i].value_or(""sv); // array to vector
    }

    LOG_S(INFO) << fmt::format("strTest vector:{0}!", strTest);

    // // use a visitor to iterate over heterogenous data
    // config.for_each([](auto &key, auto &value)
    //                 {
    // std::cout << value << "\n";
    // if constexpr (toml::is_string<decltype(value)>)
    //     do_something_with_string_values(value); });

    // // you can also iterate more 'traditionally' using a ranged-for
    // for (auto &&[k, v] : config)
    // {
    //     // ...
    // }

    // re-serialize as TOML
    // std::cout << config << "\n";

    // // re-serialize as JSON
    // std::cout << toml::json_formatter{config} << "\n";

    // // re-serialize as YAML
    // std::cout << toml::yaml_formatter{config} << "\n";
    return 0;
}
