package main

import (
	"log"
	"net/http"
)

// GetDefaultQuery 从请求 req 中提取查询串，不存在就返回默认值
func GetDefaultQuery(r *http.Request, key, defaultValue string) string {
	values, ok := r.URL.Query()[key]
	if !ok || len(values[0]) < 1 {
		log.Printf("url param %s is missing\n", key)
		return defaultValue
	}
	return values[0]
}
