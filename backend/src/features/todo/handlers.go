package todo

import (
	"github.com/gin-gonic/gin"
)

func GetAll(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "todo",
		"data":    GetTodos(),
	})
}

func GetById(c *gin.Context) {
	id := c.Params.ByName("id")
	c.JSON(200, gin.H{
		"message": "todo",
		"data":    GetTodo(id),
	})
}
