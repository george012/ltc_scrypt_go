//go:build linux && arm64

package ltc_scrypt_go

/*
#cgo linux,arm64 CFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include
#cgo linux,arm64 CPPFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include
#cgo linux,arm64 LDFLAGS: ${SRCDIR}/lib/linux/libscrypt_arm64.a -lssl -lcrypto
*/
import "C"
