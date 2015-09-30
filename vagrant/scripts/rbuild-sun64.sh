cd ${HOME}/R-3.2.2
make distclean
tee config.site <<EOF
CC="cc -xc99 -m64"
CFLAGS="-O -xlibmieee"
F77="f95 -m64"
FFLAGS=-O
CXX="CC -library=stlport4 -m64"
CXXFLAGS=-O
FC="f95 -m64"
FCFLAGS=$FFLAGS
FCLIBS="-lfai -lfsu"
R_LD_LIBRARY_PATH="/usr/local/lib:/opt/csw/gcc4/lib:/opt/csw/lib/64"
FLIBS_IN_SO="-R/opt/solarisstudio12.3/lib/amd64 /opt/solarisstudio12.3/lib/amd64/libfui.so /opt/solarisstudio12.3/lib/amd64/libfsu.so"
EOF
./configure --prefix=/usr/R-sun64 CPPFLAGS="-I/opt/csw/include" LDFLAGS="-L/opt/csw/lib/64" 
make
sudo make install

