package models

type User struct {
	Id string `json:"id"`
	Name string `json:"name"`
	UserName string `json:"user_name"`
	Email string `json:"email"`
}