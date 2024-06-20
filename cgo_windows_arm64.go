//go:build windows && arm64

package ltc_scrypt_go

/*
#cgo windows,arm64 CFLAGS: -I${SRCDIR}/lib/include
#cgo windows,arm64 CPPFLAGS: -I${SRCDIR}/lib/include
#cgo windows,amd64 LDFLAGS: ${SRCDIR}/lib/windows/libscrypt_arm64.a ${OPENSSL_LIBRARIES}/libssl.a ${OPENSSL_LIBRARIES}/libcrypto.a
*/
import "C"
