require_relative '../piece'

# Knight class for pieces
class Knight < Piece
  # dimensions for allowable moves
  MOVES = [[1, 2], [-2, -1], [-1, 2], [2, -1],
           [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  def initialize(position, board, colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteKnight < Knight
  def initialize(position, board)
    super(position, board, 'white')
  end
end

class BlackKnight < Knight
  def initialize(position, board)
    super(position, board, 'black')
  end
end
