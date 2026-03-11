

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
echo "/src/" >> .git/modules/resources/atmos/info/sparse-checkout
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
echo "/src/" >> .git/modules/resources/f-streams/info/sparse-checkout
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
echo "/src/" >> .git/modules/resources/atmos/info/sparse-checkout
```



## Reference

https://gist.github.com/ZhuoyunZhong/2c08c8549616e03b7f508fea64130558

https://discourse.nixos.org/t/sdl2-sdl-h-not-found/60116/7