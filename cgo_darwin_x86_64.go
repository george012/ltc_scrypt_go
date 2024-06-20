//go:build darwin && amd64

package ltc_scrypt_go

/*
#cgo darwin,amd64 CFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include
#cgo darwin,amd64 CPPFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include
#cgo darwin,amd64 LDFLAGS: ${SRCDIR}/lib/darwin/libscrypt.a -lssl -lcrypto
*/
import "C"
