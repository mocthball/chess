require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'square'
require_relative 'print_board'

# Gameboard class container object for pieces
class Gameboard
  attr_accessor :gameboard

  include PrintBoard

  def initialize
    @gameboard = gameboard
    display(@gameboard)
  end

  def gameboard
    board = Array.new(8) { Array.new(8) { Square.new } }
    white_pieces(board)
    black_pieces(board)
    board
  end

  def white_pieces(board)
    board[6].map!.with_index {|x, i| x.piece = WhitePawn.new([6, i], 'board')}
    gamerow = [WhiteRook, WhiteKnight, WhiteBishop, WhiteQueen, WhiteKing, WhiteBishop, WhiteKnight, WhiteRook]
    gamerow.each.with_index do |piece, i|
      board[7][i] = piece.new([7][i], 'board')
    end
  end

  def black_pieces(board)
    board[1].map!.with_index {|x, i| x.piece = BlackPawn.new([6, i], 'board')}
    gamerow = [BlackRook, BlackKnight, BlackBishop, BlackQueen, BlackKing, BlackBishop, BlackKnight, BlackRook]
    gamerow.each.with_index do |piece, i|
      board[0][i] = piece.new([7][i], 'board')
    end
  end
end

Gameboard.new