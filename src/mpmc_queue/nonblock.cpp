
#include <thread>
#include <chrono>
#include <iostream>
#include "blockingconcurrentqueue.h"
#include "concurrentqueue.h"
#include "pthread.h"
#include "main.h"
using std::cout, std::endl;

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

    moodycamel::ConcurrentQueue<int> q;

    std::thread producer([&]()
                         {
                            loguru::set_thread_name("producer");
       for (int i = 0; i != 100; ++i) {
            std::this_thread::sleep_for(std::chrono::milliseconds(5000));
            q.enqueue(i);
            LOG_S(INFO) << "send i= "<<i << endl;
        } });

    std::thread consumer([&]()
                         {
                             loguru::set_thread_name("consumer");
        for (int i = 0; i != 10000; ++i) {
            int item;
            
            bool found=q.try_dequeue(item);
            if (found)
            {
                 LOG_S(INFO) << "rcv i= "<<item << endl; 
            }
            
           
            LOG_S(INFO) << "run i= "<<i << endl; 
             std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            //assert(item == i);
            
          
        } });
    producer.join();
    consumer.join();

    assert(q.size_approx() == 0);
    LOG_S(INFO) << "end" << endl;
    return 0;
}
