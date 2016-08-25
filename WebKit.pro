# This project file is a wrapper for running CMake

TEMPLATE = aux

CMAKE_ARGS = "-DPORT=Qt"
CMAKE_ARGS += "-DCMAKE_PREFIX_PATH=\"$$[QT_INSTALL_PREFIX];$$OUT_PWD/../qtbase;$$OUT_PWD/../qtlocation;$$OUT_PWD/../qtsensors\""
CMAKE_ARGS += "-DCMAKE_INSTALL_PREFIX=\"$$[QT_INSTALL_PREFIX]\""
CMAKE_ARGS += "-DKDE_INSTALL_LIBDIR=\"$$[QT_INSTALL_LIBS]\""


CONFIG(debug, debug|release) {
    CMAKE_ARGS += "-DCMAKE_BUILD_TYPE=Debug"
} else {
    CMAKE_ARGS += "-DCMAKE_BUILD_TYPE=Release"
}

!win32 {
    CMAKE_ENV="CC=$$QMAKE_CC CXX=$$QMAKE_CXX"
    BUILD_COMMAND = $(MAKE)
} else {
    BUILD_COMMAND = "cmake --build ."
}

# Append additional platform options defined in CMAKE_CONFIG
for (config, CMAKE_CONFIG): CMAKE_ARGS += "-D $$config"

cmake_build_dir = $$system_quote($$system_path($$OUT_PWD/cmake_root))
cmake_cmd_base = "$$QMAKE_MKDIR $$cmake_build_dir && cd $$cmake_build_dir &&"

cmake.commands = "$$cmake_cmd_base $$CMAKE_ENV cmake $$PWD $$CMAKE_ARGS && $$BUILD_COMMAND"
QMAKE_EXTRA_TARGETS += cmake

default_target.target = all
default_target.depends = cmake
QMAKE_EXTRA_TARGETS += default_target

install_target.target = install
win32 {
    install_target.commands = cmake --build $$OUT_PWD/cmake_root --target install
} else {
    install_target.commands = $(MAKE) -C $$OUT_PWD/cmake_root install
}
QMAKE_EXTRA_TARGETS += install_target
