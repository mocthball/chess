require_relative '../piece'

# Master class for pieces
class Bishop < Piece

  MOVES = [[-1,-1], [1,1], [-1,1], [1,-1]] # dimensions for allowable moves

  def initialize(position, board, colour)
    super
    # assess if needed
  end

  def moves
    MOVES
  end
end

class WhiteBishop < Bishop
  def initialize(position, board)
    super(position, board, 'white')
  end
end

class BlackBishop < Bishop
  def initialize(position, board)
    super(position, board, 'black')
  end
end
