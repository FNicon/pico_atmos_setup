

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { };
in
with pkgs;
mkShell {
  packages = with pkgs; [
    libgcc
    (lua5_4.withPackages (
      ps: with ps; [
      ]
    ))
  ];

  shellHook = ''
    cd atmos
    chmod +x launch
    ./launch ../../../game/main.atm
    exit
  '';
}
