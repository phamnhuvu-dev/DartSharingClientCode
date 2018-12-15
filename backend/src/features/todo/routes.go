package todo

import "github.com/gin-gonic/gin"

func SetupRouter(r *gin.Engine) {
	auth := r.Group("todo")
	{
		auth.POST("", GetAll)
		auth.POST(":id", GetById)
	}
}
