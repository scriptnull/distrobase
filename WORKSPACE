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
        "openssh-client"
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
    name = "nodejs",
    registry = "gcr.io",
    repository = "distroless/nodejs",
    digest = "sha256:35da7f3e98660f26928cfc260591a6bb8e4e9fbe4680da1532e4f8586967838a",
    tag = "latest"
)
