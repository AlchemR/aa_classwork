import React from "react";

class Tile extends React.Component {
    constructor(props) {
        super(props);
      this.handleClick = this.handleClick.bind(this);
    }

  handleClick(e){
    // console.log("console logging click")
    // console.log(this)
    // window.clickedTile = this
    // console.log(this.props)
    // console.log(e)
    // console.log(e.altKey)
    this.props.update(this.props.tile, e.altKey)
    }

    render() {
      let tileClass;
      //border note to 
      let tileText;      
      if (this.props.tile.bombed && this.props.tile.explored) {
        tileClass="tile bombed";
        tileText="\u{1F4A3}"
      } else if (this.props.tile.flagged) {
        tileClass="tile flagged"
        tileText="\u{2691}"
      } else if (this.props.tile.explored) {
        tileClass="tile explored"
        // tileText=' '
        if (this.props.tile.adjacentBombCount() > 0) {tileText=`${this.props.tile.adjacentBombCount()}`} else {tileText=" "}
      } else {
        tileClass="tile unexplored";

        tileText = ""
      }
    
      return (<div className={tileClass} onClick={this.handleClick} >{tileText}</div>);
    }
}

export default Tile;