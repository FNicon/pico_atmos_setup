

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { };
  PROJECT_ROOT = builtins.toString ./.;
in
with pkgs;
mkShell {
  name = "SDL2";

  nativeBuildInputs = [
    pkg-config

    cmake
  ];

  packages = with pkgs; [
    cowsay
    lolcat

    libgcc
    xvfb-run

    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    SDL2_gfx

    (lua5_4.withPackages (
      ps: with ps; [

      ]
    ))
  ];

  shellHook = ''
    cd pico-sdl/lua
    chmod +x pico-lua

    LD_LIBRARY_PATH=${pkgs.lua5_4}/include:${pkgs.SDL2}/lib:${pkgs.SDL2_image}/lib:${pkgs.SDL2_mixer}/lib:${pkgs.SDL2_ttf}/lib:${pkgs.SDL2_gfx}/lib
    echo $LD_LIBRARY_PATH | lolcat

    pkg-config --cflags --libs sdl2 SDL2_image SDL2_mixer SDL2_ttf SDL2_gfx  

    make pico_native.so -B
    # mv ./pico/pico_native.so ../../../../game/birds/pico_native.so
    # cowsay start atmos | lolcat
    # cd ../../../../game/birds
    # chmod +x launch
    # ./launch birds-01.atm
    # ./launch main.atm
    exit
  '';
}
