# Cython + CPython

* CPython: Python reference implementation
    * Implemented in C
    * Extension: Really ugly
* Cython: Python to C source code compiler
    * Integrates with CPython implementation
    * Extensions: Slightly ugly

--

## CPython is slow

* 2+1 scope types for names:
    * Function local: indexed immutable array
    * Module: string-indexed mutable hashtable
    * Attributes: string-indexed mutable hashtable

--

## CPython is slow

* Local access is fast


    def local_name(name_index):
        return namespace[name_index]

* Anything else is not


    def nonlocal_name(name_str)
        return namespace[hash(name_str) % len(namespace)]

* Food for thought:


    os.path.abspath(os.path.splitext(gksol.compiled.__file__)[0] + '.c')

--

## CPython is slow

* Any object is mutable
* Anything is an object
* Any non-local name can be changed at any time


    import builtins
    my_types = builtins.float, builtins.int, builtins.bool
    
    def my_float(val):
        print(val)
        return random.choice(my_types)(val)
    
    my_types = my_types[:2]
    builtins.float = my_float

--

## CPython is slow

* Anything must be looked up at runtime
* No compile time optimisation
* Lookups are not trivial


    >>> bool.mro()
    [bool, int, object]

--

## CPython is slow

* Because it does stuff for you...
* ...that you sometimes do not need

--

## Enter Cython

* Statically compile Python code to C code
* Disallows some dynamic features
* Opt-out of many dynamic features
* `gcc`/`clang`/... to statically compile C code to plugin library

--

## Cython is not slow

* Use CPython at C level
* Short-circuit special methods, builtins, ...


    __Pyx_PyInt_From_int(((__pyx_v_self->_board[__pyx_t_4])[__pyx_v_row_index]))

--

## Cython is fast

* Create custom C-level builtins
    * Statically compiled structs + functions
    * Unboxed types, direct buffer access
 
* Short-circuit internal calls
    * Inline method calls
    * Inline member access

* Short-circuit external calls to custom builtins
