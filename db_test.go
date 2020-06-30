package rgblog

import (
	"encoding/json"
	"log"
	"testing"
	"time"
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

func TestGetArchivedArticle(t *testing.T) {
  archivedArticle := GetDBClient().GetArchivedArticle()
  log.Println(archivedArticle)
}

func TestGetAboutContent(t *testing.T) {
  about := GetDBClient().GetAboutHtml()
  log.Println(*about)
}

func TestGetAboutMarkdown(t *testing.T) {
  about := GetDBClient().GetAboutMarkdown()
  log.Println(*about)
}

func TestGetUserInfoByUsername(t *testing.T) {
  user := GetDBClient().GetUserByUsername("stormlin")
  log.Println(*user)
}

func TestAddNewUser(t *testing.T) {
  currentTime := time.Now()
  user := User{
    CreatedAt: currentTime,
    UpdatedAt: currentTime,
    Username:  "stormlin",
    Password:  "60167c97d4da3448a5a862ba1dad5aea",
  }
  GetDBClient().AddNewUser(&user)
}
