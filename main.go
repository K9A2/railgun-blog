package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()
	router.PathPrefix("/api")

	articleMetadataHandler := ArticleMetadataHandler{}
	router.Handle("/metadata", &articleMetadataHandler)

	http.Handle("/", router)
	log.Fatal(http.ListenAndServeTLS(":443", "domain.crt", "domain.key", nil))
}
