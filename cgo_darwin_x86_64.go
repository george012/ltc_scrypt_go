//go:build darwin && amd64

package ltc_scrypt_go

/*
#cgo darwin,amd64 CFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,amd64 CPPFLAGS: -I${SRCDIR}/lib/darwin -I${SRCDIR}/lib/include -I/usr/local/opt/openssl/include
#cgo darwin,amd64 LDFLAGS: ${SRCDIR}/lib/darwin/libscrypt.a /usr/local/opt/openssl/lib/libssl.a /usr/local/opt/openssl/lib/libcrypto.a
*/
import "C"
