package rgblog

import (
	"crypto/md5"
	"encoding/hex"
	"log"
	"strconv"
)

// ConvertQueryStringToNumber 将 map 中的查询串转换为数字形式
func ConvertQueryStringToNumber(source map[string]string) (map[string]int, error) {
  log.Printf("sourceMap: %v\n", source)
  convertedParams := make(map[string]int)
  var err error
  for k, v := range source {
    nv, err := strconv.Atoi(v)
    if err != nil {
      return nil, err
    }
    convertedParams[k] = nv
  }
  return convertedParams, err
}

// GetMD5HashInHexString 对给定的字符串求 MD5 HASH 并转为 16 进制字符串返回
func GetMD5HashInHexString(source string) string {
  hasher := md5.New()
  hasher.Write([]byte(source))
  return hex.EncodeToString(hasher.Sum(nil))
}
