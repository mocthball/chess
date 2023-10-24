require_relative 'gameboard'
require_relative 'util/input'

# Holds player data, availble_moves
class Player
  include Input

  attr_accessor :available_moves
  attr_reader :pieces_onboard

  def initialize(gameboard, colour)
    @available_moves = nil
    @gameboard = gameboard
    @colour = colour
    @pieces_onboard = moves_for_current_turn
  end

  def moves_for_current_turn
    @pieces_onboard = @gameboard.gameboard.flatten.map do |square|
      square if square.piece&.colour == @colour
    end.compact
  end

  # requires pieces array from moves_for_current_turn allocated by colour
  def initialize_moves_for_turn
    @pieces_onboard = nil
    moves_for_current_turn
    @available_moves = @gameboard.allocate_moves(@pieces_onboard)
  end

  # Schematics for players turn from Game
  def move_players_piece
    initialize_moves_for_turn
    player_input = get_move(@available_moves)
    x, y = @available_moves[player_input]
    @gameboard.move_piece(x, y)
  end
end