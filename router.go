package rgblog

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

var router *gin.Engine

func SetupRouter(r *gin.Engine) {
	r.Use(cors.Default())

	api := r.Group("/api")
	{
		api.GET("/article/metadata", GetArticleMetadataByPage)
		api.GET("/article/public-count", GetPublicArticleCount)

		api.GET("/article/detail/:slug", GetArticlePageDetailBySlug)

		api.GET("/series", GetAllSeriesArticle)

		api.GET("/archive", GetArchivedArticle)

		api.GET("/about/markdown", GetAboutMarkdown)
		api.GET("/about/html", GetAboutHtml)

		api.POST("/login/auth", GetAuthorization)
	}
}

// GetRouter 方法返回注册 handler 路径之后的 router 实例
func GetRouter() *gin.Engine {
	if router == nil {
		router = gin.Default()
	}
	return router
}
