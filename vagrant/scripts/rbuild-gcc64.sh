cd ${HOME}/R-3.2.2
make distclean
tee config.site <<EOF
CC="/opt/csw/gcc4/bin/gcc -m64"
CPPFLAGS="-I/opt/csw/include -I/usr/local/include"
F77="/opt/csw/gcc4/bin/gfortran -m64"
FPICFLAGS=-fPIC
CXX="/opt/csw/gcc4/bin/g++ -m64"
FC=$F77
FCPICFLAGS=$FPICFLAGS
LDFLAGS="-L/opt/csw/gcc4/lib/amd64 -L/opt/csw/lib/amd64"
EOF
./configure --prefix=/usr/R-gcc64
make
sudo make install

