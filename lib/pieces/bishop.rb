require_relative '../piece'

# Master class for pieces
class Bishop < Piece
  attr_accessor :has_moved
  attr_reader :colour

  MOVES = [[-1,-1], [1,1], [-1,1], [1,-1]] # dimensions for allowable moves

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteBishop < Bishop
  def initialize
    super('white')
  end
end

class BlackBishop < Bishop
  def initialize
    super('black')
  end
end
