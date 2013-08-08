rm -rf build
mkdir build && cd build

cp ../../example.{c,h} .

swig -r example.h
R CMD SHLIB example.c example_wrap.c
