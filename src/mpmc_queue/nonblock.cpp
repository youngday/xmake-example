
#include <thread>
#include <chrono>
#include <iostream>
#include "blockingconcurrentqueue.h"
#include "concurrentqueue.h"
using std::cout,std::endl;

int main()
{
    moodycamel::ConcurrentQueue<int> q;

    std::thread producer([&]()
                         {
       for (int i = 0; i != 100; ++i) {
            std::this_thread::sleep_for(std::chrono::milliseconds(5000));
            q.enqueue(i);
            cout << "send i= "<<i << endl;
        } });
 
    std::thread consumer([&]()
                         {
        for (int i = 0; i != 10000; ++i) {
            int item;
            
            bool found=q.try_dequeue(item);
            if (found)
            {
                 cout << "rcv i= "<<item << endl; 
            }
            
           
            cout << "run i= "<<i << endl; 
             std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            //assert(item == i);
            
          
        } });
   producer.join();
    consumer.join();

    assert(q.size_approx() == 0);
    cout << "end" << endl;
    return 0;
}
