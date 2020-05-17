package main

import (
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
