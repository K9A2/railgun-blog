package main

import (
  "testing"
)

func TestGetMD5HashInHexString(t *testing.T) {
  source := "stormlin"
  target := "60167c97d4da3448a5a862ba1dad5aea"
  if GetMD5HashInHexString(source) != target {
    t.Error("get wrong hash in hex form")
  } else {
    t.Log("hash test passed")
  }
}
