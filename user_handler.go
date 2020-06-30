package rgblog

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetAuthorization(context *gin.Context) {
  username := context.PostForm("username")
  password := context.PostForm("password")
  if username == "" || password == "" {
    // 没有给出用户名或者密码
    context.JSON(http.StatusBadRequest, gin.H{})
    return
  }

  user := GetDBClient().GetUserByUsername(username)
  if user == nil {
    // 不存在该用户
    context.JSON(http.StatusUnauthorized, gin.H{})
    return
  }
  hashedPassword := GetMD5HashInHexString(password)
  log.Println("receive auth request by:", username, password, hashedPassword)
  if hashedPassword != user.Password {
    context.JSON(http.StatusUnauthorized, gin.H{})
    return
  }
  context.JSON(http.StatusOK, gin.H{})
}
