cd /usr/local/SWV/server
wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz
tar -xzvf apache-tomcat-8.5.38.tar.gz
ln -s /usr/local/SWV/server/apache-tomcat-8.5.38/ tomcat
echo CATALINA_HOME=/usr/local/SWV/server/tomcat >> /etc/profile
sed -i 's?CLASSPATH=.:$JAVA_HOME/lib/tools.jar?CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$CATALINA_HOME/lib/jsp-api.jar:$CATALINA_HOME/lib/servlet-api.jar?' /etc/profile
sed -i 's?PATH=$PATH:$JAVA_HOME/bin?PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin?' /etc/profile
sed -i 's?export JAVA_HOME CLASSPATH PATH?export JAVA_HOME CLASSPATH PATH CATALINA_HOME JRE_HOME?' /etc/profile
source /etc/profile
sed -i 's?<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true"?<Host name="localhost" appBase="/usr/local/SWV/webapps" unpackWARs="true" autoDeploy="true" xmlValidation="false" xmlNamespaceAware="false"?' /usr/local/SWV/server/tomcat/conf/server.xml
mv /usr/local/SWV/server/tomcat/webapps /usr/local/SWV/