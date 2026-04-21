vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF add110fe351c3ac5636dd58701bc34bec8da3dff
        SHA512 6c18166b8a1a71ab57853d8358cecf519364eb03ccc37eaebf3a2a05219f33d55c79146c9f07d43b587c020cd71a0e18acf204c15eb32a2178fb6903362542d3
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES embed-ca ASYNCIO_EMBED_CA_CERT
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        ${FEATURE_OPTIONS}
	-DBUILD_TESTING=OFF
	-DBUILD_SAMPLES=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
