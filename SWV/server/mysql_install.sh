cd /usr/local/SWV/server
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
make -j 1
make install

### MySQL 환경 설정 디렉터리 생성 후 my.cnf 파일 생성
mkdir /usr/local/SWV/server/mysql/data
mkdir /usr/local/SWV/server/mysql/conf
cd /usr/local/SWV/server/mysql/conf
echo [mysqld] >> my.cnf
echo old_passwords=0 >> my.cnf
echo datadir=/usr/local/SWV/server/mysql/data >> my.cnf
echo socket=/usr/local/SWV/server/mysql/data/mysql.sock >> my.cnf
echo user=mysql >> my.cnf
echo character-set-server = utf8 >> my.cnf
echo collation-server = utf8_general_ci >> my.cnf
echo explicit_defaults_for_timestamp >> my.cnf
echo skip-name-resolve >> my.cnf
echo skip-grant-tables >> my.cnf
echo port=3307 >> my.cnf
echo sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION >> my.cnf
echo [mysql] >> my.cnf
echo [mysqld_safe] >> my.cnf
echo log-error=/var/log/mysqld_57.log >> my.cnf
echo pid-file=/usr/local/SWV/server/mysql/data/mysql.pid >> my.cnf
echo datadir=/usr/local/SWV/server/mysql/data >> my.cnf
echo socket=/usr/local/SWV/server/mysql/data/mysql.sock >> my.cnf
echo user=mysql >> my.cnf
echo port=3306 >> my.cnf
echo skip-name-resolve >> my.cnf
echo character-set-server = utf8 >> my.cnf
echo collation-server = utf8_general_ci  >> my.cnf
echo [client] >> my.cnf
echo port = 3307 >> my.cnf
echo socket = /usr/local/SWV/server/mysql/data/mysql.sock >> my.cnf

### MySQL 디렉터리의 소유자 아이디를 mysql로 변경
cd /usr/local/SWV/server
chown mysql:mysql ./mysql/*

### MySQL 초기화
cd /usr/local/SWV/server/mysql/bin
./mysqld --defaults-file=/usr/local/SWV/server/mysql/conf/my.cnf --initialize

### MySQL 정보 등록을 위해 profile 파일 열기
sed -i 's?PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin?PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$MYSQL_HOME/bin?' /etc/profile
echo MYSQL_HOME=/usr/local/SWV/server/mysql >> /etc/profile
sed -i 's?export JAVA_HOME CLASSPATH PATH CATALINA_HOME JRE_HOME?export JAVA_HOME CLASSPATH PATH CATALINA_HOME JRE_HOME MYSQL_HOME?' /etc/profile
source /etc/profile

### MySQL 실행
cd /usr/local/SWV/server/mysql/bin
./mysqld &

### MySQL 초기비밀번호 바꿔주기 (본 문서에서는 ssssssss로 입력)
./mysql -uroot mysql -e "update user set authentication_string=password('ssssssss') where user='root'"
./mysql -uroot mysql -e "flush privileges"

###MySQL Secure Installation 수행 - 기존 비밀번호 Input값
./mysql_secure_installation