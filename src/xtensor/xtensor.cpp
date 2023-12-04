#include "main.hpp"

#include "xtensor-blas/xblas.hpp"
#include "xtensor-blas/xlapack.hpp"
#include "xtensor-blas/xlinalg.hpp"
#include "xtensor/xio.hpp"
#include "xtensor/xview.hpp"
#include <algorithm>
#include <xtensor/xarray.hpp>
#include <xtensor/xbuilder.hpp>
#include <xtensor/xcsv.hpp>
#include <xtensor/xnpy.hpp>
#include <xtensor/xtensor.hpp>

using std::cout, std::endl, std::string, std::this_thread::sleep_for;
using namespace std::chrono_literals;
using namespace std;


// using namespace xt=xtensor;
// https://xtensor.readthedocs.io/en/latest/container.html
int main() {

#if 0
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
#endif

// npy file read and write to xt::array and vector  
#if 1
  std::ofstream out_ofs;
  std::string file_path = "data.npy";
  out_ofs.open(file_path);
  out_ofs.clear();
  out_ofs.close();
  std::vector<double> data_vec{1, 2, 3, 4, 5, 6, 7, 8};
  auto data_xarray = xt::adapt(data_vec);
  // xt::xarray<double> data_xarray = {{1, 2, 3, 4}, {5, 6, 7, 8}};
  xt::dump_npy(file_path, data_xarray);
  // Note: you need to supply the data type you are loading
  //       in this case "double".
  auto xa_read = xt::load_npy<double>(file_path);
  std::vector<double> vec_read(xa_read.size());
  std::copy(xa_read.cbegin(), xa_read.cend(), vec_read.begin());
  std::cout << fmt::format("vec_read:\n{0}", vec_read)<<std::endl;
#endif
  return 0;
}