#!/usr/bin/env python
import os
import sys
import platform
from setuptools import setup, find_packages

repo_base_dir = os.path.abspath(os.path.dirname(__file__))
# pull in the packages metadata
package_about = {}
with open(os.path.join(repo_base_dir, "gksol", "__about__.py")) as about_file:
    exec(about_file.read(), package_about)

with open(os.path.join(repo_base_dir, 'README.rst'), 'r') as README:
    long_description = README.read()

cmdclass = {}
extensions = []

# CPython/PyPy
dependencies = ['cpy2py']
if platform.python_implementation() == 'CPython':
    dependencies.append('cython')
    dependencies.append('matplotlib')
    import Cython.Distutils
    from distutils.extension import Extension
    for file_path in (os.path.join('gksol', 'compiled.pyx'),):
        module_path = os.path.splitext(file_path)[0].replace(os.sep, '.')
        for compiled_file in (os.path.splitext(file_path)[0] + ext for ext in ('.so', '.c')):
            if os.path.isfile(compiled_file):
                os.unlink(compiled_file)
        extensions.append(Extension(name=module_path, sources=[file_path]))
    if extensions:
        cmdclass = {'build_ext': Cython.Distutils.build_ext}


if __name__ == '__main__':
    setup(
        name=package_about['__title__'],
        version=package_about['__version__'],
        description=package_about['__summary__'],
        long_description=long_description.strip(),
        author=package_about['__author__'],
        author_email=package_about['__email__'],
        url=package_about['__url__'],
        packages=find_packages(),
        ext_modules=extensions,
        cmdclass=cmdclass,
        # dependencies
        install_requires=dependencies,
        # metadata for package search
        license='MIT',
        # https://pypi.python.org/pypi?%3Aaction=list_classifiers
        classifiers=[
            'Development Status :: 4 - Beta',
            'License :: OSI Approved :: MIT License',
            'Intended Audience :: Education',
            'Topic :: Education',
            'Programming Language :: Python :: 3 :: Only',
            'Programming Language :: Python :: 3.5',
            'Programming Language :: Python :: 3.6',
            'Programming Language :: Python :: Implementation :: CPython',
            'Programming Language :: Python :: Implementation :: PyPy'
        ],
        keywords=package_about['__keywords__'],
        # unit tests
        test_suite='gksol.gksol_unittests',
    )
