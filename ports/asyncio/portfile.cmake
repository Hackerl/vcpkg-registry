vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 2b0523f64ed336689bd0dfdae3e1314c5e57a390
        SHA512 4a280d79f1b99b0fd530ad6901e5c6f115c8c1db4d8cdd31e319506609322318a432b242865c814fd4dfc0d4cdddfd4c840ec1d44ee2a5960ad2bf3600606aba
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        embed-ca ASYNCIO_EMBED_CA_CERT
        stacktrace ASYNCIO_ENABLE_STACKTRACE
        c-ares ASYNCIO_ENABLE_C_ARES
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
