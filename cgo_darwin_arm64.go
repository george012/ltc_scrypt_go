//go:build darwin && arm64

package ltc_scrypt_go

/*
#cgo darwin,arm64 CFLAGS: -I${SRCDIR}/lib/darwin/arm64 -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,arm64 CPPFLAGS: -I${SRCDIR}/lib/darwin/arm64 -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,arm64 LDFLAGS: ${SRCDIR}/lib/darwin/libscrypt_arm64.a ${OPENSSL_LIBRARIES}/libssl.a ${OPENSSL_LIBRARIES}/libcrypto.a
*/
import "C"
