require_relative '../piece'

# King class for pieces
class King < Piece
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

class WhiteKing < King
  def initialize(position, board)
    super(position, board, 'white')
  end
end

class BlackKing < King
  def initialize(position, board)
    super(position, board, 'black')
  end
end
