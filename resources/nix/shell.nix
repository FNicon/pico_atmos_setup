

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { };
in
with pkgs;
mkShell {
  name = "SDL2";

  nativeBuildInputs = [
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    SDL2_gfx
    pkg-config

    cmake
  ];
  packages = with pkgs; [
    libgcc
    xvfb-run
    (lua5_4.withPackages (
      ps: with ps; [
      ]
    ))
  ];

  # shellHook = ''
  #   cd atmos
  #   chmod +x launch
  #   ./launch ../../../game/main.atm
  #   exit
  # '';

  shellHook = ''
    LD_LIBRARY_PATH=${pkgs.SDL2}/lib
    LD_LIBRARY_PATH=${pkgs.SDL2_image}/lib
    LD_LIBRARY_PATH=${pkgs.SDL2_mixer}/lib
    LD_LIBRARY_PATH=${pkgs.SDL2_ttf}/lib
    LD_LIBRARY_PATH=${pkgs.SDL2_gfx}/lib
    echo $LD_LIBRARY_PATH
    # PKG_CONFIG_PATH=$PKG_CONFIG_PATH${pkgs.SDL2}/lib
    # PKG_CONFIG_PATH=$PKG_CONFIG_PATH${pkgs.SDL2_image}/lib
    # PKG_CONFIG_PATH=$PKG_CONFIG_PATH${pkgs.SDL2_mixer}/lib
    # PKG_CONFIG_PATH=$PKG_CONFIG_PATH${pkgs.SDL2_ttf}/lib
    # PKG_CONFIG_PATH=$PKG_CONFIG_PATH${pkgs.SDL2_gfx}/lib
    # echo $PKG_CONFIG_PATH
    pkg-config --cflags --libs sdl2 SDL2_image SDL2_mixer SDL2_ttf SDL2_gfx  

    cd pico-sdl/pico-sdl-0.2
    chmod +x pico-sdl
    make tests
    
    exit
  '';
}
