function Piece(color) {
  this.color = color;
}

Piece.prototype.flip = function () {
  return (this.color === "black") ? "white" : "black";
};

exports.Piece = Piece;
