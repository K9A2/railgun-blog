package main

import "github.com/gin-gonic/gin"

var router *gin.Engine

func init() {
	router = gin.Default()
	api := router.Group("/api")
	{
		api.GET("/article/metadata", GetArticleMetadataByPage)
	}
}

// GetRouter 方法返回注册 handler 路径之后的 router 实例
func GetRouter() *gin.Engine {
	return router
}
