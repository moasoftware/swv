# Software Visualization Environment Install Guide for Linux

## Getting Started

- 이 문서는 리눅스 OS에 SWV 환경을 설치하기 위한 가이드입니다.
- 웹 상에서 도구를 다운로드 받아 설치하기 때문에, 인터넷 연결이 필요합니다.
- 가이드 내에서 소개되는 도구들의 다운로드 경로는 해당 사이트의 정책 상의 이유로 바뀔 수 있습니다. 도구의 다운로드가 실패한다면, 별첨을 참조하여 경로를 변경하십시오.

### Prerequisites
```
CentOS 7 이상의 리눅스 OS
```
CentOS 7 설치 방법 : https://github.com/moasoftware/swv/blob/master/README_os.md

### Installing

1. 파일 다운로드 받기 
- https://github.com/moasoftware/swv에서 파일 다운로드 
```
# wget https://github.com/moasoftware/swv/archive/master.zip
# unzip master.zip
# cd swv-master
```

2. 설치 작업 수행하기
- root 권한으로 로그인 후, SWV 디렉터리의 install.sh를 실행
```
# su - root
[암호 입력]
# cd swv
# chmod 755 install.sh
# ./install.sh
```

- 설치 과정 중, MySQL Secure installation 과정에서 다음과 같이 암호를 물어보면 'password'를 입력

```
Enter password for user root : [기존 비밀번호 입력]
New password: [바꿀 비밀번호 입력]
Re-enter new password: [바꿀 비밀번호 다시 입력]
[기타 물음에 모두 엔터를 입력하여 default 값 입력]
```

- 설치 과정 중, Passenger 설치 과정에서 설치 옵션을 물어보면 엔터키를 입력하여 모두 기본 설정으로 입력. 단 다음과 같은 물음이 나오면, Ruby만 제외하고 모두 선택해제(스페이스바로 선택 가능)하여 입력

  ![](C:/Users/ws/Desktop/swv2/swv/images/011_rubysetting.jpg)



3. 설치 완료 후 Jenkins 세팅하기

- 웹브라우저를 이용하여 Jenkins 실행 확인(http://localhost/jenkins 경로로 접근)
  ![](C:/Users/ws/Desktop/swv2/swv/images/003_jenkinsresult1.jpg)
- Jenkins 패스워드 조회를 위해 initialAdminPassword 파일의 내용을 출력하여 드래그 후 Ctrl+C로 복사 (아래에 출력된 패스워드는 예시이므로 반드시 실제 출력되는 패스워드를 복사해야 함)

```
# cat /root/.jenkins/secrets/initialAdminPassword
59b4fbffdf704909bb37cbe085a31833

```

- 웹브라우저의 암호 입력칸에 복사된 패스워드를 입력
  ![](C:/Users/ws/Desktop/swv2/swv/images/004_jenkinsresult2.jpg)
- Install suggested plugins 선택
  ![](C:/Users/ws/Desktop/swv2/swv/images/005_jenkinsresult3.jpg)
- 세팅이 완료될 때까지 기다린 후 Continue 버튼 클릭
  ![](C:/Users/ws/Desktop/swv2/swv/images/006_jenkinsresult4.jpg)
- 계정 정보 입력(본 문서에서는 id: admin, pw: ssssssss)
  ![](C:/Users/ws/Desktop/swv2/swv/images/007_jenkinsresult5.jpg)
- save and finish 선택
  ![](C:/Users/ws/Desktop/swv2/swv/images/008_jenkinsresult6.jpg)
- Start using Jenkins 선택
  ![](C:/Users/ws/Desktop/swv2/swv/images/009_jenkinsresult7.jpg)
- 앞서 설정한 아이디와 암호 입력하여 로그인
  ![](C:/Users/ws/Desktop/swv2/swv/images/010_jenkinsresult8.jpg)
- Jenkins is ready! 페이지 이후 흰색 페이지만 보인다면, Tomcat 서버 재시작

```
# /usr/local/SWV/server/tomcat/bin/shutdown.sh
# /usr/local/SWV/server/tomcat/bin/startup.sh

```



## 별첨 1
apr의 다운로드 경로가 변경되었을 경우, 경로를 찾는 방법(Windows 10 기준)
- http://mirror.apache-kr.org/apr에 접속
![](images/013_aprsite1.jpg)
- 다운로드 받고자 하는 파일을 마우스 오른쪽 버튼으로 클릭 후 속성 선택
![](images/014_aprsite2.jpg)
- 파일의 주소(URL)을 확인 후 해당 주소로 다운로드
![](images/015_aprsite3.jpg)



## 별첨 2
JDK의 다운로드 경로가 변경되었을 경우, 경로를 찾는 방법(Windows 10 기준)
- https://www.oracle.com/technetwork/java/javase/downloads/index.html에 접속하여 JDK 다운로드 클릭
![](images/016_jdksite1.jpg)
- Accept License Agreement 클릭
![](images/017_jdksite2.jpg)
- 다운로드 받고자 하는 파일의 이름을 마우스 오른쪽 버튼으로 클릭 후 속성 선택
![](images/018_jdksite3.jpg)
- 파일의 주소(URL)을 확인 후 해당 주소로 다운로드
![](images/019_jdksite4.jpg)
