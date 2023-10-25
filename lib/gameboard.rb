require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'square'
require_relative 'print_board'
require_relative 'util/notation'
require_relative 'util/movement'


# Project tasks required build out stalemate/check
# En Passant/ castling

# Gameboard class container object for pieces
class Gameboard
  attr_accessor :gameboard

  include PrintBoard
  include Notation

  def initialize
    @gameboard = create_game_board
    @movement = Movement.new(gameboard)
    display(@gameboard)
  end

  # Create gameboard placing Black White pieces and structuring Square class with indexes
  def create_game_board
    board = Array.new(8) { Array.new(8) }
    board.each_with_index do |row, row_index|
      row.each_with_index do |square, col_index|
        board[row_index][col_index] = Square.new([row_index, col_index])
        # Now, you can access row_index and col_index within this loop
      end
    end
    white_pieces(board)
    black_pieces(board)
    board
  end

  def white_pieces(board)
    board[6].map.with_index {|x, i| x.piece = WhitePawn.new }
    gamerow = [WhiteRook, WhiteKnight, WhiteBishop, WhiteQueen, WhiteKing, WhiteBishop, WhiteKnight, WhiteRook]
    gamerow.each.with_index do |piece, i|
      board[7][i].piece = piece.new
    end
  end

  def black_pieces(board)
    board[1].map.with_index {|x, i| x.piece = BlackPawn.new }
    gamerow = [BlackRook, BlackKnight, BlackBishop, BlackQueen, BlackKing, BlackBishop, BlackKnight, BlackRook]
    gamerow.each.with_index do |piece, i|
      board[0][i].piece = piece.new
    end
  end

  def move_piece(piece, x)
    @gameboard[x[0]][x[1]].piece = @gameboard[piece[0]][piece[1]].piece
    @gameboard[piece[0]][piece[1]].piece = nil
    @gameboard[x[0]][x[1]].piece.has_moved = true
    display(@gameboard)
  end

  def allocate_moves(pieces)
    @movement.move_creation(pieces)
  end

  def print_gameboard
    display(@gameboard)
  end

  def self.valid?(movement)
    movement[0].between?(0, 7) && movement[1].between?(0, 7)
  end
end
