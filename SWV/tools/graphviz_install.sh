cd /usr/local/SWV/dev
mkdir graphviz
cd graphviz
wget -c http://graphviz.gitlab.io/pub/graphviz/stable/SOURCES/graphviz.tar.gz
tar -xzvf graphviz.tar.gz
cd graphviz-2.40.1
./configure
make
make install