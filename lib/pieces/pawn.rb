require_relative '../piece'

# Pawn class for pieces
class Pawn < Piece
  attr_accessor :icon
  MOVES = [[1,0], [1,1]].freeze # dimensions for allowable moves

  def initialize(position, board, colour)
    super
    @has_moved = false
  end

  def moves
    MOVES
  end
end

class WhitePawn < Pawn
  def initialize(position, board)
    super(position, board, 'white')
    @icon = 'F'
  end
end

class BlackPawn < Pawn
  def initialize(position, board)
    super(position, board, 'black')
  end
end
