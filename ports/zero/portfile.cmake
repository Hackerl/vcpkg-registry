vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF e151076d7b90a499be21abb9142b566dfe4007e1
        SHA512 1ed981fabc4d8170c4aa41e03e1afdfe53c29cf009d30b6b88a5af352e6785ed1a8de6621a44abc5bbc3075a2b29790dac191e925eefff3c399227709fce532a
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
