vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF d3a25473bdfe57250c2b1eb8fb5a380f228c3574
        SHA512 bac578be9b897768948e0243a83435d50a03e908574f44470f72de448aaebe6640269a791f28b701cdec9e980d33986713b98ba08b67703609ca8f105128ae7f
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
