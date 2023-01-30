vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bluequartzsoftware/nxcommon
  REF v0.1.0
  SHA512 45f43319652474aace5a77f25ee5a1b3ceb13924591b564b4badcdd731885a4b49702d45ab559468c7c0dbf3380fc96d34bf6e8d6050213a4d6ff4560d9bc8c6
  HEAD_REF develop
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS
  -DNXCOMMON_ENABLE_MULTICORE=ON
  -DNXCOMMON_BUILD_TESTS=OFF
  -DNXCOMMON_BUILD_PYTHON=OFF
  -DNXCOMMON_INSTALL_CMAKE_PREFIX=share/${PORT}
  -DNXCOMMON_BUILD_DOCS=OFF
  MAYBE_UNUSED_VARIABLES
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets()
