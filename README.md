# N Queens

## Description

The eight queens puzzle entails placing eight queens on an 8x8 chessboard such that none threatens another. The solution is trivially modified to an arbitrary number _N_ of queens on an _N_ x _N_ chessboard. See [Wikipedia](https://en.wikipedia.org/wiki/Eight_queens_puzzle) for more information.

This puzzle was one of the first programming problems to capture my imagination. Solutions exist publicly employing several different algorithms; Dijkstra used the problem to demonstrate structured programming with a depth-first backtracking algorithm in 1972.

I've created a computationally ineffecient but conceptually interesting solution based on a fun math trick: for an _N_ x _N_ chessboard, every [combination](https://en.wikipedia.org/wiki/Combination) of whole numbers 1 through _N_ represents a set of safe placements along an edge of the board.

For example:

* 4 x 4 chessboard
* _combination a:_ `[1,2,3,4]`
* _column 1: row 1, column 2: row 2, column 3: row 3, column 4: row 4_
```
======
|Q---|
|-Q--|
|--Q-|
|---Q|
======
```

By using [permutations](https://en.wikipedia.org/wiki/Permutation) instead of combinations, we impose the additional constraint of unique order of elements, eliminating the possibility of duplicate solutions.

These methods do not eliminate diagonal threats like those depicted in the example above. Diagonal threats are characterized by the following condition:

`(row(queen1) - row(queen2)).abs == (col(queen1) - col(queen2)).abs` 

* 4 x 4 chessboard
* _combination b:_ `[3,1,4,2]`
* _column 1: row 3, column 2: row 1, column 3: row 4, column 4, row 2_
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
