var runGame = function() {
	var Game = require("./game.js").Game;
	myGame = new Game();
  myGame.runLoop();
};

runGame();