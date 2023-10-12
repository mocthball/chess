require_relative '../piece'

# Master class for pieces
class Rook < Piece

  MOVES = [[1,0]]

  def initialize(position, board, colour)
    super
    @has_moved = false
  end
end

class WhiteRook < Rook
  def initialize(position, board)
    super(position, board, 'white')
  end
end

class BlackRook < Rook
  def initialize
    super(position, board, 'black')
  end
end
