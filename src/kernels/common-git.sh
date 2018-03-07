# For build.sh
mode_name="common-git"
mode_desc="Select and use the packages that are common between all kernels (git version)"

# Version for GIT packages
pkgrel_git="3"
zfs_git_commit=""
spl_git_commit=""
zfs_git_url="https://github.com/zfsonlinux/zfs.git"
spl_git_url="https://github.com/zfsonlinux/spl.git"

header="\
# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
#"

update_common_git_pkgbuilds() {
    pkg_list=("spl-utils-common-git" "zfs-utils-common-git")
    archzfs_package_group="archzfs-linux-git"
    spl_pkgver="" # Set later by call to git_calc_pkgver
    zfs_pkgver="" # Set later by call to git_calc_pkgver
    spl_pkgrel=${pkgrel_git}
    zfs_pkgrel=${pkgrel_git}
    spl_utils_conflicts="'spl-utils-common' 'spl-utils-linux-git' 'spl-utils-linux' 'spl-utils-linux-lts' 'spl-utils-linux-lts-git'"
    zfs_utils_conflicts="'zfs-utils-common' 'zfs-utils-linux-git' 'zfs-utils-linux' 'zfs-utils-linux-lts' 'zfs-utils-linux-lts-git'"
    spl_utils_pkgname="spl-utils-common-git"
    zfs_utils_pkgname="zfs-utils-common-git"
    spl_utils_pkgbuild_path="packages/${kernel_name}/${spl_utils_pkgname}"
    zfs_utils_pkgbuild_path="packages/${kernel_name}/${zfs_utils_pkgname}"
    spl_src_target="git+${spl_git_url}"
    spl_src_hash="SKIP"
    spl_makedepends="\"git\""
    zfs_src_target="git+${zfs_git_url}"
    zfs_src_hash="SKIP"
    zfs_makedepends="\"git\""
    spl_workdir="\${srcdir}/spl"
    zfs_workdir="\${srcdir}/zfs"

    spl_utils_replaces='replaces=("spl-utils-linux", "spl-utils-linux-lts")'
    zfs_utils_replaces='replaces=("zfs-utils-linux", "zfs-utils-linux-lts")'

    if have_command "update"; then
        git_check_repo
        git_calc_pkgver
    fi
    spl_src_target="git+${spl_git_url}#commit=${latest_spl_git_commit}"
    zfs_src_target="git+${zfs_git_url}#commit=${latest_zfs_git_commit}"
}
