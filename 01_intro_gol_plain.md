# Game Of Life

![GUN](Gospers_glider_gun.gif)

Johan G. Bonte / [CC-BY-SA-3.0](http://creativecommons.org/licenses/by-sa/3.0/)

--

## Your Mission

* Implement Game of Life
* Do it well
* If you are bored, do it even better

--

## The Board

* 2D playing field of *cells*
* Each cell is either dead or alive
* Neighbours preserve, kill or spawn alive cells


    ###     O cell
    #O#     # neighbour
    ###

--

## The Cells

* 2 Neighbours: Survive
* 3 Neighbours: Spawn or Survive
* ```or die```

--

## Now what?

    git clone https://github.com/MaineKuehn/workshop-advanced_python
    cd workshop-advanced_python
    python3 setup.py test
    python3 setup.py install
    python3 -m gksol -e 10 -g 500
