require_relative '../piece'

# Queen class for pieces
class Queen < Piece
  # dimensions for allowable moves
  MOVES = [[-1, -1], [-1, 0], [-1, 1], [0, -1],
           [0, 0], [0, 1], [1, -1], [1, 0]].freeze

  def initialize(position, board, colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteQueen < Queen
  def initialize(position, board)
    super(position, board, 'white')
  end
end

class BlackQueen < Queen
  def initialize(position, board)
    super(position, board, 'black')
  end
end
