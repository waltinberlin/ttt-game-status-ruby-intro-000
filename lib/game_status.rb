# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    if (board[win_index_1]=="X" && board[win_index_2]=="X" && board[win_index_3]=="X") || board[win_index_1]=="O" && board[win_index_2]=="O" && board[win_index_3]=="O"
      return win_index_1, win_index_2, win_index_3
    end
  end
end

def full?(board)
  board.none? {|position| position==" "}
end

def draw?(board)
  if (full?(board) == true && won?(board) == false)
    true
  else
    false
  end
end

def over?(board)
  if (draw?(board)==true)
    puts "draw"
    true
  elsif won?(board) == true && full?(board) == true
    puts "won & full"
    true
  elsif (won?(board) == true && full?(board) == false)
    puts "won & not full"
    true
  else
    puts won?(board)
    puts full?(board)
    puts "else"
    false
  end
end
