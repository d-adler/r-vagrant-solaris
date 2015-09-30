cd ${HOME}/R-3.2.2
make distclean
tee config.site <<EOF
CC="cc -xc99"
CFLAGS="-O -xlibmieee"
F77=f95
FFLAGS=-O
CXX="CC -library=stlport4"
CXXFLAGS=-O
FC=f95
FCFLAGS=$FFLAGS
FCLIBS="-lfai -lfsu"
R_LD_LIBRARY_PATH="/usr/local/lib:/opt/csw/gcc4/lib:/opt/csw/lib"
EOF
./configure --prefix=/usr/R-sun32 CPPFLAGS="-I/opt/csw/include" LDFLAGS="-L/opt/csw/lib" 
make
sudo make install

