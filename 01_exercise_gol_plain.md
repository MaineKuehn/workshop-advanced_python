# Exercise 1

## Gettin' Classy

--

## Checklist

* Goal: Write a script to load, advance and display a GOL board
* Use `gksol` package for loading and displaying
* Write a class to hold and advance the GOL board
* Warning: Do not re-use the `gksol` folder!

--

## First Steps

* Get patterns via `import gksol.patterns`
    * Try `print(gksol.patterns.PENTOMINO)`
* Feed it to `gksol.reader.read_literal`
    * `help(read_literal)`
    * Or your trusty IDE/ipython
* Pad it with `gksol.boards.PaddedBoard`
    * This is *not* a nested list anymore

--

## Add Class

    class GOL(object):
        def __init__(self, board):
            # store board as self._board
            # expose self.height and self.width
            raise NotImplementedError
        
        def advance(self):
            # create new board
            # for every cell
            #   if neighbours == 3 or cell_alive and neighbours == 2
            # swap boards
            raise NotImplementedError

        def __getitem__(self, item):
            return self._board[item]

--

## Finishing touches

* Get a `display = gksol.renderer.TextDisplay()`
* Load pattern, initialise class
* loop, `gol.advance`, `display.show(gol)`
