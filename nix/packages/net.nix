{ pkgs, globalprotect-openconnect }:
[
  globalprotect-openconnect.packages.${pkgs.system}.prebuilt
]
