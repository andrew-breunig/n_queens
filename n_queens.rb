#!/usr/bin/env ruby

require_relative('lib/board')
require_relative('lib/queen')

def solve_queens_problem
  @board_array = (0..@board.rows-1).to_a

  @permutations = @board_array.permutation.to_a

  @permutations.each do |perm|
    place_queen_in_column(perm, 0)
    @board.clear
  end
end

def place_queen_in_column(perm, column)
  puts "\nTrying Queen ##{column+1}" if @verbose

  row = perm[column]

  if @board.safe_position?(column, row)
    puts "+ Placing Queen ##{column+1} at #{column}, #{row}" if @verbose
    @board.place_queen(column, row)
    @board.display if @verbose
    
    if column == @board.ending_column
      puts "! Solution Found\n" if @verbose
      
      add_board_to_solutions(@board)
    else
      place_queen_in_column(perm, column+1)
    end
  else
    puts "x Conflict at #{column}, #{row}, trying next permutation..." if @verbose
  end
end

def add_board_to_solutions(board)
  # Store a copy of the board and the queens on it
  solution_board = Board.new(size: @board_size)
  solution_board.queens = board.queens.map(&:dup)
  @solution_boards << solution_board
end

@verbose = false
@board_size = 4

@solution_boards = []
@board = Board.new(size: @board_size)

#  4:      2 solutions
#  5:     10 solutions
#  6:      4 solutions
#  7:     40 solutions
#  8:     92 solutions
#  9:    352 solutions
# 10:    724 solutions
# 11:  2,680 solutions
# 12: 14,200 solutions (takes a long time...)

solve_queens_problem

if !@solution_boards.empty?
  @solution_boards.each_with_index do |solution_board, i|
    puts "\nSolution board #{i+1}:"
    solution_board.display
  end
else
  puts "No solutions found"
end
