#include "main.hpp"

using std::cout, std::endl, std::string, std::this_thread::sleep_for;
using namespace std::chrono_literals;
// a non-optimized way of checking for prime numbers:
bool is_prime(int x)
{
  std::cout << "Calculating. Please, wait...\n";
  for (int i = 2; i < x; ++i)
    if (x % i == 0)
      return false;
  return true;
}

int main()
{

  while (true)
  {
    // call is_prime(313222313) asynchronously:
    std::future<bool> fut = std::async(is_prime, 313222313);

    std::cout << "Checking whether 313222313 is prime.\n";
    // ...
    bool ret = fut.get(); // waits for is_prime to return

    if (ret)
      std::cout << "It is prime!\n";
    else
      std::cout << "It is not prime.\n";
    sleep_for(3s);
  }

  return 0;
}