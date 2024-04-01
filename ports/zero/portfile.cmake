vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF e3b9bf9f3e3ce8bd4b9f4057e92ed0d580072588
        SHA512 314a8f411c45ffe37c089ad623eadd8fc224bae5731ba2851d5f573f302f5b00dee4e5dca450d1f47b7b2fd2c3cdaf2d2ae1eeafa1ab834eea6180d2672c5733
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
