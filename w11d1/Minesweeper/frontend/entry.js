import Game from "./components/game"
import ReactDOM from "react-dom"
import React from "react"


console.log("hello world");

// react will go here

document.addEventListener("DOMContentLoaded", () => {
const root = document.getElementById("root")

ReactDOM.render(<Game/>, root )
})