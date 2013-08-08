RUBY_INCLUDE="-I/usr/include/ruby-2.0.0 -I/usr/include/ruby-2.0.0/x86_64-linux"

rm -rf build
mkdir build && cd build

cp ../../example.{c,h} .

swig -ruby example.h

gcc -fpic -c example_wrap.c example.c $RUBY_INCLUDE
gcc -shared -lruby example.o example_wrap.o -o example.so 
