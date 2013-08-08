PERL_CFLAGS=$( perl -MConfig -e 'print join(" ", @Config{qw(ccflags optimize cccdlflags)}, "-I$Config{archlib}/CORE")')
PERL_LDFLAGS=$( perl -MConfig -e 'print $Config{lddlflags}')

rm -rf build
mkdir build && cd build

cp ../../example.{c,h} .

swig -perl5 example.h

gcc -fpic -c $PERL_CFLAGS example_wrap.c example.c
gcc $PERL_LDFLAGS example.o example_wrap.o -o example.so 
