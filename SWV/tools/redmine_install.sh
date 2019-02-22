cd /usr/local/SWV/tools
wget http://www.redmine.org/releases/redmine-3.4.4.tar.gz
tar -xzvf redmine-3.4.4.tar.gz
mv redmine-3.4.4 redmine
cd /usr/local/SWV/tools/redmine
cp ./config/database.yml.example config/database.yml
sed -i 's?username: root?username:redmine?' /usr/local/SWV/tools/redmine/config/database.yml
sed -i 's?password: ""?password: "1q2w3e4r"?' /usr/local/SWV/tools/redmine/config/database.yml
sed -i 's?encoding: utf8?encoding: utf8\n  socket: /usr/local/SWV/server/mysql/data/mysql.sock?' /usr/local/SWV/tools/redmine/config/database.yml
cd /usr/local/SWV/server/mysql/bin
./mysql -uroot -p"password" mysql -e "CREATE DATABASE redmine CHARACTER SET utf8 COLLATE utf8_general_ci;"
./mysql -uroot -p"password" mysql -e "CREATE USER 'redmine'@'localhost'IDENTIFIED BY '1q2w3e4r';"
./mysql -uroot -p"password" mysql -e "GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'localhost';"
./mysql -uroot -p"password" mysql -e "FLUSH PRIVILEGES;"
yum -y install patch
cd /usr/local/SWV/dev/ruby/bin
./gem install nokogiri -v '1.8.5'
cd /usr/local/SWV/tools/redmine/bin
./bundle config build.nokogiri --use-system-libraries
./bundle install --without development test
./bundle exec rake generate_secret_token
./bundle exec rake db:migrate RAILS_ENV=production
./bundle exec rake redmine:load_default_data RAILS_ENV=production REDMINE_LANG=ko

# Passenger(Redmine - Apache 연동 모듈) 설치
cd /usr/local/SWV/dev/rubygems-2.7.6/
bin/gem install passenger
/usr/local/SWV/dev/ruby/lib/ruby/gems/2.5.0/gems/passenger-5.3.5/bin/passenger-install-apache2-module
# [Ruby, Python, Node_Js Meteor선택을 묻는 옵션이 나오면, Ruby만 제외하고 모두 선택해제(스페이스바로 선택)]
# [기타 옵션은 기본 설정으로 진행하기 위해 모두 Enter 입력]

echo LoadModule passenger_module /usr/local/SWV/dev/ruby/lib/ruby/gems/2.5.0/gems/passenger-5.3.5/buildout/apache2/mod_passenger.so >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo \<IfModule mod_passenger.c\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo    PassengerRoot /usr/local/SWV/dev/ruby/lib/ruby/gems/2.5.0/gems/passenger-5.3.5 >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo    PassengerDefaultRuby /usr/local/SWV/dev/ruby/bin/ruby >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo  \</IfModule\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo  \<Directory \"/usr/local/SWV/htdocs/redmine\"\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo    Require all granted >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo    Options FollowSymLinks >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo    AllowOverride None >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo    RailsBaseURI /redmine >> /usr/local/SWV/server/httpd/conf/httpd.conf
echo  \</Directory\> >> /usr/local/SWV/server/httpd/conf/httpd.conf
ln -s /usr/local/SWV/tools/redmine/public /usr/local/SWV/htdocs/redmine
chown -R apache. /usr/local/SWV/htdocs/redmine