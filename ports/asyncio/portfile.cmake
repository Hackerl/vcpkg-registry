vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 49a9d3be3b583f9430d39c7fbf2e499b813290d0
        SHA512 2a855ffe2b7cafcf593738fd81161393b75d9d24757fd801d2a82145509e0fc081243e586a3996f44d4a7f6f16f17d2d1bd05b08c167b669598a995122e47bfa
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
	FEATURES embedded ASYNCIO_EMBED_CA_CERT
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        ${FEATURE_OPTIONS}
	-DBUILD_TESTING=OFF
	-DASYNCIO_DISABLE_SAMPLES=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
