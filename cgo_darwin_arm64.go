//go:build darwin && arm64

package ltc_scrypt_go

/*
#cgo darwin,arm64 CFLAGS: -I${SRCDIR}/lib/darwin/arm64 -I${SRCDIR}/lib/include
#cgo darwin,arm64 CPPFLAGS: -I${SRCDIR}/lib/darwin/arm64 -I${SRCDIR}/lib/include
#cgo darwin,arm64 LDFLAGS: ${SRCDIR}/lib/darwin/libscrypt_arm64.a -lssl -lcrypto
*/
import "C"
