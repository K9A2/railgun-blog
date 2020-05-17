package main

import (
	"github.com/gin-gonic/contrib/static"
)

func main() {
	router := GetRouter()
	// router.Use(cors.Default())
	router.Use(static.Serve("/", static.LocalFile("./view/build", true)))
	router.RunTLS(":443", "domain.crt", "domain.key")
	// log.Fatal(autotls.Run(router, "foo.com"))
}
