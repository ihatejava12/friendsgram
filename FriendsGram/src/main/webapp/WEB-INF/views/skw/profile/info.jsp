<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>나의 이력서</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>

<style>

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.header {
  position: fixed; /* 헤더를 화면에 고정 */
  top: 0; /* 화면 상단에 위치 */
  left: 0; /* 화면 왼쪽에 위치 */
  width: 100%; /* 화면 너비에 맞게 설정 */
  z-index: 1000; /* 다른 요소 위에 보이도록 설정 */
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
}

html, body {
  height: 100%;
  margin: 0;
}
body {
    margin-top: 80px; /* 헤더 높이만큼의 여백 추가 */
}

.logo img {
  height: 50px;
  width: auto;
}

.navigation a {
  margin-right: 15px;
  color: #565E6C;
  font-weight: bold;
  text-decoration: none;
}

.actions a {
  margin-left: 10px;
  color: #0C9200;
  font-weight: bold;
  text-decoration: none;
}

main {
  font-family: 'Inter', sans-serif;
  font-size: 14px;
  line-height: 1.6;
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* Ensures full viewport height is covered */
  margin: 0;
  overflow-x: hidden; /* Prevents horizontal scrolling */
}

.footer {
  background-color: rgba(30, 33, 40, 0.68);
  color: white;
  padding: 30px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  width: 100%;
  margin-top: auto; /* 푸터가 페이지의 끝에 위치하도록 설정 */
  position: relative; /* 포지션 속성을 고정하지 않음 */
}

.footer-links a {
  margin-right: 15px;
  color: white;
  text-decoration: none;
  font-weight: bold;
}

.company-info p {
  margin-top: 10px;
  font-size: 14px;
}






 .hero-image img {
    margin-top: 20px;
  }

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
}

.logo img {
  height: 50px; /* Adjust this value as needed */
  width: auto;
}

.navigation a {
  margin-right: 15px;
  color: #565E6C;
  font-weight: bold;
  text-decoration: none;
}

.actions a {
  margin-left: 10px;
  color: #0C9200;
  font-weight: bold;
  text-decoration: none;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {
	border: 1px solid black;
	background-color: lightgray;
	width: 150px;
}

td {
	border: 1px solid black;
}

#allcontent {
	margin: auto 15% 
}

#headcontent{
	background-color: lightgreen;
}

/* 메인 컨텐츠 스타일 */
main {
    max-width: 900px;
    margin: 50px auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* 헤더 제목 스타일 */
#center h1 {
    font-size: 3em;
    color: #4CAF50;
    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
    margin-bottom: 30px;
}

/* 링크 스타일 */
#center a {
    display: inline-block;
    margin: 15px 20px;
    padding: 15px 30px;
    background-color: #4CAF50;
    color: #fff;
    text-decoration: none;
    border-radius: 10px;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

#center a:hover {
    background-color: #45a049;
    transform: scale(1.1);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

#center a:active {
    background-color: #3e8e41;
    transform: scale(1.05);
}

/* 추가된 이력서 작성 및 확인 버튼 스타일 */
main a {
    display: inline-block;
    margin: 20px;
    padding: 15px 30px;
    background-color: #007BFF;
    color: #fff;
    text-decoration: none;
    border-radius: 10px;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

main a:hover {
    background-color: #0069d9;
    transform: scale(1.1);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

main a:active {
    background-color: #0056b3;
    transform: scale(1.05);
}

</style>

</head>
<body>
 <header class="header">
        <div class="logo">
            <a href="/main">
                <img src="../img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
            </a>
        </div>
        <nav class="navigation">
			<a href="/board01/main">코딩 게시판</a>  <a href="/board02/main">팀 모집</a> <a href="/board03/main">프리랜서 검색</a>
			<a href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
        </nav>
        <div class="actions">
			<c:if test="${user.id != null }">
			<a class="login" href="/logout">로그아웃</a>
			</c:if>
			<c:if test="${user.id == null }">
			<a class="login" href="/loginform">로그인</a>
			</c:if>
			<a class="profile" href="/myprofile">프로필</a>
            <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480,left=600,top=200'); return false;">메시지</a>
        </div>
    </header>
    <main>
    <div id="center">
        <h1>나의 이력서</h1>
        <a href="/myprofile">나의 정보</a>
        <a href="/info">이력서</a>
        <a href="/review/${user.id}">나의 리뷰</a>
        <a href="/myquestion">문의 사항 보기</a>
    </div>

    <a href="/infowrite">이력서 작성</a>
    <a href="/infock">이력서 확인</a>
</main>
			<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
				처리방침</a> <a href="#">광고문의</a><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>
			
</html>