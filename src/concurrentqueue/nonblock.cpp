#include "main.hpp"

using namespace std;
using std::cout, std::endl;
int main(int argc, char *argv[]) {
  quill_init();
  LOG_INFO(logger, "Starting at {}!\n", mylocal_time());
  moodycamel::ConcurrentQueue<int> q;

  std::thread producer([&]() {

    quill::detail::set_thread_name("producer");
    for (int i = 0; i != 100; ++i) {
      std::this_thread::sleep_for(std::chrono::milliseconds(5000));
      q.enqueue(i);
      // LOG_S(INFO) << "send i= "<<i << endl;
    }
  });

  std::thread consumer([&]() {
    quill::detail::set_thread_name("consumer");
    for (int i = 0; i != 10000; ++i) {
      int item;

      bool found = q.try_dequeue(item);
      if (found) {
        // LOG_S(INFO) << "rcv i= "<<item << endl;
      }

      // LOG_S(INFO) << "run i= "<<i << endl;
      std::this_thread::sleep_for(std::chrono::milliseconds(1000));
      // assert(item == i);
    }
  });
  producer.join();
  consumer.join();

  assert(q.size_approx() == 0);
  // LOG_S(INFO) << "end" << endl;
  return 0;
}
