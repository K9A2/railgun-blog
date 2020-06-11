package main

import (
  "github.com/gin-gonic/gin"
  "net/http"
)

func GetArchivedArticle(ctx *gin.Context) {
  archivedArticle := GetDBClient().GetArchivedArticle()
  ctx.JSON(http.StatusOK, gin.H{
    "archivedArticle": archivedArticle,
  })
}
