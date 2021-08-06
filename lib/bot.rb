class Bot < Players
  def initialize(mark)
    @mark = mark
  end

  def turn
    if Game.board[4] == ' '
      Game.board[4] = mark
    elsif Game.board[0] == ' '
      Game.board[0] = mark
    elsif Game.board[2] == ' '
      Game.board[2] = mark
    elsif Game.board[6] == ' '
      Game.board[6] = mark
    elsif Game.board[8] == ' '
      Game.board[8] = mark
    elsif Game.board[1] == ' '
      Game.board[1] = mark
    elsif Game.board[3] == ' '
      Game.board[3] = mark
    elsif Game.board[5] == ' '
      Game.board[5] = mark
    elsif Game.board[7] == ' '
      Game.board[7] = mark
    end
  end
end
