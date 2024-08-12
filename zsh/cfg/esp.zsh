export_esp() {
  local esp_path="$HOME/.rustup/toolchains/esp"
  local last_clang_toolchain=$(ls "$esp_path/xtensa-esp32-elf-clang" | tail -1)
  local last_toolchain=$(ls "$esp_path/xtensa-esp-elf" | tail -1)

  export LIBCLANG_PATH="$esp_path/xtensa-esp32-elf-clang/$last_clang_toolchain/esp-clang/lib"
  export PATH="$esp_path/xtensa-esp-elf/$last_toolchain/xtensa-esp-elf/bin:$PATH"
}
