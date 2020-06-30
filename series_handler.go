package rgblog

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetAllSeriesArticle(ctx *gin.Context) {
  seriesArticle := GetDBClient().GetAllSeriesArticle()
  ctx.JSON(http.StatusOK, gin.H{
    "seriesArticle": seriesArticle,
  })
}
