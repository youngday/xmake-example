
#include <chrono>
#include <iostream>
#include <thread>
// #include "concurrentqueue/blockingconcurrentqueue.h"
#include "main.hpp"
#include "blockingconcurrentqueue.h"
using namespace std;

int main() {
  quill_init();
  moodycamel::BlockingConcurrentQueue<int> q;

  std::thread producer([&]() {
    for (int i = 0; i != 100; ++i) {
      std::this_thread::sleep_for(std::chrono::milliseconds(4));
      q.enqueue(i);
       LOG_INFO(logger, "wait_dequeue 0");
    }
  });
  std::thread consumer([&]() {
    for (int i = 0; i != 100; ++i) {
      int item;
      // LOG_INFO(logger, "wait_dequeue 1");
      q.wait_dequeue(item); // one for wait without timeout
      LOG_INFO(logger, "wait_dequeue 2,item:{0}",item);
      assert(item == i);

      if (q.wait_dequeue_timed(item, std::chrono::milliseconds(
                                         5))) { // other for wait with timeout
        ++i;
        LOG_INFO(logger, "wait_dequeue 3");
        assert(item == i);
      }
      LOG_INFO(logger, "wait_dequeue 4");
    }
  });
  producer.join();
  consumer.join();

  assert(q.size_approx() == 0);
  cout << "end" << endl;
  return 0;
}
