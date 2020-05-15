package main

import (
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

// DBClient 是数据库操作类
type DBClient struct {
	db *gorm.DB
}

var client DBClient

// GetDBClient 提供获取数据库操作类的客户端
func GetDBClient() *DBClient {
	return &client
}

func init() {
	db, err := gorm.Open("mysql", "stormlin:123456789@/blog?charset=utf8mb4&parseTime=True&loc=Local")
	if err != nil {
		log.Fatalf("error: %s\n", err.Error())
	}
	client.db = db
}

// GetArticleMetadataByPage 按页获取文章元信息
func (client *DBClient) GetArticleMetadataByPage(offset, limit int) *[]Article {
	articleList := make([]Article, 0)
	client.db.Table(TableNameArticle).Select(ArticleMetadataColumns).Offset(offset).Limit(limit).Find(&articleList)
	return &articleList
}

func (client *DBClient) GetPublicArticleCount() int {
	var count int
	client.db.Table(TableNameArticle).Where("is_hidden = ? AND is_deleted = ?", 0, 0).Count(&count)
	return count
}
