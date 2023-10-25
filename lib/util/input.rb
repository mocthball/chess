# Module for all dialogue throught the game
module Input
  def get_move(moves_list)
    print 'Insert move: '
    guess = convert_string
    until moves_list.key?(guess) || moves_list.key?(guess.downcase)
      guess == 'Help' ? (p moves_list) : (puts 'incorrect move, try again insert help for moves list')
      print 'Insert move: '
      guess = convert_string
    end

    guess
  end

  def convert_string
    str = gets.chomp
    if str.length == 2
      str.downcase
    else
      str.downcase.capitalize
    end
  end

  def check
    print 'check'
  end
end
