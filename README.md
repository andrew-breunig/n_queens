TEST

# N Queens

## Description

The eight queens puzzle entails placing eight queens on an 8x8 chessboard such that none threatens another. The solution is trivially modified to an arbitrary number _N_ of queens on an _N_ x _N_ chessboard. See [Wikipedia](https://en.wikipedia.org/wiki/Eight_queens_puzzle) for more information.

This puzzle was one of the first programming problems to capture my imagination. Solutions exist publicly employing several different algorithms; Dijkstra used the problem to demonstrate structured programming with a depth-first backtracking algorithm in 1972.

The solution that inspired this program was written by @kevinskoglund for [lynda.com](https://www.lynda.com). The original solution used recursion and row-by-row trial and error to place queens; each placement was evaluated for safety by row, column, and diagonal.

I've refactored the solution to leverage a different method, based on a fun math trick: all combinations of the whole numbers up to and including the board's length will, by definition of combinations, possess all unique elements at unique indices. If we use these combinations to map columns to row placements, we eliminate the possibility of two queens in the same row or column.

For example:

* 4 x 4 chessboard
* _combination a:_ `[1,2,3,4]`
* _column 1: row 1, column 2: row 2, column 3: row 3, column 4: row 4_ 
* _mapped board:_
```
======
|Q---|
|-Q--|
|--Q-|
|---Q|
======
```

By using permutations instead of combinations, we impose the additional constraint of unique order of elements, and eliminate the possibility of duplicate solutions.

As apparent in the example above, this method will not rule out diagonal threats. A diagonal threat occurs when the absolute difference between the row placements of two queens equals the absolute difference between their column placements.

With that check in place, here's an example of an actual solution for the scenario above:

* 4 x 4 chessboard
* _combination b:_ `[3,1,4,2]`
* _column 1: row 3, column 2: row 1, column 3: row 4, column 4, row 2_
* _mapped board:_
```
======
|-Q--|
|---Q|
|Q---|
|--Q-|
======
```

## Usage

To run the program, execute the main script:

  `$ ./n_queens.rb`

The programmer can modify the size of the board using the `@board_size` variable declared in this script.

Toggle verbose output using the `@verbose` variable.

## Design

The program is separated into a main script, a `board` class, and a `queen` class. The main script computes permutations, controls recursion, and displays output. The board manages the safety checks, placement, and removal of queens. Queens manage their own location.
