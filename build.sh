#!/bin/bash -e

export BAZEL_VERSION="0.24.0"

check_and_install_prereqs() {
  if ! which bazel &> /dev/null; then
    echo "Installing bazel"
    apt-get install -y pkg-config zip g++ zlib1g-dev unzip python
    wget https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
    chmod +x bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
    ./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh --user
    export PATH="$PATH:$HOME/bin"
  fi
}

build_image() {
  bazel run //:master
}

main() {
  check_and_install_prereqs
  build_image
}

main "$@"
