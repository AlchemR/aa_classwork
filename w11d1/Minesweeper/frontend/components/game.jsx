import React from 'react'
import Board from './board.jsx'
import * as Minesweeper from "../../minesweeper"

window.addEventListener("DOMcontentLoaded", () => {
  const modal = document.getElementById("modal")
})

class Game extends React.Component {
constructor(props){
  super(props); // could be used?
  let board = new Minesweeper.Board(12, 12);
  this.state = { board }
  window.board = board
//   this.state =  { board: board} 
  this.updateGame = this.updateGame.bind(this)
  this.restartGame = this.restartGame.bind(this)
}

updateGame(tile, altKey){
  if (!altKey){
    tile.explore()
  } else{ 
    tile.toggleFlag()
  }
  this.setState({board: this.state.board})
}

restartGame(){
  console.log(this)
  let board = new Minesweeper.Board(12, 12);
  this.setState( {board: board} ) 
}


render(){
  
  let returnItem;
  let endgame;
  if (this.state.board.won() || this.state.board.lost()) { 
    if (this.state.board.won()) {endgame = "Winner"} else {endgame="Loser"}
    returnItem = (
       <div className='modal'>
      <p className='gameover' >Game Over {endgame} <button onClick={this.restartGame}>Restart?</button> </p>
      {/* <Board board={ this.state.board } updateGame={this.updateGame} />  */}
      </div>
      )
  } else {
   returnItem= ( <Board board={ this.state.board } updateGame={this.updateGame} /> )  
  }

  return returnItem;
}

}

export default Game; 