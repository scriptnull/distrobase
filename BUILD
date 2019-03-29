package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@package_bundle//file:packages.bzl", "packages")

container_image(
    name = "master",
    base = "@nodejs//image:image.tar",
    debs = [
        packages["libssl1.0.2"],
        packages["openssh-client"]
    ],
    env = {"PATH": "$PATH:/nodejs/bin/"},
    repository = "drydock/distrobase"
)
