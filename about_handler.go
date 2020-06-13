package main

import (
  "github.com/gin-gonic/gin"
  "net/http"
)

func GetAboutMarkdown(ctx *gin.Context) {
  about := GetDBClient().GetAboutMarkdown()
  ctx.JSON(http.StatusOK, gin.H{
    "about": *about,
  })
}

func GetAboutHtml(ctx *gin.Context) {
  about := GetDBClient().GetAboutHtml()
  ctx.JSON(http.StatusOK, gin.H{
    "about": *about,
  })
}
