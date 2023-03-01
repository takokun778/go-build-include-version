package main

import (
	"fmt"
	"log"
	"net/http"
)

var version string

func Version(w http.ResponseWriter, r *http.Request) {
	_, _ = w.Write([]byte(version))
	log.Println(r.URL.Path)
}

func main() {
	http.HandleFunc("/version", Version)
	fmt.Printf("Server Version: %s\n", version)
	log.Fatal(http.ListenAndServe("localhost:8080", nil))
}
