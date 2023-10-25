require_relative 'notation'

# movement module
class Movement
  include Notation

  def initialize(board)
    @gameboard = board
  end

  def move_creation(pieces)
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

