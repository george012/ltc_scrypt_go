//go:build linux && amd64

package ltc_scrypt_go

/*
#cgo linux,amd64 CFLAGS: -I${SRCDIR}/linux -I${SRCDIR}/lib/include
#cgo linux,amd64 CPPFLAGS: -I${SRCDIR}/lib/linux -I${SRCDIR}/lib/include
#cgo linux,amd64 LDFLAGS: ${SRCDIR}/lib/linux/libscrypt.a -lssl -lcrypto
*/
import "C"
