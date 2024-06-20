//go:build (darwin && amd64) || (darwin && arm64) || (linux && amd64) || (linux && arm64) || (windows && amd64) || (windows && arm64)

package ltc_scrypt_go

/*
#cgo darwin,amd64 CFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,amd64 CPPFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,amd64 LDFLAGS: ${SRCDIR}/lib/darwin/libscrypt.a /usr/local/opt/openssl/lib/libssl.a /usr/local/opt/openssl/lib/libcrypto.a

#cgo darwin,arm64 CFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,arm64 CPPFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,arm64 LDFLAGS: ${SRCDIR}/lib/darwin/libscrypt_arm64.a /usr/local/opt/openssl/lib/libssl.a /usr/local/opt/openssl/lib/libcrypto.a

#cgo linux,amd64 CFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include -I/usr/include/openssl
#cgo linux,amd64 CPPFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include -I/usr/include/openssl
#cgo linux,amd64 LDFLAGS: ${SRCDIR}/lib/linux/libscrypt.a /usr/lib/x86_64-linux-gnu/libssl.a /usr/lib/x86_64-linux-gnu/libcrypto.a

#cgo linux,arm64 CFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include -I/usr/include/openssl
#cgo linux,arm64 CPPFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include -I/usr/include/openssl
#cgo linux,arm64 LDFLAGS: ${SRCDIR}/lib/linux/libscrypt_arm64.a /usr/lib/aarch64-linux-gnu/libssl.a /usr/lib/aarch64-linux-gnu/libcrypto.a

#cgo windows,amd64 CFLAGS: -I${SRCDIR}/lib/windows -I${SRCDIR}/lib/include
#cgo windows,amd64 CPPFLAGS: -I${SRCDIR}/lib/windows -I${SRCDIR}/lib/include
#cgo windows,amd64 LDFLAGS: ${SRCDIR}/lib/windows/libscrypt.a C:/msys64/mingw64/lib/libssl.a C:/msys64/mingw64/lib/libcrypto.a

#cgo windows,arm64 CFLAGS: -I${SRCDIR}/lib/windows -I${SRCDIR}/lib/include
#cgo windows,arm64 CPPFLAGS: -I${SRCDIR}/lib/windows -I${SRCDIR}/lib/include
#cgo windows,arm64 LDFLAGS: ${SRCDIR}/lib/windows/libscrypt_arm64.a /mingw64/lib/libssl.a /mingw64/lib/libcrypto.a
*/
import "C"
