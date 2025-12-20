vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/asyncio
        REF 2a834e2a9cb9eb4b1a88cab200af503e981ab1f0
        SHA512 5200fd5fdc5e9927a6cc0acfb69930145140537d37e2ca2a1948d07c50816818b49e4fe478fdd71fe893fa059f21912ab21caa31948aa868990fbe3ddee31efd
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
