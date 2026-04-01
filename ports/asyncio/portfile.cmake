vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF da43f376968f1020796ad670758c7ecc33b227b8
        SHA512 77b7b610887f9a15851cf9d44630c02fb0586bb2cb0a95b4747e1c748683c3f7124b2984ff8b54463eaa99a2ae8769b51ff8ae14b253382550e1150f4b4bf82b
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
