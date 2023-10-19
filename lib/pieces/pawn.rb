require_relative '../piece'

# Pawn class for pieces
class Pawn < Piece
  attr_reader :colour

  BLACK_MOVES = [[1,0], [2,0]].freeze # dimensions for allowable moves
  WHITE_MOVES = [[-1, 0], [-2, 0]].freeze

  def initialize(colour)
    super
    @has_moved = false
  end

  def moves
    if @colour == 'white'
      return WHITE_MOVES[0] if @has_moved == true
      WHITE_MOVES
    else
      return BLACK_MOVES[0] if @has_moved == true

      BLACK_MOVES
    end
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
