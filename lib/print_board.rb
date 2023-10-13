# Print board functions
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
      nil => '',
      # Add mappings for other piece classes if needed
    }

    def get_icon(square)
      PIECE_ICONS[square]
    end
   
    def display(gameboard)
      puts <<-HEREDOC
              A B C D E F G H
            8 \e[30m\e[47m#{get_icon(gameboard[0][7].class)} \e[45m#{get_icon(gameboard[1][7].class)} \e[47m#{get_icon(gameboard[2][7].class)} \e[45m#{get_icon(gameboard[3][7].class)} \e[47m#{get_icon(gameboard[4][7].class)} \e[45m#{get_icon(gameboard[5][7].class)} \e[47m#{get_icon(gameboard[6][7].class)} \e[45m#{get_icon(gameboard[7][7].class)} \e[0m 8
            7 \e[30m\e[45m#{get_icon(gameboard[0][6].class)} \e[47m#{get_icon(gameboard[1][6].class)} \e[45m#{get_icon(gameboard[2][6].class)} \e[47m#{get_icon(gameboard[3][6].class)} \e[45m#{get_icon(gameboard[4][6].class)} \e[47m#{get_icon(gameboard[5][6].class)} \e[45m#{get_icon(gameboard[6][6].class)} \e[47m#{get_icon(gameboard[7][6].class)} \e[0m 7
            6 \e[30m\e[47m#{get_icon(gameboard[0][5].class)} \e[45m#{get_icon(gameboard[1][5].class)} \e[47m#{get_icon(gameboard[2][5].class)} \e[45m#{get_icon(gameboard[3][5].class)} \e[47m#{get_icon(gameboard[4][5].class)} \e[45m#{get_icon(gameboard[5][5].class)} \e[47m#{get_icon(gameboard[6][5].class)} \e[45m#{get_icon(gameboard[7][5].class)} \e[0m 6
            5 \e[30m\e[45m#{get_icon(gameboard[0][4].class)} \e[47m#{get_icon(gameboard[1][4].class)} \e[45m#{get_icon(gameboard[2][4].class)} \e[47m#{get_icon(gameboard[3][4].class)} \e[45m#{get_icon(gameboard[4][4].class)} \e[47m#{get_icon(gameboard[5][4].class)} \e[45m#{get_icon(gameboard[6][4].class)} \e[47m#{get_icon(gameboard[7][4].class)} \e[0m 6
            4 \e[30m\e[47m#{get_icon(gameboard[0][3].class)} \e[45m#{get_icon(gameboard[1][3].class)} \e[47m#{get_icon(gameboard[2][3].class)} \e[45m#{get_icon(gameboard[3][3].class)} \e[47m#{get_icon(gameboard[4][3].class)} \e[45m#{get_icon(gameboard[5][3].class)} \e[47m#{get_icon(gameboard[6][3].class)} \e[45m#{get_icon(gameboard[7][3].class)} \e[0m 6
            3 \e[30m\e[45m#{get_icon(gameboard[0][2].class)} \e[47m#{get_icon(gameboard[1][2].class)} \e[45m#{get_icon(gameboard[2][2].class)} \e[47m#{get_icon(gameboard[3][2].class)} \e[45m#{get_icon(gameboard[4][2].class)} \e[47m#{get_icon(gameboard[5][2].class)} \e[45m#{get_icon(gameboard[6][2].class)} \e[47m#{get_icon(gameboard[7][2].class)} \e[0m 6
            2 \e[30m\e[47m#{get_icon(gameboard[0][1].class)} \e[45m#{get_icon(gameboard[1][1].class)} \e[47m#{get_icon(gameboard[2][1].class)} \e[45m#{get_icon(gameboard[3][1].class)} \e[47m#{get_icon(gameboard[4][1].class)} \e[45m#{get_icon(gameboard[5][1].class)} \e[47m#{get_icon(gameboard[6][1].class)} \e[45m#{get_icon(gameboard[7][1].class)} \e[0m 6
            1 \e[30m\e[45m#{get_icon(gameboard[0][0].class)} \e[47m#{get_icon(gameboard[1][0].class)} \e[45m#{get_icon(gameboard[2][0].class)} \e[47m#{get_icon(gameboard[3][0].class)} \e[45m#{get_icon(gameboard[4][0].class)} \e[47m#{get_icon(gameboard[5][0].class)} \e[45m#{get_icon(gameboard[6][0].class)} \e[47m#{get_icon(gameboard[7][0].class)} \e[0m 6
              A B C D E F G H
        HEREDOC
    end
end
