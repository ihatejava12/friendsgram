<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>문의사항 리스트</title>
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
            <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
        </div>
    </header>
	<div id="center">
		<h1>나의 문의 사항</h1>     
		<a href="/myprofile">나의 정보</a>
		<a href="/info">이력서</a>
		<a href="/review/${user.id}">나의 리뷰</a>
		<a href="/myquestion">문의 사항 보기</a>
	</div>
<body>
	<main>
		<table border="1">
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>구분</th>
				<th>답변 여부</th>
			</tr>
			<c:forEach items="${qlist}" var="list">
				<tr>
					<td>${list.q_no}</td>
					<td>${list.title}</td>
					<td>${list.date}</td>
					
					<c:if test="${list.question_type == 0}">
						<td>계정관련 문의</td>
					</c:if>
					<c:if test="${list.question_type == 1}">
						<td>법적 문제</td>
					</c:if>
					<c:if test="${list.question_type == 2}">
						<td>기타 문의</td>
					</c:if>
					
					<c:if test="${list.request == true}">
						<td><button onclick="window.open('/question/answer/${list.q_no}', '_blank', 'width=810, height=600, top=50, left=50, scrollbars=yes')">답변보기</button></td>
					</c:if>
					<c:if test="${list.request == false}">
						<td>답변 대기중</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="myquestion?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="myquestion?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="myquestion?p=${end+1}">[다음]</a>
				</c:if>
			</div>
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