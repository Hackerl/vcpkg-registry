vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 732e0848f8c99deb35da7f18b599cbfd0edda175
        SHA512 4f97fea87b570555684c59489f9b1ce5487c6235b8077d1c841e6524ff82ab6ecbf740a9a7139955daaed35c62cfb4ba842e0ad626b62bb4d798a53546f36948
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
