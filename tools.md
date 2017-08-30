# Toolbox

* This is *not* a notebook course.

* You will work with raw python.

* Do this course on your machine if possible!

--

## Python3.5+

* deterministic object finalisation, improved GIL performance

* `bytes` + `unicode`, `view` + `iter`, `future` + `async` + `multiprocessing`, ...

* not 7 years old

--

## Cython

* Python to C compiler
    * not a C compiler
    * not a Python interpreter

* Allows to opt-out of dynamic runtime features
    * No indirection to function/method/data access
    * Compile-time optimisations

* Manual optimisation

--

## PyPy 3.5

* Python interpreter with JIT compiler
    * not a static compiler
    * not fully compatible with all C extension

* Allows to opt-out of dynamic runtime features
    * Magic (j/k)
    * Runtime optimization
    
* Automatic optimization

--

## Python IDE of your Choice

* Type hints/inference, code completion, formatting, consistency tests 

* Seriously, use one!
    * No excuse for errors an IDE would warn you about

* Can still use an interpreter in addition 
    * Like, say, ``ipython``
