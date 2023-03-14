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
add_frameworks("QtWidgets")
add_frameworks("QtDataVisualization")
add_frameworks("QtDataVisualization")
add_frameworks("QtMultimedia","QtMultimediaWidgets")

add_frameworks("QtPrintSupport","QtOpenGL")



target("qt_widget_app")
    
    add_headerfiles("src/*.h")
    add_files("src/*.cpp")
    add_files("src/mainwindow.ui")
    -- add files with Q_OBJECT meta (only for qt.moc)
    add_files("src/mainwindow.h")

target("datavisualization-bars")
    add_includedirs("datavisualization/bars")
    add_files("datavisualization/bars/*.h")
    add_files("datavisualization/bars/*.cpp")

-- widgets
target("itemviews-addressbook")
    add_includedirs("widgets/itemviews/addressbook")
    add_files("widgets/itemviews/addressbook/*.h")
    add_files("widgets/itemviews/addressbook/*.cpp")

target("itemviews-editabletreemodel")
    add_includedirs("widgets/itemviews/editabletreemodel")
    add_files("widgets/itemviews/editabletreemodel/*.h")
    add_files("widgets/itemviews/editabletreemodel/*.cpp")
    add_files("widgets/itemviews/editabletreemodel/mainwindow.ui")
    add_files("widgets/itemviews/editabletreemodel/*.qrc")


-- qtcore qInitResources qInitResources_application
target("mainwindows-application")
    add_includedirs("widgets/mainwindows/application")
    add_files("widgets/mainwindows/application/*.h")
    add_files("widgets/mainwindows/application/*.cpp")
    add_files("widgets/mainwindows/application/*.qrc")

target("widgets-analogclock")
    add_includedirs("widgets/widgets/analogclock")
    add_files("widgets/widgets/analogclock/*.h")
    add_files("widgets/widgets/analogclock/*.cpp")

target("graphicsview-anchorlayout")
    add_includedirs("widgets/graphicsview/anchorlayout")
    -- add_files("widgets/graphicsview/anchorlayout/*.h")
    add_files("widgets/graphicsview/anchorlayout/*.cpp")

target("graphicsview-chip")
    add_includedirs("widgets/graphicsview/chip")
    add_files("widgets/graphicsview/chip/*.h")
    add_files("widgets/graphicsview/chip/*.cpp")
    add_files("widgets/graphicsview/chip/*.qrc")


target("widgets-animation-animatedtiles")
    add_includedirs("widgets/animation/animatedtiles")
    -- add_files("widgets/animation/animatedtiles/*.h")
    add_files("widgets/animation/animatedtiles/*.cpp", {rules = "qt.moc"})
    add_files("widgets/animation/animatedtiles/*.qrc")
    

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


target("multimediawidgets-player")
    add_includedirs("multimediawidgets/player")
    add_files("multimediawidgets/player/*.h")
    add_files("multimediawidgets/player/histogramwidget.cpp", {rules = "qt.moc"})
    add_files("multimediawidgets/player/*.cpp")


target("multimediawidgets-videowidget")
    add_includedirs("multimediawidgets/videowidget")
    add_files("multimediawidgets/videowidget/*.h")
    add_files("multimediawidgets/videowidget/*.cpp")

target("opengl-2dpainting")
    add_includedirs("opengl/2dpainting")
    add_files("opengl/2dpainting/*.h")
    add_files("opengl/2dpainting/*.cpp")

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
