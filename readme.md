# About

This repo is for pico-atmos in NixOS setup using vscode

# Dependency

atmos-lang(atmos(f-streams))

pico-lua (pico-sdl (sdl2))

## Atmos-Lang

```bash
cd resources
git submodule add https://github.com/atmos-lang/atmos/ atmos-lang
cd atmos
git sparse-checkout init --cone
```

```bash
git sparse-checkout set "src"
```
or
```bash
cd ../
echo "/src/" >> .git/modules/resources/atmos-lang/info/sparse-checkout
```

## F-Streams

```bash
cd resources
git submodule add https://github.com/lua-atmos/f-streams/
cd f-streams
git sparse-checkout init --cone
```

```bash
git sparse-checkout set "streams"
```
or
```bash
cd ../
echo "/streams/" >> .git/modules/resources/f-streams/info/sparse-checkout
```

## Atmos

```bash
cd resources
git submodule add https://github.com/lua-atmos/atmos
cd atmos
git sparse-checkout init --cone
```

```bash
git sparse-checkout set "atmos"
```
or
```bash
cd ../
echo "/atmos/" >> .git/modules/resources/atmos/info/sparse-checkout
```

### Atmos Folder Setup

```
atmos/
├── atmos/ (from https://github.com/lua-atmos/atmos)
│   ├── env/ (from https://github.com/lua-atmos/atmos)
│   │   ├──...
│   ├── lang/ (from https://github.com/atmos-lang/atmos/tree/main/src)
│   │   ├──...
│   ├── init.lua (from https://github.com/lua-atmos/atmos)
│   ├── run.lua (from https://github.com/lua-atmos/atmos)
│   ├── streams.lua (from https://github.com/lua-atmos/atmos)
│   ├── util.lua (from https://github.com/lua-atmos/atmos)
│   └── x.lua (from https://github.com/lua-atmos/atmos)
├── streams/ (from https://github.com/lua-atmos/f-streams/tree/main/streams)
│   │   ├──...
└── launch (from https://github.com/atmos-lang/atmos/blob/main/atmos)
```

## Pico-Lua

```bash
cd resources
git submodule add https://github.com/fsantanna/pico-sdl
cd pico-sdl
git sparse-checkout init --cone
```

```bash
git sparse-checkout set "lua"
git sparse-checkout set "src"
```
or
```bash
cd ../
echo "/lua/" >> .git/modules/resources/pico-sdl/info/sparse-checkout
echo "/src/" >> .git/modules/resources/pico-sdl/info/sparse-checkout
```

### Pico-Lua Folder Setup

```
pico-sdl/
├── lua/
│  ├── pico/
│  │   ├──...
│  ├── Makefile
│  ├── pico-lua
│  └── pico.c
└── src/
   ├──...
```

## 

```bash
cd resources/nix/atmos
chmod +x launch
./launch ../../../game/main.atm
```

## pico in atmos-lang errors

### pico_init: Assertion `G.init == 1' failed.
pico need to be initialized first.
```
pico.init(true)
```

### attempt to call a nil value (field 'title')

it's not like this :
```
pico.zet.title "Birds - 01 (task)"
```
but this :
```
pico.zet.window @{title="Birds - 01 (task)"}
```

### module 'battle' not found:

set your projects folder like this.

```
game/
├── atmos/
│  ├── env/
│  │  ...
│  ├── lang/
│  │  ...
│  │  └── run.lua
│  ...
│  └── init.lua
├── pico/
│  ...
│  └── init.lua
├── streams/
│  └── init.lua
├── pico_native.so
├── pico-lua
├── launch 
├── battle.atm
└── main.atm
```

## Note when setup in NixOS

Because in NixOS you can kinda set up virtual environment in Nix Shell without affecting outside the virtual environment, we need to change "Lua5.4" to "Lua" from source code and install Lua5.4 as Lua instead. 

We also need tell the program know where the sdl libs are. so we need to add pkg_configs on pico-sdl/lua/Makefile to setup pico_native.so



## Reference

https://gist.github.com/ZhuoyunZhong/2c08c8549616e03b7f508fea64130558

https://discourse.nixos.org/t/sdl2-sdl-h-not-found/60116/7

https://discourse.nixos.org/t/linking-error-in-a-project-using-sdl2/34554

https://github.com/lgi-devs/lgi/issues/219