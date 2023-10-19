require_relative 'gameboard'

#Holds player data, availble_moves
class Player

  attr_accessor :available_moves

  def initialize(gameboard, colour)
    @available_moves = nil
    @gameboard = gameboard
    @colour = colour
    @pieces_onboard = return_pieces
  end

  def return_pieces
    @pieces_onboard = @gameboard.gameboard.flatten.map do |square|
      square if square.piece&.colour == @colour
    end.compact
  end

  # requires pieces array from return_pieces allocated by colour
  def initialize_moves_for_turn
    return_pieces
    @available_moves = @gameboard.allocate_moves(@pieces_onboard)
  end

  # Player input already approved as it matched availble moves and is found with a key
  def move_players_piece(player_input)
    x, y = @available_moves[player_input]
    @gameboard.move_piece(x, y)
  end
end

h = Player.new(Gameboard.new, 'black')
h.initialize_moves_for_turn
puts h.available_moves
h.move_players_piece("Na6")