vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 73a7ae80e6bf71516eb43556c23b771ded1efa9d
        SHA512 07678bb1fdc3dba3b2f0955f6b7bcc222ec189256e0300f7ddbccb06919c98c00444331f4ecea88d5af9faee5f9deb0e0091b3cde166d1a4b69fe64e513404e7
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        embed-ca ASYNCIO_EMBED_CA_CERT
        stacktrace ASYNCIO_ENABLE_STACKTRACE
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
