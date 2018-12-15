package db

import (
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)


func ConnectDB() {
	_, err := gorm.Open("postgres", "host=db port=5432 user=test dbname=test password=passwordtest")
	if err != nil {
		fmt.Println("DB Fail: ", err)
	} else {
		fmt.Println("DB Success")
	}
}
