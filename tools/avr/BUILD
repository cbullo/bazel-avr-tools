load(":cc_config.bzl", "cc_toolchain_config")

package(default_visibility = ['//visibility:public'])

# filegroup(
#   name = 'ar',
#   srcs = [
#     '/usr/bin/avr-ar',
#   ],
# )

# filegroup(
#   name = 'as',
#   srcs = [
#     '/usr/bin/avr-as',
#   ],
# )

# filegroup(
#   name = 'gcc',
#   srcs = [
#     '/usr/bin/avr-gcc',
#   ],
# )

# filegroup(
#   name = 'ld',
#   srcs = [
#     '/usr/bin/avr-ld',
#   ],
# )

# filegroup(
#   name = 'nm',
#   srcs = [
#     '/usr/bin/avr-gcc-nm',
#   ],
# )

# filegroup(
#   name = 'objcopy',
#   srcs = [
#     '/usr/bin/avr-objcopy',
#   ],
# )

# filegroup(
#   name = 'objdump',
#   srcs = [
#     '/usr/bin/avr-objdump',
#   ],
# )

# filegroup(
#   name = 'size',
#   srcs = [
#     '/usr/bin/avr-size',
#   ],
# )

# filegroup(
#   name = 'strip',
#   srcs = [
#     '/usr/bin/avr-strip',
#   ],
# )


# filegroup(
#   name = 'compiler_pieces',
#   srcs = glob([
#     'avr8-gnu-toolchain-linux_x86_64/avr/include/**',
#     'avr8-gnu-toolchain-linux_x86_64/avr/lib/**',
#     'avr8-gnu-toolchain-linux_x86_64/include/**',
#     'avr8-gnu-toolchain-linux_x86_64/lib/gcc/avr/**',
#     'avr8-gnu-toolchain-linux_x86_64/libexec/gcc/avr/**',
#     'avr8-gnu-toolchain-linux_x86_64/x86_64-pc-linux-gnu/**',
#   ]),
# )

# filegroup(
#   name = 'compiler_components',
#   srcs = [
#     ':ar',
#     ':as',
#     ':gcc',
#     ':ld',
#     ':nm',
#     ':objcopy',
#     ':objdump',
#     ':size',
#     ':strip',
#   ],
# )

# filegroup(
#   name = 'avr_gcc_all_files',
#   srcs = [
#     ':compiler_pieces',
#     ':compiler_components',
#   ],
# )

# filegroup(
#   name = 'avr_gcc_linker_files',
#   srcs = [
#     ':gcc',
#     ':ld',
#     ':ar',
#     ':compiler_pieces',
#   ],
# )

# filegroup(
#   name = 'avr_gcc_compiler_files',
#   srcs = [
#     ':gcc',
#     ':ld',
#     ':as',
#   ],
# )

cc_toolchain_config(name = "avr8-gnu-toolchain-linux_x86_64_config", cpu = "avr")

cc_toolchain_suite(
  name = 'toolchain',
  toolchains = {
    'avr|gcc': ':cc-compiler-avr-gcc',
  },
)

cc_toolchain(
  name = 'cc-compiler-avr-gcc',
  toolchain_identifier = 'avr8-gnu-toolchain-linux_x86_64',
  toolchain_config = ':avr8-gnu-toolchain-linux_x86_64_config',
  all_files = ':empty',
  compiler_files = ':empty',
  dwp_files = ':empty',
  linker_files = ':empty',
  objcopy_files = ':empty',
  strip_files = ':empty',
  supports_param_files = 1,
)

