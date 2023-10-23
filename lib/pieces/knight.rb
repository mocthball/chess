require_relative '../piece'

# Knight class for pieces
class Knight < Piece
  attr_accessor :has_moved
  attr_reader :colour
  
  # dimensions for allowable moves
  MOVES = [[1, 2], [-2, -1], [-1, 2], [2, -1],
           [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteKnight < Knight
  def initialize
    super('white')
  end
end

class BlackKnight < Knight
  def initialize
    super('black')
  end
end
