package main

import (
	"log"

	rgblog "github.com/stormlin/railgun-blog"
)

func main() {
	router := rgblog.GetRouter()
	rgblog.SetupRouter(router)
	log.Fatal(router.Run(":8080"))
}
