package main

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

var router *gin.Engine

func setupRouter(r *gin.Engine) {
	r.Use(cors.Default())

	api := r.Group("/api")
	{
		api.GET("/article/metadata", GetArticleMetadataByPage)
	}
}

// GetRouter 方法返回注册 handler 路径之后的 router 实例
func GetRouter() *gin.Engine {
	if router == nil {
		router = gin.Default()
	}
	return router
}
