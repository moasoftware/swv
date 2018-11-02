cd /usr/local/SWV/server
wget http://archive.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz
tar -xzvf tomcat-connectors-1.2.42-src.tar.gz
ln -s tomcat-connectors-1.2.42-src/ connector
cd connector/native
chmod +x buildconf.sh 
./configure --with-apxs=/usr/local/SWV/server/httpd/bin/apxs && make && make install
cp apache-2.0/mod_jk.so /usr/local/SWV/server/httpd/modules/