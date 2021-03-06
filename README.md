# N Queens

## Description

The [eight queens puzzle](https://en.wikipedia.org/wiki/Eight_queens_puzzle) entails placing eight queens on an 8x8 chessboard such that none threatens another. The solution is trivially modified to an arbitrary number _N_ of queens on an _N_ x _N_ chessboard. This puzzle was one of the first programming problems to capture my imagination. Solutions exist publicly employing several different algorithms; Dijkstra used the problem to demonstrate structured programming with a depth-first backtracking algorithm in 1972.

I've created a computationally ineffecient but conceptually interesting solution based on a fun math trick: for an _N_ x _N_ chessboard, every [combination](https://en.wikipedia.org/wiki/Combination) of whole numbers 1 through _N_ represents a set of safe placements along an edge of the board. By using [permutations](https://en.wikipedia.org/wiki/Permutation) instead of combinations, we impose the additional constraint of unique order of elements, eliminating the possibility of duplicate solutions.

These methods do not eliminate diagonal threats like those depicted in the first example below. Diagonal threats are characterized by the following condition:

`(row(queen1) - row(queen2)).abs == (col(queen1) - col(queen2)).abs`

So the complete set of solutions for a board of size _N_ x _N_ consists of all _N_-permutation-based placements for which no pair of queens exhibits the diagonal threat condition above.

## Examples

**Example 1**
```
======
|QQ--|
|QQ--|
|----|
|----|
======
```
_A placement which does not satisfy row, column, or diagonal safety requirements_

**Example 2**
```
======
|Q---|
|-Q--|
|--Q-|
|---Q|
======
```
_A placement which satisfies row and column safety but not diagonal safety requirements_

**Example 3**
```
======
|-Q--|
|---Q|
|Q---|
|--Q-|
======
```
_A placement which represents a valid solution to the puzzle_

## Usage

To run the program, execute the main script:

  `$ ./n_queens.rb`

The programmer can modify the size of the board using the `@board_size` variable declared in this script.

Toggle verbose output using the `@verbose` variable.
