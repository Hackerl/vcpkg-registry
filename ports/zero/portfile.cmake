vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF dfb1474623086fb92bab576aee7ce8d0231c044c
        SHA512 27802167d267e08d7a0a44061b499b40f9ac5cc6433d8f1590a0cd7fae310664815b86260e76dced8fff6393004d9244a8fb09e9f915786af56e7e10ed50f955
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
