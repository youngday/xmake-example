set_project("xmake-qt-widget")
set_languages("c++17")
add_rules("mode.debug", "mode.release")
-- for linux qt path 
set_configdir("qt","~/QT5.12.12")
add_rules("qt.widgetapp")
-- add_rules("qt.widgetapp_static")
-- add_rules("qt.quickapp")
-- add_rules("qt.application")

-- add_frameworks("QtQuick")
add_frameworks("QtCore","QMainWindow")
add_frameworks("QtNetwork", "QtGui","QTBase","QtXml")
add_frameworks("QtWidgets","QtCharts")
add_frameworks("QtDataVisualization","QtSql")
add_frameworks("QtMultimedia","QtMultimediaWidgets")

add_frameworks("QtPrintSupport","QtOpenGL")



target("qt_widget_app")
    
    add_headerfiles("src/*.h")
    add_files("src/*.cpp")
    add_files("src/mainwindow.ui")
    -- add files with Q_OBJECT meta (only for qt.moc)
    add_files("src/mainwindow.h")

target("charts-areachart")
    add_files("charts/areachart/*.cpp")

target("charts-barchart")
    add_files("charts/barchart/*.cpp")

target("charts-dynamicspline")
    add_files("charts/dynamicspline/*.cpp")
    add_files("charts/dynamicspline/*.h")

target("datavisualization-bars")
    add_includedirs("datavisualization/bars")
    add_files("datavisualization/bars/*.h")
    add_files("datavisualization/bars/*.cpp")

target("datavisualization-audiolevels")
    add_includedirs("datavisualization/audiolevels")
    add_files("datavisualization/audiolevels/*.h")
    add_files("datavisualization/audiolevels/*.cpp")

target("multimediawidgets-camera")
    add_includedirs("multimediawidgets/camera")
    add_files("multimediawidgets/camera/*.h")
    add_files("multimediawidgets/camera/*.cpp")
    add_files("multimediawidgets/camera/*.qrc")
    add_files("multimediawidgets/camera/*.ui")

target("multimediawidgets-videowidget")
    add_includedirs("multimediawidgets/videowidget")
    add_files("multimediawidgets/videowidget/*.h")
    add_files("multimediawidgets/videowidget/*.cpp")


target("multimediawidgets-videowidget")
    add_includedirs("multimediawidgets/videowidget")
    add_files("multimediawidgets/videowidget/*.h")
    add_files("multimediawidgets/videowidget/*.cpp")

target("opengl-2dpainting")
    add_includedirs("opengl/2dpainting")
    add_files("opengl/2dpainting/*.h")
    add_files("opengl/2dpainting/*.cpp")

target("sql-books")
    add_includedirs("sql/books")
    add_files("sql/books/*.h")
    add_files("sql/books/*.cpp")
    add_files("sql/books/bookwindow.ui")
    add_files("sql/books/*.qrc")

-- widgets
target("itemviews-addressbook")
    add_includedirs("widgets/itemviews/addressbook")
    add_files("widgets/itemviews/addressbook/*.h")
    add_files("widgets/itemviews/addressbook/*.cpp")

target("itemviews-addressbook")
    add_includedirs("widgets/itemviews/addressbook")
    add_files("widgets/itemviews/addressbook/*.h")
    add_files("widgets/itemviews/addressbook/*.cpp")

target("animation-animatedtiles")
    add_includedirs("widgets/animation/animatedtiles")
    -- add_files("widgets/animation/animatedtiles/*.h")
    add_files("widgets/animation/animatedtiles/*.cpp", {rules = "qt.moc"})
    add_files("widgets/animation/animatedtiles/*.qrc")

target("animation-easing")
    add_includedirs("widgets/animation/easing")
    add_files("widgets/animation/easing/*.h")
    add_files("widgets/animation/easing/*.cpp")
    add_files("widgets/animation/easing/*.qrc")
    add_files("widgets/animation/easing/*.ui")

target("dialogs-extension")
    add_includedirs("widgets/dialogs/extension")
    add_files("widgets/dialogs/extension/*.h")
    add_files("widgets/dialogs/extension/*.cpp")

target("itemviews-coloreditorfactory")
    add_includedirs("widgets/itemviews/coloreditorfactory")
    add_files("widgets/itemviews/coloreditorfactory/*.h")
    add_files("widgets/itemviews/coloreditorfactory/*.cpp")

target("itemviews-combowidgetmapper")
    add_includedirs("widgets/itemviews/combowidgetmapper")
    add_files("widgets/itemviews/combowidgetmapper/*.h")
    add_files("widgets/itemviews/combowidgetmapper/*.cpp")

target("itemviews-dirview")
    add_includedirs("widgets/itemviews/dirview")

    add_files("widgets/itemviews/dirview/*.cpp")

target("itemviews-editabletreemodel")
    add_includedirs("widgets/itemviews/editabletreemodel")
    add_files("widgets/itemviews/editabletreemodel/*.h")
    add_files("widgets/itemviews/editabletreemodel/*.cpp")
    add_files("widgets/itemviews/editabletreemodel/mainwindow.ui")
    add_files("widgets/itemviews/editabletreemodel/*.qrc")

target("analogclock")
    add_includedirs("widgets/widgets/analogclock")
    add_files("widgets/widgets/analogclock/*.h")
    add_files("widgets/widgets/analogclock/*.cpp")

target("calculator")
    add_includedirs("widgets/widgets/calculator")
    add_files("widgets/widgets/calculator/*.h")
    add_files("widgets/widgets/calculator/*.cpp")

target("graphicsview-anchorlayout")
    add_includedirs("widgets/graphicsview/anchorlayout")
    -- add_files("widgets/graphicsview/anchorlayout/*.h")
    add_files("widgets/graphicsview/anchorlayout/*.cpp")

target("graphicsview-basicgraphicslayouts")
    add_includedirs("widgets/graphicsview/basicgraphicslayouts")
    add_files("widgets/graphicsview/basicgraphicslayouts/*.h")
    add_files("widgets/graphicsview/basicgraphicslayouts/*.cpp")
    add_files("widgets/graphicsview/basicgraphicslayouts/*.qrc")

target("graphicsview-chip")
    add_includedirs("widgets/graphicsview/chip")
    add_files("widgets/graphicsview/chip/*.h")
    add_files("widgets/graphicsview/chip/*.cpp")
    add_files("widgets/graphicsview/chip/*.qrc")

target("graphicsview-collidingmice")
    add_includedirs("widgets/graphicsview/collidingmice")
    add_files("widgets/graphicsview/collidingmice/*.h")
    add_files("widgets/graphicsview/collidingmice/*.cpp")
    add_files("widgets/graphicsview/collidingmice/*.qrc")

target("graphicsview-diagramscene")
    add_includedirs("widgets/graphicsview/diagramscene")
    add_files("widgets/graphicsview/diagramscene/*.h")
    add_files("widgets/graphicsview/diagramscene/*.cpp")
    add_files("widgets/graphicsview/diagramscene/*.qrc")

target("layouts-basiclayouts")
    add_includedirs("widgets/layouts/basiclayouts")
    add_files("widgets/layouts/basiclayouts/*.h")
    add_files("widgets/layouts/basiclayouts/*.cpp")

target("layouts-dynamiclayouts")
    add_includedirs("widgets/layouts/dynamiclayouts")
    add_files("widgets/layouts/dynamiclayouts/*.h")
    add_files("widgets/layouts/dynamiclayouts/*.cpp")

target("layouts-borderlayout")
    add_includedirs("widgets/layouts/borderlayout")
    add_files("widgets/layouts/borderlayout/*.h")
    add_files("widgets/layouts/borderlayout/*.cpp")
target("mainwindows-application")
    add_includedirs("widgets/mainwindows/application")
    add_files("widgets/mainwindows/application/*.h")
    add_files("widgets/mainwindows/application/*.cpp")
    add_files("widgets/mainwindows/application/*.qrc")
    

-- need add image path ,lost some image
target("painting-affine")
    add_includedirs("widgets/painting/affine")
    add_files("widgets/painting/affine/*.h")
    add_files("widgets/painting/affine/*.cpp")
    add_files("widgets/painting/affine/*.qrc")
    add_includedirs("widgets/painting/shared")
    add_files("widgets/painting/shared/*.h")
    add_files("widgets/painting/shared/*.cpp")
    add_files("widgets/painting/shared/*.qrc")






-- TODO:
-- multimedia  multimediawidget player
 



--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--
-- xmake will detect Qt SDK automatically and we can also set the SDK directory manually.

-- $ xmake f --qt=~/Qt5.12.12
