
# Master class for pieces
class Piece
  attr_accessor :MOVES
  attr_reader :colour

  def initialize(colour)
    @colour = colour
  end
end

# possibly  add a player class to relate with Pieces
