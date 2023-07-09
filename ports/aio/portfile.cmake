vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/aio
        REF a04a550d616a7a901acf906b74b146bd9af965ab
        SHA512 cf5b91c955382e1a3d8a6ac5ad4de3e4debb173687470db0574904550e71f880e1d06dd62405b4e3e260171ec1fb6b9ec5dcc2cf3e9c8d0a94c6448b03a6d9f6
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES embedded AIO_EMBED_CA_CERT
        INVERTED_FEATURES openssl AIO_DISABLE_SSL
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        ${FEATURE_OPTIONS}
        -DAIO_DISABLE_TESTS=ON
        -DAIO_DISABLE_SAMPLES=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
