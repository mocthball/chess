require_relative 'gameboard'
require_relative 'player'

# includes Game schematics
class Game
  def initialize
    current_game = Gameboard.new
    @player1 = Player.new(current_game, 'white')
    @player2 = Player.new(current_game, 'black')
    @players_turn = @player1
    game_play
  end
  
  def game_play
    next_turn until game_over
  end

  def next_turn
    @players_turn.move_players_piece
    @players_turn == @player1 ? @players_turn = @player2 : @players_turn = @player1
  end

  def game_over
    if @player1.pieces_onboard.include?(WhiteKing)
      true
    elsif @player2.pieces_onboard.include?(BlackKing)
      true
    else
      false
    end
  end
end

letsgo = Game.new