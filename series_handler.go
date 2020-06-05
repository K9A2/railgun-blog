package main

import (
  "github.com/gin-gonic/gin"
  "net/http"
)

func GetAllSeriesArticle(ctx *gin.Context) {
  seriesArticle := GetDBClient().GetAllSeriesArticle()
  ctx.JSON(http.StatusOK, gin.H{
    "seriesArticle": seriesArticle,
  })
}
