echo "/n/n===================== 1  libjpeg交叉编译 ======================="
sleep 3
tar zxvf jpegsrc.v9d.tar.gz
cd jpeg-9d
./configure --prefix=$ZYNQ_CV_BUILD --host=arm-himix200-linux --enable-shared
make -j8
make install
cd ..
 
 
echo "/n/n===================== 2  zlib交叉编译 ======================="
sleep 3
tar zxvf zlib-1.2.11.tar.gz 
cd zlib-1.2.11/
./configure --prefix=$ZYNQ_CV_BUILD --shared
make -j8
make install
cd ..
 
 
echo "/n/n===================== 3 libpng交叉编译 ======================="
sleep 3
tar zxvf libpng-1.6.37.tar.gz
cd libpng-1.6.37
 
./configure --prefix=$ZYNQ_CV_BUILD --host=arm-himix200-linux --with-pkgconfigdir=$ZYNQ_CV_BUILD/lib/pkgconfig LDFLAGS=-L$ZYNQ_CV_BUILD/lib CFLAGS=-I$ZYNQ_CV_BUILD/include
make -j8
make install
cd ..
 
 
 
echo "\n\n===================== 4 x264交叉编译 ======================="
sleep 3
tar jxvf x264-snapshot-20191217-2245-stable.tar.bz2
cd x264-snapshot-20191217-2245-stable
./configure --host=arm-linux --cross-prefix=arm-himix200-linux- --enable-shared --prefix=$ZYNQ_CV_BUILD
make -j8
make install
cd ..
 
 
echo "\n\n===================== 5 xvidcore交叉编译 ======================="
sleep 3
tar zxvf xvidcore-1.3.4.tar.gz
cd xvidcore/build/generic/
./configure --prefix=$ZYNQ_CV_BUILD --host=arm-himix200-linux --disable-assembly --enable-shared 
make -j8
make install
cd ../../../
 
echo "\n\n===================== 6 FFmpeg 交叉编译 ======================="
sleep 3
tar jxvf ffmpeg-3.1.4.tar.bz2
cd ffmpeg-3.1.4
ls
./configure --prefix=$ZYNQ_CV_BUILD --enable-shared --disable-static --enable-gpl --enable-cross-compile --arch=arm --disable-stripping --target-os=linux --enable-libx264 --enable-libxvid --cc=arm-himix200-linux-gcc --enable-swscale --extra-cflags=-I$ZYNQ_CV_BUILD/include --extra-ldflags=-L$ZYNQ_CV_BUILD/lib --disable-asm 
make -j8
make install
 
echo "\n\n===================== 第三方依赖库文件编译完成 ======================="
 
sleep 5
 
echo "\n\n======================拷贝库文件到gcc所在的文件中 ======================="
sleep 2
# cp /opt/openCV3/include/* /root/CodeSourcery/Sourcery_CodeBench_Lite_for_Xilinx_GNU_Linux/arm-himix200-linux/include/ -R
#cp /o /root/CodeSourcery/Sourcery_CodeBench_Lite_for_Xilinx_GNU_Linux/arm-himix200-linux/lib
 
sleep 5
 
echo "\n\n======================打包备份 ======================="
tar cvf /home/jiao/wkdir/opencv/install.tar /home/jiao/wkdir/opencv/install
 
echo "\n\n======================接下来准备安装opencv2/3 ======================="

