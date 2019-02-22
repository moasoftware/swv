yum -y install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel
yum -y install mysql-devel ImageMagick ImageMagick-devel
yum -y install gcc g++ cpp gcc-c++
cd /usr/local/SWV/dev
wget http://cache.ruby-lang.org/pub/ruby/ruby-2.5.0.tar.gz
tar -zxvf ruby-2.5.0.tar.gz
cd ruby-2.5.0
./configure --prefix=/usr/local/SWV/dev/ruby --disable-install-doc
make
make install
ln -s /usr/local/SWV/dev/ruby-2.5.0/ruby /usr/bin/ruby