#include "main.hpp"

#include <xtensor/xtensor.hpp>
#include <xtensor/xarray.hpp>
#include <xtensor/xbuilder.hpp>
#include "xtensor/xio.hpp"
#include "xtensor/xview.hpp"
#include "xtensor-blas/xblas.hpp"
#include "xtensor-blas/xlapack.hpp"
#include "xtensor-blas/xlinalg.hpp"

using std::cout, std::endl, std::string, std::this_thread::sleep_for;
using namespace std::chrono_literals;
using namespace std;
// using namespace xt=xtensor;
int main()
{

  auto x = xt::xarray<double>({0, 1, 2, 3});

  auto y = xt::xarray<double>({-1, 0.2, 0.9, 2.1});

  auto A = xt::stack(xt::xtuple(x, xt::ones<double>(y.shape())));
  auto B = xt::transpose(A);

  auto px = xt::linspace<double>(1.0, 10.0, 100);
  // int a;
  // xt::xarray<double> b;
  auto [rx, res, rnd, rs] = xt::linalg::lstsq(B, y);

  auto py = px * rx[0] + rx[1];
  //

  std::cout << rx << "," << res << "," << rnd << "," << rs << std::endl;

  std::cout << py << std::endl;

  auto ps = xt::stack(xt::xtuple(px, py), 1);

  std::cout << ps << endl;

  xt::xarray<double> a = {1, 2, 3};
  xt::xarray<double> b = {5, 6, 7};

  auto s0 = xt::stack(xt::xtuple(a, b));
  std::cout << s0 << std::endl;
  // Outputs {{1, 2, 3}, {5, 6, 7}}

  auto s1 = xt::stack(xt::xtuple(a, b), 1);
  std::cout << s1 << std::endl;
  // Outputs {{1, 5}, {2, 6}, {3, 7}}

  xt::xarray<double> a0 = {{1, 2, 3}, {4, 5, 6}};
  xt::xarray<double> b0 = {{7, 8}, {9, 10}};
  auto c0 = xt::hstack(xt::xtuple(a0, b0));
  std::cout << c0 << std::endl;
  // Outputs {{1, 2, 3, 7, 8}, {4, 5, 6, 0, 10}}

  return 0;
}