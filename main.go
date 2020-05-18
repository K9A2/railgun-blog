package main

import "log"

func main() {
	router := GetRouter()
	setupRouter(router)
	// router.Use(static.Serve("/", static.LocalFile("./view/build", true)))
	log.Fatal(router.RunTLS(":443", "domain.crt", "domain.key"))
}
