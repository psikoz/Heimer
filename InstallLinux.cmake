# **** Install targets for Linux ****
function(setup_install_targets)

    set(DEFAULT_DATA_PATH_BASE share/applications/heimer)
    if(NOT BIN_PATH)
        set(BIN_PATH bin)
    endif()

    message(STATUS "Linux/Unix build with system install targets.")

    # Install binaries and data
    install(PROGRAMS ${CMAKE_BINARY_DIR}/${BINARY_NAME} DESTINATION ${BIN_PATH})

    # Install .desktop files
    install(FILES ${CMAKE_BINARY_DIR}/heimer.desktop DESTINATION share/applications)

    # Install app store meta data
    install(FILES src/heimer.appdata.xml DESTINATION share/metainfo)

    # Install icons
    install(FILES data/icons/heimer.png DESTINATION share/pixmaps)
    install(FILES data/icons/heimer.png DESTINATION share/icons/hicolor/64x64/apps)

    set(CPACK_PACKAGE_FILE_NAME "heimer-${VERSION}-linux-${CMAKE_HOST_SYSTEM_PROCESSOR}")
    set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_SOURCE_DIR}/COPYING)
    set(CPACK_RESOURCE_FILE_README ${CMAKE_SOURCE_DIR}/README.md)

    set(CPACK_DEBIAN_PACKAGE_NAME "heimer")
    set(CPACK_DEBIAN_PACKAGE_VERSION ${VERSION})
    set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
    set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Jussi Lind <jussi.lind@iki.fi>")
    set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Simple mind map creation tool.")
    set(CPACK_DEBIAN_PACKAGE_SECTION "Education")
    set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")

    set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

    include(CPack)

endfunction()

