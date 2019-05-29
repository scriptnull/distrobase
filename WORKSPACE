workspace(name = "distrobase")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "distroless",
    sha256 = "af1dd62ace9925f8aec73d303397c29f54611b6beef9901229dceecdbd3622ed",
    strip_prefix = "distroless-b4dfb5c3076302a873be8e413c120771c4cc2e1b",
    urls = ["https://github.com/GoogleContainerTools/distroless/archive/b4dfb5c3076302a873be8e413c120771c4cc2e1b.tar.gz"],
)

load(
    "@distroless//package_manager:package_manager.bzl",
    "dpkg_list",
    "dpkg_src",
    "package_manager_repositories",
)

package_manager_repositories()

dpkg_src(
    name = "debian_stretch",
    arch = "amd64",
    distro = "stretch",
    sha256 = "79a66cd92ba9096fce679e15d0b5feb9effcf618b0a6d065eb32684dbffd0311",
    snapshot = "20190322T151132Z",
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_backports",
    arch = "amd64",
    distro = "stretch-backports",
    sha256 = "36b3c35b2c01d22476736b0c26e6037dddeccf1d7a775b3fbd5dd991b58cceab",
    snapshot = "20190322T155353Z",
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_security",
    package_prefix = "https://snapshot.debian.org/archive/debian-security/20190322T155353Z/",
    packages_gz_url = "https://snapshot.debian.org/archive/debian-security/20190322T155353Z/dists/stretch/updates/main/binary-amd64/Packages.gz",
    sha256 = "5dc5641648e7773dcd14e5ac2afd1803e8639b8b793ac5975793f8e98908d8ff",
)

dpkg_list(
    name = "package_bundle",
    packages = [
        "libssl1.0.2",
        "openssh-client",
        "libcom-err2",
        "dash",
        "libtinfo5",
        "debianutils",
        "bash",
        "libpcre3",
        "libattr1",
        "libacl1",
        "libbz2-1.0",
        "liblzma5",
        "multiarch-support",
        "libselinux1",
        "zlib1g",
        "tar",
        "libgnutls30",
        "libgmp10",
        "libnettle6",
        "libhogweed4",
        "libidn11",
        "libffi6",
        "libp11-kit0",
        "libtasn1-6",
        "libkeyutils1",
        "libkrb5support0",
        "libgssapi-krb5-2",
        "libk5crypto3",
        "libkrb5-3",
        "libdb5.3",
        "libsasl2-modules-db",
        "libsasl2-2",
        "libldap-common",
        "libldap-2.4-2",
        "libunistring0",
        "libpsl5",
        "librtmp1",
        "libgpg-error0",
        "libgcrypt20",
        "libssh2-1",
        "perl-base",
        "perl-modules-5.24",
        "libgdbm3",
        "libperl5.24",
        "perl",
        "liberror-perl",
        "dpkg",
        "git-man",
        "libcurl3-gnutls",
        "libexpat1",
        "libnghttp2-14",
        "libidn2-0",
        "libcurl3",
        "curl",
        "git",
        "coreutils",
        "gzip"
    ],
    sources = [
        "@debian_stretch_security//file:Packages.json",
        "@debian_stretch_backports//file:Packages.json",
        "@debian_stretch//file:Packages.json",
    ],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "aed1c249d4ec8f703edddf35cbe9dfaca0b5f5ea6e4cd9e83e99f3b0d1136c3d",
    strip_prefix = "rules_docker-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.7.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "cc",
    registry = "gcr.io",
    repository = "distroless/cc",
    digest = "sha256:f4dddc007e81bf9a8dfbf6a07a0db5c70292bed76dca896f7d4833f6f33eed2f",
    tag = "latest"
)

http_archive(
    name = "nodejs",
    build_file = "//:BUILD.nodejs",
    sha256 = "b391450e0fead11f61f119ed26c713180cfe64b363cd945bac229130dfab64fa",
    strip_prefix = "node-v8.16.0-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v8.16.0/node-v8.16.0-linux-x64.tar.gz"],
)
