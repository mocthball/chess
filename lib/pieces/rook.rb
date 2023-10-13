require_relative '../piece'

# Rook class for pieces
class Rook < Piece

  MOVES = [[1,0], [-1,0], [0,1], [0,-1]].freeze # dimensions for allowable moves

  def initialize(position, board, colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteRook < Rook
  def initialize(position, board)
    super(position, board, 'white')
  end
end

class BlackRook < Rook
  def initialize(position, board)
    super(position, board, 'black')
  end
end
