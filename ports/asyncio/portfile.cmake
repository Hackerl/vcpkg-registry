vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF aadd50014baa18c9213c7facad109925b2af5867
        SHA512 d81e76a8b5b0b4b50109c78ee0870111a1904aae9c0cde9a3ae34994678a4858b91ceb2042064934649882bbc4d56759699a6f686a4fe98cb344ba9c8ae2777a
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
