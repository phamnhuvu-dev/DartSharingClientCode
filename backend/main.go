package main

import (
	"DartSharingClientCode/backend/src/features/user"
	"DartSharingClientCode/backend/src/features/todo"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	user.SetupRouter(r)
	todo.SetupRouter(r)
	r.Run("0.0.0.0:80")
}
