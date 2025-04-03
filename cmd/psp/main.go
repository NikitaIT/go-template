package main

import (
	"net/http"

	"main/internal/newequal"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		//nolint:errcheck
		w.Write([]byte("Hello World!3"))
	})
	err := http.ListenAndServe(":3000", r)
	if err != nil {
		panic(err)
	}
	newequal.NewEqual(true)
}
