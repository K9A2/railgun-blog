package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()

	articleHandler := ArticleHandler{}
	articleHandler.RegisterHandleFunc(router.NewRoute().Subrouter())

	log.Fatal(http.ListenAndServeTLS(":443", "domain.crt", "domain.key", router))
}
