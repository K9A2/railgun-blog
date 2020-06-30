package rgblog

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetArchivedArticle(ctx *gin.Context) {
  archivedArticle := GetDBClient().GetArchivedArticle()
  ctx.JSON(http.StatusOK, gin.H{
    "archivedArticle": archivedArticle,
  })
}
