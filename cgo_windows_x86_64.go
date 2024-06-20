//go:build windows && amd64

package ltc_scrypt_go

/*
#cgo windows,amd64 CFLAGS: -I${SRCDIR}/lib/include
#cgo windows,amd64 CPPFLAGS: -I${SRCDIR}/lib/include
#cgo windows,amd64 LDFLAGS: ${SRCDIR}/lib/windows/libscrypt.a ${OPENSSL_LIBRARIES}/libssl.a ${OPENSSL_LIBRARIES}/libcrypto.a
*/
import "C"
