# Sqaure class represents the squares on the chess board
require_relative 'pieces/pawn'

class Square
  attr_accessor :piece, :available_moves, :index
  
  def initialize(index, piece = nil)
    @index = index
    @piece = piece
  end

  def available_moves_creation
    return nil if piece.nil?

    piece.MOVES
  end
end