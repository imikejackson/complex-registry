vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bluequartzsoftware/ebsdlib
  REF "v${VERSION}"
  SHA512 50bd5a81a3835e3c66a454d29ccf687972a5935e80b029bec8fbfc597dbd16ed6bad89e2491432b9e0af7c5147ed0811d32bf07f4b41a22128115d5ad07d6ecd
  HEAD_REF develop
)

set(EBSDLIB_COMMIT_HASH "d280acdd2f5d1c6e9df3b806f692487a4c8b87b7")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    hdf5      EbsdLib_ENABLE_HDF5
    parallel  EbsdLib_USE_PARALLEL_ALGORITHMS
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DDREAM3D_ANACONDA=ON
    -DCMP_TBB_ENABLE_COPY_INSTALL=OFF
    -DEbsdLib_ENABLE_TESTING=OFF
    -DEbsdLib_BUILD_TOOLS=OFF
    -DEbsdLib_BUILD_H5SUPPORT=OFF
    -DEbsdLib_CMAKE_CONFIG_INSTALL_DIR=share/${PORT}
    -DTBB_STATUS_PRINTED=ON
    -DGVS_GIT_HASH=${EBSDLIB_COMMIT_HASH}
    ${FEATURE_OPTIONS}
  MAYBE_UNUSED_VARIABLES
    CMP_TBB_ENABLE_COPY_INSTALL
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
