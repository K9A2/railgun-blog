package rgblog

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// GetArticleMetadataByPage 按页获取文章元数据
func GetArticleMetadataByPage(context *gin.Context) {
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

// GetPublicArticleCount 获取可公开查看的文章总数
func GetPublicArticleCount(ctx *gin.Context) {
  count := GetDBClient().GetPublicArticleCount()
  ctx.JSON(http.StatusOK, gin.H{
    "publicArticleCount": count,
  })
}

// GetArticlePageDetailBySlug 返回文章内容页所需的内容
func GetArticlePageDetailBySlug(context *gin.Context) {
  slug := context.Param("slug")
  detail := GetDBClient().GetArticlePageDetailBySlug(slug)
  context.JSON(http.StatusOK, gin.H{
    "detail": detail,
  })
}
