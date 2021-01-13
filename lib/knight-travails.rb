require_relative 'knight'
require_relative 'gameboard'

game = GameBoard.new
game.knight_moves([0,0], [7,7])