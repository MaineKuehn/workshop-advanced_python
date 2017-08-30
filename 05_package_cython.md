# Exercise II

## Pack it like a `b'x\x9c\x0b\xc8\xcfI,\xca\xcfLQ\x08\xc8L.-)J\x05\x004/\x067'`

--

## It depends

* There is more to `setup.py`
    * define and install dependencies
    * define and install extension types
* Allows for just `python setup.py install`
* Easy deployment for you and others

--

## Gimme

* Dependencies:

        setup(
            ...
            install_requires=['cython'],

* Extend setup capabilities

        import Cython.Distutils
        
        setup(
            ...
            cmdclass={'build_ext': Cython.Distutils.build_ext},

* Register extension types

        setup(
            ...
            ext_modules=[
                Extension(name='gol.compiled', sources=['gol/compiled.pyx'])
            ]

--

## Test it

* Run `python3 setup.py test`
    * Preparse entire module for testing
    * Also tells you if your build fails
* Add unittest for Cython class
