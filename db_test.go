package main

import (
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
