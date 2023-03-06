#include <toml++/toml.h>
#include <iostream>
using namespace std;
int main(int argc, char const *argv[])
{

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

    // modify the data
    config.insert_or_assign("alternatives", toml::array{
                                                "cpptoml",
                                                "toml11",
                                                "Boost.TOML"});

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
    std::cout << config << "\n";

    // re-serialize as JSON
    std::cout << toml::json_formatter{config} << "\n";

    // re-serialize as YAML
    std::cout << toml::yaml_formatter{config} << "\n";
    return 0;
}
