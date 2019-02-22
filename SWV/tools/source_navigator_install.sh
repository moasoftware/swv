cd /usr/local/SWV/dev
mkdir SNavi
cd SNavi
wget https://sourceforge.net/projects/sourcenav/files/NG4.5/sourcenavigator-NG4.5.tar.bz2
tar jxf sourcenavigator-NG4.5.tar.bz2
cd sourcenavigator-NG4.5
./configure --prefix=/usr/local/SWV/dev/SNavi
make
make install