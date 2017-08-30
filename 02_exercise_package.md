# Exercise I

## Get to da Setapp

--

## Guardians of the Script

* Add a `__name__ == "__main__"` guard
* *After* passive code (functions, classes)
* *Before* active code
* Does execute with `./gol.py`
* Does not execute with `import gol`
    * Name your script `gol.py`

--

## Someone set us up the py

* Add file `setup.py` next to your script

        from setuptools import setup
        if __name__ == '__main__':
            setup(
                name='gol',
                version='0.1.0',
                author='<your name>',
                packages=find_packages(),
            )

* Test with `python3 setup.py build`
* Do *not* `install` while developing

--

## Unit -> Test

* Bundle unittests with your package
* Test fundamental building blocks for functionality
* Ensure *consistency* for deployment
    * Is code working after refactoring?
    * Is code working with new features?
    * Is code working with dependencies?
    * Is code working on this environment?

--

## Test -> Unit

* Template `gksol.gksol_unittests.test_mixins`
* Tests GOL interface if it works as expected
* Separate file `gol_unittests`


    from gksol.gksol_unittests import test_mixins
    import gol

    class TestListGOL(test_mixins.Mixin.GolMixin):
        gol_cls = gol.GOL

--

## Test setup

* Add unittests to `setup.py`

        test_suite='gol_unittests'

* Test it with `python3 setup.py test`

--

## Re-Package

* Switch from individual module to package
* Combines multiple modules in directories

        gol/
            __init__.py
            simple.py
        gol_unittests
        setup.py

* Test it again ;)

--

## Applied Modules

* The `gksol` library can now use your class
* Give it a try


    python3 -m gksol -e 10 -g 500 -c gol.simple
