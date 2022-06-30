import React from "react";




class TodoForm extends React.Component {
constructor(props){
  super(props);
  console.log('todoformprops', props)
  this.state = {
    id: Math.floor(Math.random() * 10000000000),
    title: '',
    body: '',
    done: false
  }
  this.budderClick = this.budderClick.bind(this),
  this.updateTitle = this.updateTitle.bind(this),
  this.updateBody = this.updateBody.bind(this)
}

budderClick(e){
  e.preventDefault();
  console.log("here", this)
  this.props.receiveTodo(this.state)  
  this.setState({
    id: Math.floor(Math.random() * 10000000000),
    title: '',
    body: ''
    })
}

updateTitle(e){
  this.setState({title: e.target.value})
}

updateBody(e){
this.setState({body: e.target.value})
}


render(){

return(
<form onSubmit={this.budderClick}>
<h1>Enter a New ToDo here</h1>
<label > Title:
  <input type="text" value={this.state.title} onChange={this.updateTitle}/>
</label>
<label > Body:
      <input type="text" value={this.state.body} onChange={this.updateBody}/>
</label>

<input type="submit" value="Create ToDo item"/>
</form>


)}

}

export default TodoForm;