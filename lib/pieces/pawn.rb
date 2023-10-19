require_relative '../piece'

# Pawn class for pieces
class Pawn < Piece
  attr_reader :colour

  MOVES = [[1,0], [2,0]].freeze # dimensions for allowable moves

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    return MOVES[0] if @has_moved == true

    MOVES
  end
end

class WhitePawn < Pawn
  def initialize
    super('white')
  end
end

class BlackPawn < Pawn
  def initialize
    super('black')
  end
end
