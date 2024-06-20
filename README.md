
<!-- TOC -->

- [1. info](#1-info)
- [depends_Linux](#depends_linux)
- [depends_Darwin](#depends_darwin)
- [depends_Windows](#depends_windows)
- [1.1. Test](#11-test)

<!-- /TOC -->

# 1. info
* copy with [github.com/litecoin-project/litecoin](https://github.com/litecoin-project/litecoin)
* copy `scrypt.cpp` [litecoin/src/crypto/scrypt.cpp](https://github.com/litecoin-project/litecoin/tree/master/src/crypto/scrypt.cpp)
* copy `scrypt.h` [litecoin/src/crypto/scrypt.h](https://github.com/litecoin-project/litecoin/tree/master/src/crypto/scrypt.h)

# depends_Linux
```
Linux 
apt udpate
apt install openssl libssl-dev

```

# depends_Darwin
```
brew install openssl
```

# depends_Windows
* msys2 and mingw64
```
pacman -Syu mingw64-toolchain 

```


# 1.1. Test
```
go test -v -run ./...

# mac opennsl setting

brew install openssl

vim ~/.bash_profile

#OpenSSL
export OPENSSL_ROOT_DIR=$(brew --prefix openssl)
export OPENSSL_LIBRARIES=$OPENSSL_ROOT_DIR/lib
export OPENSSL_INCLUDE_DIR=$OPENSSL_ROOT_DIR/include
export PKG_CONFIG_PATH=$OPENSSL_ROOT_DIR/lib/pkgconfig:$PKG_CONFIG_PATH


Linux 
apt udpate
apt install openssl libssl-dev

```