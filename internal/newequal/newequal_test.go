package newequal

import (
	"errors"
	"testing"
)

func TestNewEqual2(t *testing.T) {
	if errors.New("abc") == errors.New("abc") {
		t.Errorf(`New("abc") == New("abc")`)
	}
}

func TestNewEqual(t *testing.T) {
	type args struct {
		a bool
	}
	tests := []struct {
		name string
		args args
	}{
		{"TestNewEqual", args{true}},
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			NewEqual(tt.args.a)
		})
	}
}
