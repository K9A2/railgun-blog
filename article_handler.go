package main

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

type ArticleHandler struct {
}

// RegisterHandleFunc 向路由器注册处理方法
func (handler *ArticleHandler) RegisterHandleFunc(router *mux.Router) {
	router.HandleFunc("/api/article/metadata", GetArticleMetadataByPage).Methods(http.MethodGet)
	router.HandleFunc("/api/article/metadata/{uri}", GetArticleMetadataByURI).Methods(http.MethodGet)
	router.HandleFunc("/api/article/public-count", GetPublicArticleCount).Methods(http.MethodGet)
}

// GetArticleMetadataByPage 按页获取文章元数据
func GetArticleMetadataByPage(w http.ResponseWriter, r *http.Request) {
	log.Printf("request path: %s, query: %v", r.URL.Path, r.URL.Query())
	// 获取查询参数
	offsetString := GetDefaultQuery(r, "offset", DefaultOffset)
	limitString := GetDefaultQuery(r, "limit", DefaultLimit)
	offset, err := strconv.Atoi(offsetString)
	if err != nil {
		log.Printf("error in parsing query string: %s", offsetString)
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	limit, err := strconv.Atoi(limitString)
	if err != nil {
		log.Printf("error in parsing query string: %s", limitString)
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	log.Printf("query article metadata with parameter: offset = %d, limit = %d\n", offset, limit)
	metadataList := GetDBClient().GetArticleMetadataByPage(offset, limit)
	json.NewEncoder(w).Encode(metadataList)
}

// GetArticleMetadataByURI 按 URI 获取指定文章的元数据
// func GetArticleMetadataByURI(w http.ResponseWriter, r *http.Request) {
// 	log.Printf("request path: %s", r.URL.Path)
// }

// GetPublicArticleCount 获取数据库中公开文章的数据
func GetPublicArticleCount(w http.ResponseWriter, r *http.Request) {

}
