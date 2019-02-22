cd /usr/local/SWV/webapps
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
sed -i 's?JkMount /*.do tomcat?JkMount /*.do tomcat\n\nProxyPass /jenkins http://127.0.0.1:8080/jenkins\n ProxyPassReverse /jenkins http://127.0.0.1:8080/jenkins?' /usr/local/SWV/server/httpd/conf/httpd.conf
sed -i 's?#LoadModule proxy_module modules/mod_proxy.so?LoadModule proxy_module modules/mod_proxy.so?' /usr/local/SWV/server/httpd/conf/httpd.conf
sed -i 's?#LoadModule proxy_connect_module modules/mod_proxy_connect.so?LoadModule proxy_connect_module modules/mod_proxy_connect.so?' /usr/local/SWV/server/httpd/conf/httpd.conf
sed -i 's?#LoadModule proxy_http_module modules/mod_proxy_http.so?LoadModule proxy_http_module modules/mod_proxy_http.so?' /usr/local/SWV/server/httpd/conf/httpd.conf
sed -i 's?#LoadModule proxy_ajp_module modules/mod_proxy_ajp.so?LoadModule proxy_ajp_module modules/mod_proxy_ajp.so?' /usr/local/SWV/server/httpd/conf/httpd.conf
sed -i 's?<Host name="localhost appBase="/usr/local/SWV/webapps" unpackWARs="true" autoDeploy="true" xmlValidation="false" xmlNamespaceAware="false">?<Host name="localhost" appBase="/usr/local/SWV/webapps" unpackWARs="true" autoDeploy="true" xmlValidation="false" xmlNamespaceAware="false">\n  <Context path="" docBase="." reloadable="true"/>?' /usr/local/SWV/server/tomcat/conf/server.xml
