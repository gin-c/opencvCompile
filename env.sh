export ARCH=arm
export CROSS_COMPILE=arm-himix200-linux-
export PATH=/opt/hisi-linux/x86-arm/arm-himix200-linux/bin/:$PATH
export ZYNQ_CV_BUILD=/home/jiao/wkdir/opencv/install
export CC=arm-himix200-linux-gcc

export LDFLAGS="-L/home/jiao/wkdir/opencv/install/lib"
export CPPFLAGS="-I/home/jiao/wkdir/opencv/install/include"

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/jiao/wkdir/opencv/install/lib/pkgconfig
export LDFLAGS=-Wl,-rpath-link,/home/jiao/wkdir/opencv/install/lib
