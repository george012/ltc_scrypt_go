// Package ltc_scrypt_go
/*
	en: provides functions to compute scrypt hash and related utilities.
	zh-CN: 提供了计算 scrypt 哈希及相关工具的功能。
*/
package ltc_scrypt_go

/*
#include <stdlib.h>
#include "scrypt.h"
*/
import "C"
import (
	"encoding/hex"
	"sync"
	"unsafe"
)

var mutex sync.Mutex

// CalcScryptHash
/*
	en: computes the scrypt hash of the input bytes;
	zh-CN: 计算输入字节的scrypt哈希;
 	@params bytesInput en: Input byte array; zh-CN: 输入的字节数组;
	@return en: Scrypt hash byte array; zh-CN: scrypt哈希字节数组;
*/
func CalcScryptHash(bytesInput []byte) []byte {
	mutex.Lock()
	defer mutex.Unlock()

	// avoid of the situation of empty bytes array
	bytesInput = append(bytesInput, byte(0x0))
	input := (*C.char)(unsafe.Pointer(&bytesInput[0]))

	bytesOutput := make([]byte, 32)
	output := (*C.char)(unsafe.Pointer(&bytesOutput[0]))

	C.scrypt_1024_1_1_256(input, output)

	return bytesOutput
}

// CalcScryptHashHex
/*
	en: computes the scrypt hash of the input bytes and returns it as a hexadecimal string;
	zh-CN: 计算输入字节的scrypt哈希并以十六进制字符串返回;
	@params bytesInput en: Input byte array; zh-CN: 输入的字节数组;
	@return en: Scrypt hash hexadecimal string; zh-CN: scrypt哈希十六进制字符串;
*/
func CalcScryptHashHex(bytesInput []byte) string {
	bytesRet := CalcScryptHash(bytesInput)
	return hex.EncodeToString(bytesRet)
}
