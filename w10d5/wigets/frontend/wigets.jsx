
import ReactDOM from "react-dom";
import React from "react";
import Clock from "./clock";
import Tabs from "./tabs"

document.addEventListener("DOMContentLoaded", ()=> {
  const root = document.getElementById("root")
  // ReactDOM.render(<Clock  />, root);
  ReactDOM.render(<Tabs arr={[{ title: "one", content: "I'm the first" }, { title: "two", content: "Second pane here" }, { title: "three", content:"third pane here" }]} />, root);

  //ask question how to merge the two together


})

