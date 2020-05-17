package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// GetArticleMetadataByPage 按页获取文章元数据
func GetArticleMetadataByPage(context *gin.Context) {
	log.Printf("request path: %s, query: %v", context.Request.URL.Path, context.Request.URL.Query())

	sourceMap := make(map[string]string)
	sourceMap["offset"] = context.DefaultQuery("offset", DefaultOffset)
	sourceMap["limit"] = context.DefaultQuery("limit", DefaultLimit)
	queryMap, err := ConvertQueryStringToNumber(sourceMap)
	if err != nil {
		context.Abort()
		return
	}

	log.Printf("query article metadata with parameter: offset = %d, limit = %d\n",
		queryMap["offset"], queryMap["limit"])
	metadataList := GetDBClient().GetArticleMetadataByPage(
		queryMap["offset"], queryMap["limit"])
	context.JSON(http.StatusOK, gin.H{
		"metadataList": metadataList,
	})
}
