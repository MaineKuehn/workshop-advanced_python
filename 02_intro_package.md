# Interlude 1

## Pack it like a polaroid picture

--

## Recap

* You now have a modular script
    * Custom and external code
* Fulfills that one task [TM]
* Runs from start to end
    * Unless you hack it

--

## The next level

* Non-trivial code should be in a module or package
    * Just like `gksol`
    * Your code will soon be non-trivial :P
* Enables code-reuse and -sharing
* Uniform meta-data, dependencies, unittests, ...

--

## \_\_Main\_\_ Work

* Separate passive/library code and active/script code
* Split with `if __name__ == "__main__":`


    class GOL(object):
        ...
    
    if __name__ == "__main__":
        gol = GOL(PaddedBoard(read_literal(PENTOMINO)))
        ...

--

## Get Setup

* Package managed by `setup.py`
* Entry point to `install`, `test`, `upload`, ...
* Contains everything to *deploy* your package
* Provides everything to *require* your package
