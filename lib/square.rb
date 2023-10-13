# Sqaure class represents the squares on the chess board
class Square
  attr_accessor :piece, :available_moves

  def initialize(piece = nil)
    @piece = piece
    @available_moves = nil
  end
end