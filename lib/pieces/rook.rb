require_relative '../piece'

# Rook class for pieces
class Rook < Piece

  attr_accessor :has_moved
  attr_reader :colour
  

  MOVES = [[1,0], [-1,0], [0,1], [0,-1]].freeze # dimensions for allowable moves

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhiteRook < Rook
  def initialize
    super('white')
  end
end

class BlackRook < Rook
  def initialize
    super('black')
  end
end
