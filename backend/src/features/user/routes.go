package user

import "github.com/gin-gonic/gin"

func SetupRouter(r *gin.Engine) {
	user := r.Group("user")
	{
		user.POST("login", Login)
		user.POST("register", Register)
	}
}
