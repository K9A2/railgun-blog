package main

import "log"

func main() {
	router := GetRouter()
	setupRouter(router)
	log.Fatal(router.Run(":8080"))
}
