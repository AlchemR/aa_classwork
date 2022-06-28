import React from 'react'
import Tile from "./tile"

class Board extends React.Component {
constructor(props){
  super(props);
}

  render() {
    const board = this.props.board.grid;
    const update = this.props.updateGame
  

    const banana = board.map((row, rIdx) => (
    <div className='row' key={rIdx}>
    {row.map((tile, tIdx) => (
    <Tile tile={tile} update={update} key={tIdx} />
    // console.log(tile, tIdx)
    ))}
    </div>
    ));

    return (<div className="banana-grid">{banana}</div> ) // have to render the tile

  }
 
}

export default Board;