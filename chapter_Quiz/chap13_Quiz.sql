--1. 관리자로 로그인한 후 kbs라는 사용자를 생성(암호: pass)하세요.
create user kbs identified by pass;

--2. 기본적인 권한 부여를 하지 않으면 데이터베이스에 로그인이 불가능하므로 connect와 resouce권한을 kbs사용자에 부여하세요.
grant connect, resource to kbs;