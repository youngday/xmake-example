/*
 * Copyright (c) 2022, Alibaba Group Holding Limited;
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <iostream>
#include <thread>

#include "block_connection.hpp"

using asio::ip::tcp;

class block_http_server {
public:
    block_http_server(asio::io_context& io_context, unsigned short port)
        : io_context_(io_context), port_(port) {}

    void start() {
        tcp::acceptor a(io_context_, tcp::endpoint(tcp::v4(), port_));
        for (;;) {
            auto [error, socket] = accept(a);
            if (error) {
                std::cout << "Accept failed, error: " << error.message()
                          << '\n';
                continue;
            }
            std::cout << "New client comming.\n";
            block_connection conn(std::move(socket), "./");
            conn.start();
        }
    }

private:
    asio::io_context& io_context_;
    unsigned short port_;
};

int main(int argc, char* argv[]) {
    try {
        asio::io_context io_context;
        std::thread thd([&io_context] {
            asio::io_context::work work(io_context);
            io_context.run();
        });
        block_http_server server(io_context, 9980);
        server.start();
        thd.join();
    } catch (std::exception& e) {
        std::cerr << "Exception: " << e.what() << "\n";
    }

    return 0;
}