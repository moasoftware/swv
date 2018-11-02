useradd mysql
wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.22.tar.gz
wget https://sourceforge.net/projects/boost/files/boost/1.59.0/boost_1_59_0.tar.gz
tar -xzvf mysql-5.7.22.tar.gz
tar -xzvf boost_1_59_0.tar.gz
yum -y install ncurses-devel cmake
cd mysql-5.7.22
cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/SWV/server/mysql \
-DDOWNLOAD_BOOST=1 \
-DWITH_BOOST=/usr/local/SWV/server/boost_1_59_0 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_EXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-Dwith_ZLIB=system \
-DENABLE_DTRACE=0 \
-DMYSQL_TCP_PORT=3307 \
-DMYSQL_UNIX_ADDR=/usr/local/SWV/server/mysql/data/mysql.sock \
-DSYSCONFDIR=/usr/local/SWV/server/mysql/conf

make -j 4
make install
