class Knight
  attr_accessor :position, :possible_moves, :children

  def initialize(position)
    @position = position
    @possible_moves = create_move_list(position)
    @children = []
  end

  def create_move_list(position, move_list = [])
    moves = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]

    moves.each do |move|
      x = position[0] + move[0]
      y = position[1] + move[1]

      move_list << [x, y] if x.between?(0,7) && y.between?(0,7)
    end
    move_list
  end

end