load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def nanopb_deps():
    if "bazel_skylib" not in native.existing_rules():
        http_archive(
            name = "bazel_skylib",
            sha256 = "cd55a062e763b9349921f0f5db8c3933288dc8ba4f76dd9416aac68acee3cb94",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
                "https://github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
            ],
        )

    # Setup proto rules.
    # Used by: com_github_nanopb_nanopb, rules_proto_grpc.
    # Used in modules: root.
    if "rules_proto" not in native.existing_rules():
        http_archive(
            name = "rules_proto",
            sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",
            strip_prefix = "rules_proto-5.3.0-21.7",
            urls = [
                "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.7.tar.gz",
            ],
        )

    # Required for plugin rules.
    # Used by: com_github_nanopb_nanopb.
    # Used in modules: generator.
    if "rules_python" not in native.existing_rules():
        http_archive(
            name = "rules_python",
            sha256 = "c68bdc4fbec25de5b5493b8819cfc877c4ea299c0dcb15c244c5a00208cde311",
            strip_prefix = "rules_python-0.31.0",
            url = "https://github.com/bazelbuild/rules_python/releases/download/0.31.0/rules_python-0.31.0.tar.gz",
        )

    # Setup grpc tools.
    # Used by: com_github_nanopb_nanopb.
    # Used in modules: generator/proto.
    if "rules_proto_grpc" not in native.existing_rules():
        http_archive(
            name = "rules_proto_grpc",
            sha256 = "b244cbede34638ad0e1aec0769f62b8348c7ed71f431a027e252a07d6adba3d6",
            strip_prefix = "rules_proto_grpc-4.4.0",
            urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/archive/4.4.0.tar.gz"],
        )
