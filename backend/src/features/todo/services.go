package todo

import (
	. "DartSharingClientCode/backend/src/models"
)

var todos = []Todo{
	{Id: "1", Name: "Cong viec 1", Description: "Can hoan thanh gap"},
	{Id: "2", Name: "Cong viec 2", Description: "Can hoan thanh gap"},
	{Id: "3", Name: "Cong viec 3", Description: "Can hoan thanh gap"},
}

func GetTodos() []Todo {
	return todos
}

func GetTodo(id string) *Todo {
	data := GetTodos()
	lengthData := len(data)
	for i := 0; i < lengthData; i++ {
		todo := data[i]
		if todo.Id == id {
			return &todo
		}
	}
	return nil
}
