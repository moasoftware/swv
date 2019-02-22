
chmod 755 /usr/local/SWV/dev/*
chmod 755 /usr/local/SWV/htdocs/*
chmod 755 /usr/local/SWV/server/*
chmod 755 /usr/local/SWV/toolchain/*
chmod 755 /usr/local/SWV/tools/*
chmod 755 /usr/local/SWV/webapps/*

### apache_install.sh
/usr/local/SWV/server/apache_install.sh

### apache_server_start.sh
/usr/local/SWV/server/apache_server_start.sh

### apache_firewall_release.sh
/usr/local/SWV/server/apache_firewall_release.sh

### jdk_install.sh
/usr/local/SWV/dev/jdk_install.sh

### tomcat_install.sh
/usr/local/SWV/server/tomcat_install.sh

### tomcat_server_start.sh
/usr/local/SWV/server/tomcat_server_start.sh

### tomcat_firewall_release.sh
/usr/local/SWV/server/tomcat_firewall_release.sh

### apache_tomcat_connector_install.sh
/usr/local/SWV/server/apache_tomcat_connector_install.sh

### servers_restart.sh
/usr/local/SWV/server/servers_restart.sh

### jenkins_install.sh
/usr/local/SWV/webapps/jenkins_install.sh
# Jenkins를 브라우저로 한번 이상 접속하면 /root/.jenkins/secrets/initialAdminPassword 에 암호가 생성됨
# 브라우저를 통해 Jenkins에 접속해서 해당 암호를 입력

### servers_restart.sh
/usr/local/SWV/server/servers_restart.sh

### mysql_install.sh
/usr/local/SWV/server/mysql_install.sh
# 중간에 암호 입력을 물어보면 다음과 같이 입력
# Enter password for user root : [기존 비밀번호 입력(password)]
# New password: [바꿀 비밀번호 입력(password)]
# Re-enter new password: [바꿀 비밀번호 다시 입력(password)]
# [기타 물음에 모두 엔터를 입력하여 default 값 입력]

### ruby_install.sh
/usr/local/SWV/dev/ruby_install.sh

### rubygem_install.sh
/usr/local/SWV/dev/rubygem_install.sh

### redmine_install.sh
/usr/local/SWV/tools/redmine_install.sh
# [Ruby, Python, Node_Js Meteor선택을 묻는 옵션이 나오면, Ruby만 제외하고 모두 선택해제(스페이스바로 선택)]
# [기타 옵션은 기본 설정으로 진행하기 위해 모두 Enter 입력]

###apache_restart.sh
/usr/local/SWV/server/servers_restart.sh

###Subversion_install.sh
/usr/local/SWV/server/subversion_install.sh

###bash_profile의 환경변수 수정을 위해 profile 파일 열기
sed -i 's? PATH=$PATH:$HOME/bin? PATH=$PATH:$HOME/bin:/usr/local/SWV/server/svn/bin/?' ~/.bash_profile
source ~/.bash_profile

###sourcenavigator_install.sh
/usr/local/SWV/dev/sourcenavigator_install.sh

###graphviz_install.sh
/usr/local/SWV/dev/graphviz_install.sh

### git_install.sh
/usr/local/SWV/dev/git_install.sh

###apache_maven_install.sh
/usr/local/SWV/tools/maven_install.sh

###nexus_install.sh
/usr/local/SWV/tools/nexus_install.sh