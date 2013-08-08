JDK_INCLUDE="-I/usr/lib/jvm/java-7-openjdk/include -I/usr/lib/jvm/java-7-openjdk/include/linux"

rm -rf build
mkdir build && cd build

cp ../../example.{c,h} ../main.java .

swig -java example.h

gcc -fpic -c example.c example_wrap.c $JDK_INCLUDE
ld -G example.o example_wrap.o -o libexample.so 
javac *.java


