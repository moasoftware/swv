wget http://download.sonatype.com/nexus/3/nexus-3.13.0-01-unix.tar.gz
tar -xzvf nexus-3.13.0-01-unix.tar.gz
ln -s nexus-3.13.0-01 nexus
useradd nexus
chown -R nexus:nexus /usr/local/SWV/tools/nexus
chown -R nexus:nexus /usr/local/SWV/tools/sonatype-work/