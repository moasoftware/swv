cd /usr/local/SWV/tools
wget http://download.sonatype.com/nexus/3/nexus-3.13.0-01-unix.tar.gz
tar -xzvf nexus-3.13.0-01-unix.tar.gz
ln -s nexus-3.13.0-01 nexus
useradd nexus
chown -R nexus:nexus /usr/local/SWV/tools/nexus
chown -R nexus:nexus /usr/local/SWV/tools/sonatype-work/
sed -i 's?#run_as_user=""?run_as_user="nexus"?' /usr/local/SWV/tools/nexus/bin/nexus.rc
ln -s /usr/local/SWV/tools/nexus/bin/nexus /etc/init.d/nexus
cd /etc/init.d
chkconfig --add nexus
chkconfig --levels 345 nexus on
service nexus start
echo [Unit] >> /etc/systemd/system/nexus.service
echo Description=nexus service >> /etc/systemd/system/nexus.service
echo After=network.target\n >> /etc/systemd/system/nexus.service
echo [Service] >> /etc/systemd/system/nexus.service
echo Type=forking >> /etc/systemd/system/nexus.service
echo ExecStart=/usr/local/SWV/tools/nexus/bin/nexus start >> /etc/systemd/system/nexus.service
echo ExecStop=/usr/local/SWV/tools/nexus/bin/nexus stop >> /etc/systemd/system/nexus.service
echo User=nexus >> /etc/systemd/system/nexus.service
echo Restart=on-abort\n >> /etc/systemd/system/nexus.service
echo [Install] >> /etc/systemd/system/nexus.service
echo WantedBy=multi-user.target >> /etc/systemd/system/nexus.service
sed -i 's? # INSTALL4J_JAVA_HOME_OVERRIDE=? INSTALL4J_JAVA_HOME_OVERRIDE=/usr/local/SWV/dev/java/jdk1.8.0_181?' /usr/local/SWV/tools/nexus/bin/nexus
systemctl daemon-reload
systemctl enable nexus
systemctl start nexus
systemctl status nexus
tail -f /usr/local/SWV/tools/sonatype-work/nexus3/log/nexus.log
firewall-cmd --zone=public --permanent --add-port=8081/tcp
firewall-cmd --reload
sed -i 's?nexus-context-path=/? nexus-context-path=/nexus?' /usr/local/SWV/tools/nexus/etc/nexus-default.properties
sed -i 's? ProxyPass /jenkins http://127.0.0.1:8080/jenkins? ProxyPass /jenkins http://127.0.0.1:8080/jenkins\nProxyPassReverse /jenkins http://127.0.0.1:8080/jenkins\nProxyPass /nexus http://127.0.0.1:8081/nexus\nProxyPassReverse /nexus http://127.0.0.1:8081/nexus?' /usr/local/SWV/server/httpd/conf/httpd.conf
systemctl restart nexus