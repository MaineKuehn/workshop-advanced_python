# Play Time

## Pun intended

--

* Try how fast your classes are


    python3 -m gksol -g 1000 -e 10 -c 'gol.<module name>'

* Compare against ours


    python3 -m gksol -g 1000 -e 10 -c 'gol.compiled'
    
* So many options


    python3 -m gksol -h

--

## python(python(python(...)))

* If you have it:


    pypy3 -m gksol -g 1000 -e 10 -c 'gol.plain'
    pypy3 -m gksol -g 1000 -e 10 -c 'gol.plain' -r MPLDisplay
    python3 -m gksol -g 1000 -e 10 -c 'gol.compiled' -r MPLDisplay

    pypy3 -m matplotlib
