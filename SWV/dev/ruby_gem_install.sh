cd /usr/local/SWV/dev/
wget https://rubygems.org/rubygems/rubygems-2.7.6.tgz
tar -zxvf rubygems-2.7.6.tgz
cd rubygems-2.7.6
ruby setup.rb
cd ../ruby
yum -y install libxslt-devel libxml2-devel
bin/gem install nokogiri -- --use-system-libraries
bin/gem install rails -V
bin/gem install bundler -no-rdoc --no-ri