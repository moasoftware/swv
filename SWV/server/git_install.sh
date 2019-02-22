mkdir /usr/local/SWV/server/git
cd /usr/local/SWV/server/git
yum install curl-devel expat-devel gettext-devel \
openssl-devel zlib-devel perl-CPAN
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
tar -xzvf git-2.9.5.tar.gz
cd git-2.9.5
make prefix=/usr/local/SWV/server/git all
make prefix=/usr/local/SWV/server/git install

echo "export PATH=/usr/local/SWV/server/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
