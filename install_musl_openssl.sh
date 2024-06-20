#!/bin/bash
set -e

OPENSSL_VERSION="3.0.2"
OPENSSL_TAR="https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz"

# 下载 OpenSSL 源代码
if [ ! -f "openssl-${OPENSSL_VERSION}.tar.gz" ]; then
    wget ${OPENSSL_TAR}
fi

# 解压源代码
tar -xzf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}

# 设置交叉编译环境
export CROSS_COMPILE=x86_64-linux-musl-
export CC=${CROSS_COMPILE}gcc
export AR=${CROSS_COMPILE}ar
export RANLIB=${CROSS_COMPILE}ranlib

# 配置和编译 OpenSSL
./Configure linux-musl no-shared --prefix=/usr/local/musl
make
make install

# 清理
cd ..
rm -rf openssl-${OPENSSL_VERSION}

echo "OpenSSL for musl-cross compiled and installed successfully."
