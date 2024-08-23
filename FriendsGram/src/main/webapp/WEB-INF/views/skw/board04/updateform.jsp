<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
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

#headcontent {
	background-color: lightgreen;
}
</style>
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
			</a>
		</div>
		<nav class="navigation">
			<a href="board01/main">코딩 게시판</a> <a href="board02/main">팀 모집</a> <a
				href="board03/main">프리랜서 검색</a> <a href="/list">프리랜서 공고</a> <a
				href="/board05">취업 공고</a>
		</nav>
		<div class="actions">
			<c:if test="${user.id != null }">
				<a class="login" href="/logout">로그아웃</a>
			</c:if>
			<c:if test="${user.id == null }">
				<a class="login" href="/loginform">로그인</a>
			</c:if>

			<a class="profile" href="/myprofile">프로필</a> <a class="messages"
				href="/mail"
				onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
		</div>
	</header>

	<main>
		<form method="post" id="updateform" action="/board04/update/${dto.b_no04}">
			
			<label for="title">제목 : </label>
			<input type="text" id="title" name="title" value="${dto.title}" required><br> 
				
			<label for="work_type">근무 형태 : </label>
			<div class="work-type-options">
				<input type="radio" id="out" name="work_type" value="true"
					<c:if test="${dto.work_type == true}">checked</c:if>> 
				<label for="out">원격</label> 
				<input type="radio" id="in" name="work_type" value="false" 
				<c:if test="${dto.work_type == false}">checked</c:if>>
				<label for="in">상주</label>
			</div>

			<div id="code">
				언어 : <label><input type="checkbox" name="code" value="java">JAVA</label><br>
				<label><input type="checkbox" name="code" value="python">PYTHON</label><br>
			</div>

			<label for="salary">급여 : </label> 
			<input type="text" id="salary"name="salary" value="${dto.salary}" required> 
			<span>원</span>
			<br> 
			
			<label for="career_period">경력 기간 : </label> 
			<input type="text" id="career_period" name="career_period" value="${dto.career_period}" required><br>
			 <span>년</span>

			<label for="content">내용 : </label>
			<textarea id="content" name="content" required>${dto.content}</textarea><br> 
			
			<label for="join_date">모집기간</label> 
			<input type="text" id="join_date" name="join_date" value="${dto.join_date}" required><br> 
				
			<label for="join02">모집상태</label> 
			<input type="radio" id="Recruiting" name="join02" value="true"> 
			<label for="out">모집중</label> 
			<input type="radio" id="Recruitment completed" name="join02" value="false">
			<label for="in">모집완</label><br> 
			
			<label for="volunteer">모집자수</label>
			<input type="text" id="volunteer" name="volunteer" value="${dto.volunteer}" required><br>

			<label for="employment_date">기간</label> 
			<input type="text" id="employment_date" name="employment_date" value="${dto.employment_date}" required><br> 
			
			<label for="employment_start">시작일</label> 
			<input type="text" id="employment_start" name="employment_start" value="${dto.employment_start}" required><br>

			<button type="submit">수정하기</button>
		</form>
	</main>
	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
				처리방침</a> <a href="#">광고문의</a>
			<c:if test="${user != null && user.role == 2 || user.role == 1}">
				<a href="/adminpage/board01">관리자</a>
			</c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
</body>
</html>