package main

import (
	"log"
	"net/http"
	"net/url"
	"testing"
)

func TestGetDefaultQuery(t *testing.T) {
	u, _ := url.Parse("https://example.org/?b=")
	r := http.Request{
		URL: u,
	}
	log.Println(GetDefaultQuery(&r, "b", "fuck-b"))
}
