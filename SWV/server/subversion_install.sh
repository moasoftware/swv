mkdir /usr/local/SWV/server/svn
cd /usr/local/SWV/server/svn
wget https://archive.apache.org/dist/subversion/subversion-1.7.14.tar.gz
tar -xzvf subversion-1.7.14.tar.gz
cd subversion-1.7.14
wget https://archive.apache.org/dist/apr/apr-util-1.3.12.tar.gz
wget https://archive.apache.org/dist/apr/apr-1.4.5.tar.gz
tar -xzvf apr-util-1.3.12.tar.gz
tar -xzvf apr-1.4.5.tar.gz
yum -y install epel-release libsqlite3x-devel.x86_64
./configure --prefix=/usr/local/SWV/server/svn --with-neon --with-ssl
make
make install