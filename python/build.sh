PYTHON_INCLUDE="-I/usr/include/python3.3m"

rm -rf build
mkdir build && cd build

cp ../../example.{c,h} .

swig -python example.h

gcc -fpic -c example_wrap.c example.c $PYTHON_INCLUDE
ld -G example.o example_wrap.o -o _example.so 


touch __init__.py
