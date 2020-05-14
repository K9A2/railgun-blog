package main

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"
)

type ArticleMetadataHandler struct {
}

func (handler *ArticleMetadataHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	log.Printf("request path: %s, query: %v", r.URL.Path, r.URL.Query())
	offset := DefaultOffset
	limit := DefaultLimit
	var err error
	queries := r.URL.Query()
	if len(queries) != 0 {
		if queries["offset"] == nil || queries["limit"] == nil {
			log.Printf("error query parameters")
		}
		if offset, err = strconv.Atoi(queries["offset"][0]); err != nil {
			log.Printf("error in parsing offset: %v", err)
			return
		}
		if limit, err = strconv.Atoi(queries["limit"][0]); err != nil {
			log.Printf("error in parsing limit: %v", err)
		}
	}
	log.Printf("query article metadata with parameter: offset = %d, limit = %d\n", offset, limit)
	metadataList := GetDBClient().GetArticleMetadataByPage(offset, limit)
	json.NewEncoder(w).Encode(metadataList)
}
