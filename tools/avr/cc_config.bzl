load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "action_config",
    "artifact_name_pattern",
    "env_entry",
    "env_set",
    "feature",
    "feature_set",
    "flag_group",
    "flag_set",
    "make_variable",
    "tool",
    "tool_path",
    "variable_with_value",
    "with_feature_set",
)
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

def _impl(ctx):
    toolchain_identifier = "avr8-gnu-toolchain-linux_x86_64"

    host_system_name = "x86_64-pc-linux-gnu"

    target_system_name = "avr"

    target_cpu = "avr"

    target_libc = "avr"

    compiler = "gcc"

    abi_version = "avr"

    abi_libc_version = "avr"

    cc_target_os = None

    builtin_sysroot = None

    all_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.clif_match,
        ACTION_NAMES.lto_backend,
    ]

    all_cpp_compile_actions = [
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.clif_match,
    ]

    preprocessor_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.clif_match,
    ]

    codegen_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.lto_backend,
    ]

    all_link_actions = [
        ACTION_NAMES.cpp_link_executable,
        ACTION_NAMES.cpp_link_dynamic_library,
        ACTION_NAMES.cpp_link_nodeps_dynamic_library,
    ]

    action_configs = []

    features = []

    cxx_builtin_include_directories = [
            "/usr/lib/gcc/avr/5.4.0/include",
            "/usr/lib/gcc/avr/5.4.0/include-fixed",
            "/usr/lib/avr/include/"
        ]

    artifact_name_patterns = []

    make_variables = []

    tool_paths = [
        tool_path(
            name = "ar",
            path = "/usr/bin/avr-ar",
        ),
        tool_path(
            name = "compat-ld",
            path = "/usr/bin/avr-ld",
        ),
        tool_path(
            name = "cpp",
            path = "/usr/bin/avr-cpp",
        ),
        tool_path(
            name = "gcc",
            path = "/usr/bin/avr-gcc",
        ),
        tool_path(
            name = "gcov",
            path = "/usr/bin/avr-gcov",
        ),
        tool_path(
            name = "ld",
            path = "/usr/bin/avr-ld",
        ),
        tool_path(
            name = "nm",
            path = "/usr/bin/avr-gcc-nm",
        ),
        tool_path(
            name = "objcopy",
            path = "/usr/bin/avr-objcopy",
        ),
        tool_path(
            name = "objdump",
            path = "/usr/bin/avr-objdump",
        ),
        tool_path(
            name = "strip",
            path = "/usr/bin/avr-strip",
        ),
    ]


    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(out, "Fake executable")
    return [
        cc_common.create_cc_toolchain_config_info(
            ctx = ctx,
            features = features,
            action_configs = action_configs,
            artifact_name_patterns = artifact_name_patterns,
            cxx_builtin_include_directories = cxx_builtin_include_directories,
            toolchain_identifier = toolchain_identifier,
            host_system_name = host_system_name,
            target_system_name = target_system_name,
            target_cpu = target_cpu,
            target_libc = target_libc,
            compiler = compiler,
            abi_version = abi_version,
            abi_libc_version = abi_libc_version,
            tool_paths = tool_paths,
            make_variables = make_variables,
            builtin_sysroot = builtin_sysroot,
            cc_target_os = cc_target_os
        ),
        DefaultInfo(
            executable = out,
        ),
    ]
cc_toolchain_config =  rule(
    implementation = _impl,
    attrs = {
        "cpu": attr.string(mandatory=True, values=["avr"]),
    },
    provides = [CcToolchainConfigInfo],
    executable = True,
)
