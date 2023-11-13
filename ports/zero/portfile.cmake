vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF 6c587229966dd4db2c5d4c8aef38167749707720
        SHA512 48316441cd578de3c9300cc026b2a5de99ac9d90a2d4ca12e42080da88fe161704ed43f2c4a5651fd5fda4c0661019173a5c31151a59e3117b6c89857f6f2746
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES legacy ZERO_LEGACY_NT
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        ${FEATURE_OPTIONS}
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
