vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Hackerl/zero
        REF 2782760fe8d8fc398828c4fe5b84c3c03122b9d9
        SHA512 7389a799d0c151eebcd5b5261e47f06b5aef0232782b15737d038a8ec69d3c69a7cb75230a35a49220b8b9deba460dd16ff0a22d3692d399a2b319bffe230ad3
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
