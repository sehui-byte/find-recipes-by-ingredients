# 전지적 냉장고 시점 프로젝트 (완료)
**냉장고 속 식자재를 이용하여 만들 수 있는 레시피를 알려주는 서비스**

- 팀원 : 김세희, 김예빈, 김정우, 김재민, 박병율, 정상우, 정희찬 (7명)
- 프로젝트 기한 : 2021.02.08 ~2021.03.08 (약 4주)
<img src="https://user-images.githubusercontent.com/64109506/110205423-30582800-7ebb-11eb-8f1b-e535d0b1584f.png" width="200">
  
## 프로젝트 목표 
- spring을 기반으로 한 웹서비스 구현. 
- 각 조원 모두가 스프링 기본 구조에 대해 이해하고 게시판 ISUD를 구현할 수 있도록 한다.
- spring websocket, spring security를 이용하여 보다 확장된 spring 기능에 대해 공부할 수 있도록 한다.
- 오라클 DB를 이용하여 관계형 데이터베이스에 대해 이해하고 서비스를 구현하면서 테이블 정규화, 조인 등의 개념을 활용할 수 있도록 한다.
- ajax를 활용하여 데이터를 비동기 방식으로 주고 받는 것을 이해할 수 있도록 한다.
- java뿐만이 아니라 python을 사용하여 데이터를 시각화할 수 있도록 한다.
- html, css, jquery를 이용하여 기본적인 UI를 구현할 수 있도록 한다.
- 다음 우편 api, 네이버 검색 api, 식약처 api 등 다양한 api를 활용할 수 있도록 한다.

## 프로젝트 사용기술
- **Database** : Oracle 11g
- **Service System** : Apache Tomcat 8.5, Spring4(Security, WebSocket), MyBatis, RESTful API, Maven
- **Language** : Java8, jsp, html5, css3, Javascript, python 3.7.7, SQL, Jquery(ajax)
- **Tool** : Eclipse202006, SQL Developer, Pycharm, Django, Flask
- **open API** : 네이버 검색 api, 다음 우편검색 api, 식품의약안천처 데이터활용서비스
- **형상관리** : Git/Github
- **UI/UX Framework** : Bootstrap 5.0


   
## 역할분담
- 김세희(조장) : 개발환경구축(git, maven), 네이버 open api를 활용한 식재료 상품검색 기능, 관심상품 등록 및 삭제 기능, 스프링 웹소켓을 이용한 실시간 알림 기능, 화면설계 구현
- 김정우(부조장) : 개발환경구축(linux, ubuntu, flask), DBA, Database 설계 및 구축, Spring Security를 활용한 관리자 페이지 및 로그인 기능 구현
- 김예빈 : 자바스크립트 쿠키를 활용한 식재료 최근 검색어 기능, 식재료 최근 본 상품 기능, 파이썬 크롤링을 이용한 관심상품 최저가 비교 및 최저가 비교 팝업창 기능 구현
- 김재민 : 테이블 정의서를 통한 DB 테이블 설계, 셰프 게시판 구독 기능, 게시판 댓글 모듈, 셰프 게시판 ISUD, 전체 게시판 및 댓글 화면 설계 구현
- 박병율 : 게시판 DB설계 및 구축, Q&A게시판 및 공지사항 게시판 ISUD구현, python matplotlib, pandas를 이용한 레시피 영양소 시각화 구현
- 정상우 : 회원가입 DB설계 및 구축, jquery validation plugin, 다음 우편 api를 활용한 회원가입 및 관리자 페이지 기능, 화면설계 구현
- 정희찬: 식약처 open api를 활용한 레시피 게시판, 다중파일 업로드 모듈, 파이썬 시각화 구현

------

## 개발일정
![image](https://user-images.githubusercontent.com/64109506/111066643-63299e00-8503-11eb-8da2-7d3ba6663537.png)
  


## ERD
![image](https://user-images.githubusercontent.com/64109506/111067113-ee0b9800-8505-11eb-97d8-3b8ebad5a65b.png)

## 시스템 아키텍처
![image](https://user-images.githubusercontent.com/64109506/111067256-cf59d100-8506-11eb-80da-ab310c38c148.png)

## 사이트 맵
![image](https://user-images.githubusercontent.com/64109506/111067276-e00a4700-8506-11eb-8c13-79174faa05cc.png)


----------------

### 브랜치 규칙
- 기능별로 나눈다.
   - **common : 정희찬, 박병율, 정상우**
   - **member : 김정우, 정상우**
   - **product : 김세희, 김예빈**
   - **reply : 김재민**
   - **chef : 김재민**
   - **recipe : 정희찬**
   - **notice : 박병율**
   - **front : 김세희**
   - **websocket : 김세희**
   

### 커밋 규칙
- '어떻게' 보다는 '무엇'과 '왜'를 설명한다.
- 마침표를 찍지 않는다.
- 작업상태를 가능하면 아래와 같이 통일하여 표현한다.
   - 준비중
   - 개발중
   - 구현 완료
   - 수정
   - 테스트
   
   ex) 로그인 개발중, 회원가입 구현 완료, readme파일 업데이트 ...
   
   
