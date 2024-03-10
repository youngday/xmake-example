/* -*- mode: c++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */

// Copyright (c) 2019 Maxim Egorushkin. MIT License. See the full licence in
// file LICENSE.

#include "atomic_queue/atomic_queue.h"

#include <cstdint>
#include <iostream>
#include <thread>

#include "main.hpp"

using std::cout, std::endl, std::this_thread::sleep_for;
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
  using Queue =
      atomic_queue::AtomicQueueB<Element, std::allocator<Element>, NIL>;

  Queue q{CAPACITY};

  // Start the consumers.
  uint64_t sums[CONSUMERS]{0};
  std::thread consumers[CONSUMERS];
  for (int i = 0; i < CONSUMERS; ++i)
    consumers[i] = std::thread([&q, &sum = sums[i], i]() {
      uint64_t s = 0; // New object with automatic storage duration. Not aliased
      // or false-shared by construction.
      int cnt{0};
      while (1) // Break the loop when 0 is pop'ed.
      {
        sleep_for(100ms);
        Element n{0};
        bool is_rcv = q.try_pop(n);

        if (is_rcv) {
          s += n;
          LOG_INFO(logger, "pop i:{0},n: {1}.", i, n);
        }
        LOG_INFO(logger, "loop cnt:{0}", cnt++);
      }

      sum = s;
    });

  // Start the producers.
  std::thread producers[PRODUCERS];
  for (int i = 0; i < PRODUCERS; ++i)
    producers[i] = std::thread([&q]() {
      for (Element n = N; n; --n) {
        sleep_for(1s);
        q.try_push(n);
        LOG_INFO(logger, "push n: {}.", n);
      }
    });

  // Wait till producers have terminated.
  for (auto &t : producers)
    t.join();

  return EXIT_SUCCESS;
}
