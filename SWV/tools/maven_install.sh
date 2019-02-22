cd /usr/local/SWV/tools
wget http://apache.tt.co.kr/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
tar -xzvf apache-maven-3.5.4-bin.tar.gz
mv apache-maven-3.5.4/ apache-maven/
echo # Apache Maven Environment Variables >> /etc/profile.d/maven.sh
echo # MAVEN_HOME for Maven 1 - M2_HOME for Maven 2 >> /etc/profile.d/maven.sh
echo export M2_HOME=/usr/local/SWV/tools/apache-maven >> /etc/profile.d/maven.sh
echo export PATH=${M2_HOME}/bin:${PATH} >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
