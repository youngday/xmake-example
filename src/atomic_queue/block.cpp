/* -*- mode: c++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */

// Copyright (c) 2019 Maxim Egorushkin. MIT License. See the full licence in
// file LICENSE.

#include "atomic_queue/atomic_queue.h"
#include "main.hpp"

using  std::this_thread::sleep_for;
using namespace std::chrono_literals;
int main() {
  quill_init();
  LOG_INFO(logger, "Starting at {}!\n", mylocal_time());

  int constexpr PRODUCERS = 1; // Number of producer threads.
  int constexpr CONSUMERS = 2; // Number of consumer threads.
  unsigned constexpr N = 1000000;
  unsigned constexpr CAPACITY = 1024;

  using Element = uint32_t; // Queue element type.

  Element constexpr NIL = static_cast<Element>(-1);
  using Queue =atomic_queue::AtomicQueueB<Element, std::allocator<Element>, NIL>;


  Queue q{CAPACITY};

  // Start the consumers.
  uint64_t sums[CONSUMERS]{0};
  std::thread consumers[CONSUMERS];
  for (int i = 0; i < CONSUMERS; ++i)
    consumers[i] = std::thread([&q, &sum = sums[i], i]() {
      uint64_t s = 0; // New object with automatic storage duration. Not aliased
                      // or false-shared by construction.
      while (Element n = q.pop()) // Break the loop when 0 is pop'ed.
      {
        s += n;
        LOG_INFO(logger, "pop i:{0},n: {1}.", i, n);
      }

      sum = s;
    });

  // Start the producers.
  std::thread producers[PRODUCERS];
  for (int i = 0; i < PRODUCERS; ++i)
    producers[i] = std::thread([&q]() {

      for (Element n = N; n; --n) {
        sleep_for(1s);
        q.push(n);
        LOG_INFO(logger, "push n: {}.", n);
      }
    });

  // Wait till producers have terminated.
  for (auto &t : producers)
    t.join();

  return EXIT_SUCCESS;
}
