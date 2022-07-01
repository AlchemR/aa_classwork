import React from 'react'
import ToDoItem from './todo_list_item'
import TodoForm from './todo_form'
// import TodoForm from './todo_form'

const toDoIndex = (props) =>{

  const todoList = props.todos.map((el) => { 
    return (<>
      <ToDoItem key={el.id} todo={el} removeToDo={props.removeToDo} receiveTodo={props.receiveTodo} />
    </>) 
  })

  // componentDidMount() {
    // this.props.fetchTodos();
  // }
  return(
    <>
      <ul>
          {todoList}
      </ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
      </>
  )}

export default toDoIndex;