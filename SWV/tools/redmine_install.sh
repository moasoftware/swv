wget http://www.redmine.org/releases/redmine-3.4.4.tar.gz
tar -xzvf redmine-3.4.4.tar.gz
mv redmine-3.4.4 redmine
cd redmine
cp ./config/database.yml.example config/database.yml
