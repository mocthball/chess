module Notation
  LETTERS = ('a'..'h').to_a.freeze
  NUMBERS = ('8'..'1').to_a.reverse.freeze
  CLASSES = {
    WhitePawn => '',
    WhiteRook => 'R',
    WhiteKnight=> 'N',
    WhiteBishop=> 'B',
    WhiteQueen=> 'Q',
    WhiteKing=> 'K',
    BlackPawn=> '',
    BlackRook=> 'R',
    BlackKnight=> 'N',
    BlackBishop=> 'B',
    BlackQueen=> 'Q',
    BlackKing=> 'K'
  }.freeze

  # Takes an item of the piece class along with board index from Gameboard, provides notation by using piece.class and
  # converting the board coordinates in to chess notation by retrieving the coloumn letters and minusing by 8 for
  # row index
  def get_notation(piece, index)
    if piece.class != BlackPawn && piece.class != WhitePawn
      return CLASSES[piece.class].to_s + LETTERS[index[1]].to_s + (8 - index[0]).to_s
    else
      return LETTERS[index[1]] + (8 - index[0]).to_s
    end
  end

end
