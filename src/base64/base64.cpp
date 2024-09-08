#include "main.hpp"
#include "quill/LogMacros.h"
#include <cstddef>
#include <string>
#include <vector>
using std::cout, std::endl, std::string, std::vector;
using namespace simdutf;

int main(int argc, char **argv) {
  quill_init();
  LOG_INFO(logger, "⏰ Starting at {}!\n", mylocal_time());
  logger->flush_log();

  // encode char
  string source{"base64 testing."};
  LOG_INFO(logger, "source size:{0},data:\n{1}", source.size(), source);
  std::vector<char> base64_buf(
      simdutf::base64_length_from_binary(source.size()));
  simdutf::binary_to_base64(source.data(), source.size(), base64_buf.data());
  LOG_INFO(logger, "base64_buf size:{0},data:\n{1}", base64_buf.size(),
           base64_buf);

  //encode string
  string base64_str{};
  size_t base64_str_size = simdutf::base64_length_from_binary(source.size());
  base64_str.resize(base64_str_size);
  simdutf::binary_to_base64(source.data(), source.size(), base64_str.data());
  LOG_INFO(logger, "base64_str size:{0},data:\n{1}", base64_str.size(),
           base64_str);

  // decode char
  {
    // allocate enough memory for the maximal binary length
    std::vector<char> decode_buf(simdutf::maximal_binary_length_from_base64(
        base64_buf.data(), base64_buf.size()));
    // convert to binary and check for errors
    simdutf::result r = simdutf::base64_to_binary(
        base64_buf.data(), base64_buf.size(), (char *)decode_buf.data());
    if (r.error != simdutf::error_code::SUCCESS) {
      // We have that expected[i].empty().
      int error_code = r.error;
      LOG_WARNING(logger, "error code:{0}.", error_code);
    } else {
      decode_buf.resize(
          r.count); // in case of success, r.count contains the output length
                    // We have that buffer == expected[i]
      LOG_INFO(logger, "decode_buf size:{0},data:\n{1}", decode_buf.size(),
               decode_buf);
    }
  }
  // decode string
  {
    string decode_buf{};
    size_t decode_size = simdutf::maximal_binary_length_from_base64(
        base64_buf.data(), base64_buf.size());
    decode_buf.resize(decode_size);
    // convert to binary and check for errors
    simdutf::result r = simdutf::base64_to_binary(
        base64_buf.data(), base64_buf.size(), (char *)decode_buf.data());
    if (r.error != simdutf::error_code::SUCCESS) {
      // We have that expected[i].empty().
      int error_code = r.error;
      LOG_WARNING(logger, "error code:{0}.", error_code);
    } else {
      decode_buf.resize(
          r.count); // in case of success, r.count contains the output length
                    // We have that buffer == expected[i]
      LOG_INFO(logger, "decode_buf size:{0},data:\n{1}", decode_buf.size(),
               decode_buf);
    }
  }

  return 0;
}
