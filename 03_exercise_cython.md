# Exercise 2

## Love & Hate & Cython

--

## Quicker, easier, more seductive

* Cython can compile most python
    * No decorators
    * No dynamic code generation
    * You get the idea...
* Cython can compile your existing class
    * Will use a hook in `gksol` for compiling
    * If you are interested: `import pyximport`

--

## Easy mode

* Copy your module to a new file
    * Extension must be `.pyx`
    * E.g. `gol/cyplain.pyx`
* Run it


    python3 -m gksol -g 1000 -e 10 -c 'gol.cyplain'

--

## There is another

* Best performance with static types and extensions types

        # extension type == custom builtin
        cdef class CythonGOL(object):
            # static types == fixed members
            cdef int ** _board
            cdef public int height
            cdef public int width

* You will love it <3

--

## Cython Class 101

    cdef class GOL(object):
        cdef object _board  # generic python type
        cdef public int height  # c int type
        cdef public int width

        def __init__(self, object board):
            # store board as self._board
            # expose self.height and self.width
            raise NotImplementedError

        cpdef advance(self):
            # python + c function
            raise NotImplementedError

        cdef _count_neighbours(self, const int h, const int w):
            # pure c function
            raise NotImplementedError

        def __getitem__(self, item):
            return [self._board[index][row_index] for row_index in range(self.width)]

* Please implement this

--

## Need to go faster

* Python type `List[List[int]]` is the limit
    * Bounds checking
    * Pointer indirection
    * Packed `int`
* So let's use `cdef int ** _board`
    * Nested array of C `int`
    * Just a bunch of memory

--

## The Good, The Bad, and Malloc

* `*` -> dynamic memory
* Must get it and manage it yourself
* You need `malloc` and `free` :)


    from cpython.mem cimport PyMem_Malloc as malloc
    from cpython.mem cimport PyMem_Free as free

* Please implement this :)
* Take this, you may need it


    self._board = <int**>malloc(self.height * sizeof(int*))

--

## Freedom

* Did you `free` your memory? :)


    from cpython.mem cimport PyMem_Free as free

* Probably need it twice


    cdef class GOL(object):
        ...
    
        cpdef advance(self):
            # create new board
            # release old board

        def __dealloc__(self):
            # free current board
