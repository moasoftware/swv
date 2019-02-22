cd /usr/local/SWV/server
yum -y install gcc make gcc-c++ pcre-devel httpd-devel apr-devel apr-util-devel
wget http://archive.apache.org/dist/httpd/httpd-2.4.29.tar.gz
wget https://archive.apache.org/dist/apr/apr-1.6.5.tar.gz
wget http://mirror.apache-kr.org/apr/apr-util-1.6.1.tar.gz
wget http://downloads.sourceforge.net/project/pcre/pcre/8.41/pcre-8.41.tar.gz
tar -xvzf httpd-2.4.29.tar.gz
tar -xzvf apr-1.6.5.tar.gz
tar -xzvf apr-util-1.6.1.tar.gz
tar -xzvf pcre-8.41.tar.gz
mv apr-1.6.5 ./httpd-2.4.29/srclib/apr
mv apr-util-1.6.1 ./httpd-2.4.29/srclib/apr-util
cd pcre-8.41
./configure
make
make install
cd ../httpd-2.4.29
./configure --prefix=/usr/local/SWV/server/httpd
yum -y install expat-devel
make
make install
mv /usr/local/SWV/server/httpd/htdocs /usr/local/SWV/
ln /usr/local/SWV/server/httpd/bin/httpd /bin/httpd
cd /usr/local/SWV/server/httpd/conf/
sed -i 's?DocumentRoot "/usr/local/SWV/server/httpd/htdocs"?DocumentRoot "/usr/local/SWV/htdocs"?' httpd.conf
sed -i 's?<Directory "/usr/local/SWV/server/httpd/htdocs">?<Directory "/usr/local/SWV/htdocs">?' httpd.conf
sed -i 's?# ServerName www.example.com:80?ServerName localhost:80?' httpd.conf