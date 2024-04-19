vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 6a82c09948e40dc43fa091e7acddfaef7d1ae9d6
	SHA512 b7537885167fb65b7dba1dd2ed59d16f73921ab4f460ba5f9b86f8bb71d154877aa5888359857f8e0417e34abcc5215305cbf22867b49d73dde29227455f7d20
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
