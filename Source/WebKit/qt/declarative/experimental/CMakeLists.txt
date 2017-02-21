add_library(qmlwebkitexperimentalplugin SHARED plugin.cpp)
target_link_libraries(qmlwebkitexperimentalplugin
    WebKit2 Qt5::Quick)
set_target_properties(qmlwebkitexperimentalplugin PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/imports/QtWebKit/experimental")
