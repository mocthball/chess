# Print board functions using the class from object in gameboard
module PrintBoard
  PIECE_ICONS = {
    WhitePawn => ' ♙ ',
    WhiteRook => ' ♖ ',
    WhiteKnight => ' ♘ ',
    WhiteBishop => ' ♗ ',
    WhiteQueen => ' ♕ ',
    WhiteKing => ' ♔ ',
    BlackPawn => ' ♟ ',
    BlackRook => ' ♜ ',
    BlackKnight => ' ♞ ',
    BlackBishop => ' ♝ ',
    BlackQueen => ' ♛ ',
    BlackKing => ' ♚ ',
    Square => '   ',
    nil => '   ',
    # Add mappings for other piece classes if needed
  }.freeze

  # Takes the piece element from the sqaure class and refers to it's class when providing piece image
  def get_icon(square)
    return PIECE_ICONS[nil] if square.nil?

    PIECE_ICONS[square.class]
  end

  # refers to the gamebaord piece element in order to arrange icons
  def display(gameboard)
    puts <<-HEREDOC
              A   B   C   D   E   F   G   H
          8 \e[30m\e[47m#{get_icon(gameboard[0][0].piece)} \e[45m#{get_icon(gameboard[0][1].piece)} \e[47m#{get_icon(gameboard[0][2].piece)} \e[45m#{get_icon(gameboard[0][3].piece)} \e[47m#{get_icon(gameboard[0][4].piece)} \e[45m#{get_icon(gameboard[0][5].piece)} \e[47m#{get_icon(gameboard[0][6].piece)} \e[45m#{get_icon(gameboard[0][7].piece)} \e[0m 8
          7 \e[30m\e[45m#{get_icon(gameboard[1][0].piece)} \e[47m#{get_icon(gameboard[1][1].piece)} \e[45m#{get_icon(gameboard[1][2].piece)} \e[47m#{get_icon(gameboard[1][3].piece)} \e[45m#{get_icon(gameboard[1][4].piece)} \e[47m#{get_icon(gameboard[1][5].piece)} \e[45m#{get_icon(gameboard[1][6].piece)} \e[47m#{get_icon(gameboard[1][7].piece)} \e[0m 7
          6 \e[30m\e[47m#{get_icon(gameboard[2][0].piece)} \e[45m#{get_icon(gameboard[2][1].piece)} \e[47m#{get_icon(gameboard[2][2].piece)} \e[45m#{get_icon(gameboard[2][3].piece)} \e[47m#{get_icon(gameboard[2][4].piece)} \e[45m#{get_icon(gameboard[2][5].piece)} \e[47m#{get_icon(gameboard[2][6].piece)} \e[45m#{get_icon(gameboard[2][7].piece)} \e[0m 6
          5 \e[30m\e[45m#{get_icon(gameboard[3][0].piece)} \e[47m#{get_icon(gameboard[3][1].piece)} \e[45m#{get_icon(gameboard[3][2].piece)} \e[47m#{get_icon(gameboard[3][3].piece)} \e[45m#{get_icon(gameboard[3][4].piece)} \e[47m#{get_icon(gameboard[3][5].piece)} \e[45m#{get_icon(gameboard[3][6].piece)} \e[47m#{get_icon(gameboard[3][7].piece)} \e[0m 5
          4 \e[30m\e[47m#{get_icon(gameboard[4][0].piece)} \e[45m#{get_icon(gameboard[4][1].piece)} \e[47m#{get_icon(gameboard[4][2].piece)} \e[45m#{get_icon(gameboard[4][3].piece)} \e[47m#{get_icon(gameboard[4][4].piece)} \e[45m#{get_icon(gameboard[4][5].piece)} \e[47m#{get_icon(gameboard[4][6].piece)} \e[45m#{get_icon(gameboard[4][7].piece)} \e[0m 4
          3 \e[30m\e[45m#{get_icon(gameboard[5][0].piece)} \e[47m#{get_icon(gameboard[5][1].piece)} \e[45m#{get_icon(gameboard[5][2].piece)} \e[47m#{get_icon(gameboard[5][3].piece)} \e[45m#{get_icon(gameboard[5][4].piece)} \e[47m#{get_icon(gameboard[5][5].piece)} \e[45m#{get_icon(gameboard[5][6].piece)} \e[47m#{get_icon(gameboard[5][7].piece)} \e[0m 3
          2 \e[30m\e[47m#{get_icon(gameboard[6][0].piece)} \e[45m#{get_icon(gameboard[6][1].piece)} \e[47m#{get_icon(gameboard[6][2].piece)} \e[45m#{get_icon(gameboard[6][3].piece)} \e[47m#{get_icon(gameboard[6][4].piece)} \e[45m#{get_icon(gameboard[6][5].piece)} \e[47m#{get_icon(gameboard[6][6].piece)} \e[45m#{get_icon(gameboard[6][7].piece)} \e[0m 2
          1 \e[30m\e[45m#{get_icon(gameboard[7][0].piece)} \e[47m#{get_icon(gameboard[7][1].piece)} \e[45m#{get_icon(gameboard[7][2].piece)} \e[47m#{get_icon(gameboard[7][3].piece)} \e[45m#{get_icon(gameboard[7][4].piece)} \e[47m#{get_icon(gameboard[7][5].piece)} \e[45m#{get_icon(gameboard[7][6].piece)} \e[47m#{get_icon(gameboard[7][7].piece)} \e[0m 1
              A   B   C   D   E   F   G   H
    HEREDOC
  end
end
