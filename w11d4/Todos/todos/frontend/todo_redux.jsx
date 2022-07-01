import React from "react"
import Root from "./components/root"
import configureStore from './store/store'
import ReactDOM from "react-dom"
import {fetchAllTodos, createTodo} from './util/todo_api_utils.js'
import { fetchTodos } from './actions/todos_actions'

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("root")
  const store = configureStore();
  window.fetchAllTodos = fetchAllTodos
  window.createTodo = createTodo
  window.fetchTodos = fetchTodos
  window.store = store;
  ReactDOM.render( <Root store={store} /> , root)
})

