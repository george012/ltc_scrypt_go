# ltc_scrypt_go

## Test
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

```