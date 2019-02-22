cd /usr/local/SWV/server
wget http://archive.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz
tar -xzvf tomcat-connectors-1.2.42-src.tar.gz
ln -s tomcat-connectors-1.2.42-src/ connector
cd connector/native
chmod +x buildconf.sh
./configure --with-apxs=/usr/local/SWV/server/httpd/bin/apxs && make && make install
/bin/cp -arp apache-2.0/mod_jk.so /usr/local/SWV/server/httpd/modules/
echo LoadModule jk_module modules/mod_jk.so >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo ServerName localhost >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo \<VirtualHost *:80\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo ServerName localhost >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkMount /*.jsp tomcat >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkMount /*.json tomcat >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkMount /*.xml tomcat >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkMount /*.do tomcat >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo \</VirtualHost\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo \<IfModule mod_jk.c\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkWorkersFile conf/workers.properties >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkShmFile run/mod_jk.shm >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkLogFile logs/mod_jk.log >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkLogLevel info >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo JkLogStampFormat \"[%y %m %d %H:%M:%S] \" >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo \</IfModule\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
mkdir /usr/local/SWV/server/httpd/run
chcon -u system_u -r object_r -t httpd_modules_t /usr/local/SWV/server/httpd/modules/mod_jk.so
echo worker.list=tomcat >> /usr/local/SWV/server/httpd/conf/workers.properties
echo worker.tomcat.port=8009 >> /usr/local/SWV/server/httpd/conf/workers.properties
echo worker.tomcat.host=localhost >> /usr/local/SWV/server/httpd/conf/workers.properties
echo worker.tomcat.type=ajp13 >> /usr/local/SWV/server/httpd/conf/workers.properties
echo worker.tomcat.lbfactor=1 >> /usr/local/SWV/server/httpd/conf/workers.properties