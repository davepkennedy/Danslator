from distutils.core import setup, Extension
setup (name='Danslator',
        version='1.0',
        ext_modules=[Extension('Danslator', ['danslator.cc',
            'driver.cpp',
            'lex.yy.cc',
            'parser.tab.cc'])],
        )
