require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'square'
require_relative 'print_board'
require_relative 'notation'

# Gameboard class container object for pieces
class Gameboard
  attr_accessor :gameboard

  include PrintBoard
  include Notation
  def initialize
    @gameboard = create_game_board
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

  def print_gameboard
    display(@gameboard)
  end

  def self.valid?(movement)
    movement[0].between?(0, 7) && movement[1].between?(0, 7)
  end
  # I hate these functions, messyyyy!
  def allocate_moves(pieces)
    moves_hash = Hash.new { |hash, key| hash[key] = [] }
    pieces.each do |x|
      if x.piece.is_a?(Queen) || x.piece.is_a?(Bishop) || x.piece.is_a?(Rook)
        multi_moving_pieces(x, moves_hash)
      elsif x.piece.is_a?(Pawn)
        pawn_moving(x, moves_hash)
      else 
        single_moving_pieces(x, moves_hash)
      end
    end
    moves_hash
  end

  def single_moving_pieces(x, moves_hash)
    x.piece.moves.each do |move|
      j, k = x.index[0] + move[0], x.index[1] + move[1]
      if Gameboard.valid?([j, k])  #Covers King & Knight
        if !@gameboard[j][k].piece.nil? && @gameboard[j][k].piece.colour == x.piece.colour
          break
        else
          moves_hash[get_notation(x.piece, [j, k])] += [x.index, [j, k]]
        end
      end
    end
  end

  def pawn_moving(x, moves_hash)
    x.piece.moves.each do |move|  # Create moves if nothing is in front of Pawn
      j, k = x.index[0] + move[0], x.index[1] + move[1]
      if Gameboard.valid?([j, k]) && @gameboard[j][k].piece.nil?
        moves_hash[get_notation(x.piece, [j, k])] += [x.index, [j, k]]
      end
    end
    x.piece.capturing_pieces.each do |move|      #Check for opposing pieces to capture 
      j, k = x.index[0] + move[0], x.index[1] + move[1]
      if Gameboard.valid?([j, k]) 
        if !@gameboard[j][k].piece.nil? && @gameboard[j][k].piece.colour != x.piece.colour
          moves_hash[get_notation(x.piece, [j, k])] += [x.index, [j, k]]
        end
      end
    end
  end

  def multi_moving_pieces(x, moves_hash)
    x.piece.moves.each do |move|
      j, k = x.index[0] + move[0], x.index[1] + move[1]
      while Gameboard.valid?([j, k])
        if !@gameboard[j][k].piece.nil? && @gameboard[j][k].piece.colour == x.piece.colour
          break
        elsif !@gameboard[j][k].piece.nil? && @gameboard[j][k].piece.colour != x.piece.colour
          moves_hash[get_notation(x.piece, [j, k])] += [x.index, [j, k]]
          break
        end
        moves_hash[get_notation(x.piece, [j, k])] += [x.index, [j, k]]
        j, k = j + move[0], k + move[1]
      end
    end
  end
end
