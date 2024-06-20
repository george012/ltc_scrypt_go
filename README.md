
<!-- TOC -->

- [1. info](#1-info)
- [2. use](#2-use)
- [3. depends_Linux](#3-depends_linux)
- [4. depends_Darwin](#4-depends_darwin)
- [5. depends_Windows](#5-depends_windows)
- [6. Test](#6-test)

<!-- /TOC -->

# 1. info
* copy with [github.com/litecoin-project/litecoin](https://github.com/litecoin-project/litecoin)
* copy `scrypt.cpp` [litecoin/src/crypto/scrypt.cpp](https://github.com/litecoin-project/litecoin/tree/master/src/crypto/scrypt.cpp)
* copy `scrypt.h` [litecoin/src/crypto/scrypt.h](https://github.com/litecoin-project/litecoin/tree/master/src/crypto/scrypt.h)

# 2. use
```
go get -u github.com/george012/ltc_scrypt_go@latest
```

# 3. depends_Linux
```
sudo apt update
sudo apt install openssl libssl-dev

```

# 4. depends_Darwin
```
brew install openssl

vim ~/.bash_profile

#OpenSSL
export OPENSSL_ROOT_DIR=$(brew --prefix openssl)
export OPENSSL_LIBRARIES=$OPENSSL_ROOT_DIR/lib
export OPENSSL_INCLUDE_DIR=$OPENSSL_ROOT_DIR/include
export PKG_CONFIG_PATH=$OPENSSL_ROOT_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
```

# 5. depends_Windows
* msys2 and mingw64
```
  - name: Install MSYS2 using choco
    if: matrix.os == 'windows-latest'
    run: choco install msys2 --params "/InstallDir=C:\msys64"

  - name: Setup MSYS2 and install dependencies
    if: matrix.os == 'windows-latest'
    run: |
      C:\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm && pacman -S --noconfirm base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake mingw-w64-x86_64-openssl"
      echo "C:\\msys64\\mingw64\\bin" >> $GITHUB_ENV
      echo "C:\\msys64\\usr\\bin" >> $GITHUB_ENV

pacman -Syu mingw64-toolchain 

```


# 6. Test
```
go test -v -run ./...
```