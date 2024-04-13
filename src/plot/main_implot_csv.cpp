#include "App.h"

#include "main.hpp"
#include "rapidcsv.h"
#include <cmath>

#include <algorithm>
#include <xtensor-blas/xblas.hpp>
#include <xtensor-blas/xlapack.hpp>
#include <xtensor-blas/xlinalg.hpp>
#include <xtensor/xarray.hpp>
#include <xtensor/xbuilder.hpp>
#include <xtensor/xcsv.hpp>
#include <xtensor/xio.hpp>
#include <xtensor/xnpy.hpp>
#include <xtensor/xpad.hpp>
#include <xtensor/xtensor.hpp>
#include <xtensor/xview.hpp>

using namespace std;
using namespace xt;

struct ImPlotDemo : App {
  using App::App;
  int i{0};
  void Update() override {
    // update your data here , fps=30
    std::cout << "update.i: " << i++ << std::endl;
    if (i > 100) {
      i = 0;
    }
    rapidcsv::Document doc("nohdr.csv", rapidcsv::LabelParams(-1, -1));
    //  rapidcsv::SeparatorParams(';'));
    vector<float> open = doc.GetColumn<float>(0);
    cout << "Read " << open.size() << " values." << endl;
    for (auto iter : open)
      cout << "Read " << iter << " value." << endl;

    vector<float> close = doc.GetColumn<float>(5);
    cout << "Read " << close.size() << " values." << endl;
    for (auto iter : close)
      cout << "Read " << iter << " value." << endl;

    long long volume = doc.GetCell<long long>(4, 2);
    cout << "Volume " << volume << " on 2017-02-22." << endl;

    xarray<float> x = linspace(0, 50 - 1, 50);

    cout << "x " << x << " x." << endl;

    // vector<double> y1 = transform(x, [](auto x) { return sin(x); });
    // vector<double> y2 = transform(x, [](auto x) { return sin(x - 0.25); });
    // vector<double> y3 = transform(x, [](auto x) { return sin(x - 0.5); });
    // plot(x, y1, "g", x, y2, "b--o", x, y3, "c*");
    // plot(x, open, "g", x, close, "b--o");

    static float xs2[5], ys2[5], xx[5];

    for (size_t i = 0; i < open.size(); i++) {
      xs2[i] = open[i];
      ys2[i] = close[i];
      xx[i] = x.at(i);
    }

    if (ImPlot::BeginPlot("Scatter Plot")) {
      ImPlot::PlotScatter("Data 1", xx, xs2, 10);
      ImPlot::PushStyleVar(ImPlotStyleVar_FillAlpha, 0.25f);
      ImPlot::SetNextMarkerStyle(ImPlotMarker_Square, 6,
                                 ImPlot::GetColormapColor(1), IMPLOT_AUTO,
                                 ImPlot::GetColormapColor(1));
      ImPlot::PlotScatter("Data 2", xx, ys2, 10);
      ImPlot::PopStyleVar();
      ImPlot::EndPlot();
    }

    ImGui::End();
  }
};

int main(int argc, char const *argv[]) {

  ImPlotDemo app("ImPlot Demo", 1920, 1080, argc, argv);
  app.Run();

  return 0;
}
