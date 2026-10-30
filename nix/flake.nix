{
  description = "install packages defined in the subdirectory";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    globalprotect-openconnect = {
      url = "github:yuezk/GlobalProtect-openconnect";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, globalprotect-openconnect }: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

    packageDir = ./packages;

    packageFiles = builtins.readDir "${packageDir}";

    packageNames = builtins.filter
      (f: packageFiles.${f} == "regular")
      (builtins.attrNames packageFiles);

    mkPackage = file:
    let
      name = builtins.replaceStrings [".nix"] [""] file;
    in {
      inherit name;
      value = pkgs.buildEnv {
        inherit name;
        paths = import ("${packageDir}/${file}") { inherit pkgs globalprotect-openconnect; };
      };
    };

    generatedPackages = builtins.listToAttrs (map mkPackage packageNames);

  in {
    packages.${system} = 
      generatedPackages
      // {
        default = pkgs.buildEnv {
          name = "all";
          paths = pkgs.lib.concatLists (
            map (file: import ("${packageDir}/${file}") { inherit pkgs globalprotect-openconnect; }) packageNames
          );
        };
      };
  };
}
