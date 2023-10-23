require_relative '../piece'

# Queen class for pieces
class Queen < Piece
  attr_accessor :has_moved
  attr_reader :colour
  
  # dimensions for allowable moves
  MOVES = [[-1, -1], [-1, 0], [-1, 1], [0, -1],
           [1, 1], [0, 1], [1, -1], [1, 0]].freeze

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteQueen < Queen
  def initialize
    super('white')
  end
end

class BlackQueen < Queen
  def initialize
    super('black')
  end
end
