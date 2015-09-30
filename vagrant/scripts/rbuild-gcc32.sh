cd ${HOME}/R-3.2.2
make distclean
tee config.site <<EOF
CC="/opt/csw/gcc4/bin/gcc -m32"
CPPFLAGS="-I/opt/csw/include -I/usr/local/include"
F77="/opt/csw/gcc4/bin/gfortran -m32"
CXX="/opt/csw/gcc4/bin/g++ -m32"
FC="/opt/csw/gcc4/bin/gfortran -m32"
LDFLAGS="-L/opt/csw/gcc4/lib -L/opt/csw/lib -L/usr/local/lib"
EOF
./configure --prefix=/usr/R-gcc32
make
sudo make install

