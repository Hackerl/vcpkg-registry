vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF b4dd49bcbc0fcf6b2e873e82b50bd0b0bca56647
        SHA512 aeed3af46fb72259203d62bf95af1fe7acdd399f2556a9dddab2bd4e8b5a2f868767805634c776b8fa189363f7958681ab04fc7e8d95614993adaa3db8e9ae68
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
