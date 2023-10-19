module Notation
  LETTERS = ('a'..'h').to_a.freeze
  NUMBERS = ('1'..'8').to_a.reverse.freeze
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

  def get_notation(piece, index)
    return CLASSES[piece.class].to_s + LETTERS[index[0]].to_s + index[1].to_s if piece.class != 'BlackPawn' || 'WhitePawn'

    LETTERS[index[0]] + index[1].to_s
  end
end