package main

import (
  "encoding/json"
  "log"
  "testing"
)

func TestGetArticleMetadataByPage(t *testing.T) {
  offset := 0
  limit := 3
  dbClient := GetDBClient()
  metadata := dbClient.GetArticleMetadataByPage(offset, limit)
  log.Printf("count: %d\n", len(*metadata))
  for _, value := range *metadata {
    log.Printf("title: %s\n", value.Title)
  }
}

func TestGetPublicArticleCount(t *testing.T) {
  dbClient := GetDBClient()
  count := dbClient.GetPublicArticleCount()
  log.Printf("count: %d", count)
}

func TestGetArticlePageDetailBySlug(t *testing.T) {
  detail := GetDBClient().GetArticlePageDetailBySlug("we-are-traveled-in-bali")
  log.Println("detail", detail)
}

func TestGetAllPublicArticleSimpleTitle(t *testing.T) {
  simpleTitleList := GetDBClient().GetAllPublicArticleSimpleTitle()
  log.Println(simpleTitleList)
}

func TestGetAllSeriesArticle(t *testing.T) {
  seriesArticle := GetDBClient().GetAllSeriesArticle()
  log.Println(seriesArticle)
}

func TestGetAllSeriesArticle2(t *testing.T) {
  seriesArticle := GetDBClient().GetAllSeriesArticle()
  jsonValue, err := json.Marshal(*seriesArticle)
  if err != nil {
    log.Println("error in marshaling json value", err.Error())
    return
  }
  log.Println("jsonValue", string(jsonValue))
}
