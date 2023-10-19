require_relative '../piece'

# King class for pieces
class King < Piece
  attr_accessor :moves
  attr_reader :colour
  
  # dimensions for allowable moves
  MOVES = [[-1, -1], [-1, 0], [-1, 1], [0, -1],
           [0, 0], [0, 1], [1, -1], [1, 0]].freeze

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteKing < King
  def initialize
    super('white')
  end
end

class BlackKing < King
  def initialize
    super('black')
  end
end
