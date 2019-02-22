cd /usr/local/SWV/dev
mkdir java
cd java
wget http://203.249.87.143/woosung/jdk-8u191-linux-x64.rpm
yum -y remove copy-jdk-*
rpm -ivh --prefix=/usr/local/SWV/dev/java jdk-8u191-linux-x64.rpm
mv /usr/local/SWV/dev/java/jdk1.8.0_191-amd64 /usr/local/SWV/dev/java/jdk1.8.0_191
rm -rf /usr/bin/java
ln -s /usr/local/SWV/dev/java/jdk1.8.0_191/bin/java /usr/bin/java
echo JAVA_HOME=/usr/local/SWV/dev/java/jdk1.8.0_191 >> /etc/profile
echo JRE_HOME=/usr/local/SWV/dev/java/jdk1.8.0_191/jre >> /etc/profile
echo CLASSPATH=.:$JAVA_HOME/lib/tools.jar >> /etc/profile
echo PATH=$PATH:$JAVA_HOME/bin >> /etc/profile
echo export JAVA_HOME CLASSPATH PATH >> /etc/profile
source /etc/profile