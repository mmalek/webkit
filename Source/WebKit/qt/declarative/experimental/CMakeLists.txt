add_library(qmlwebkitexperimentalplugin SHARED plugin.cpp)
target_link_libraries(qmlwebkitexperimentalplugin
    WebKit Qt5::Quick)
set_target_properties(qmlwebkitexperimentalplugin PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/imports/QtWebKit/experimental")
install(TARGETS qmlwebkitexperimentalplugin DESTINATION "${QML_INSTALL_DIR}/QtWebKit/experimental")
