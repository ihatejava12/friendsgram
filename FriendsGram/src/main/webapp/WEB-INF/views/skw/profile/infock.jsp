<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>이력서 확인</title>
<style>

/* 기본 스타일 */
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

body {
  font-family: 'Inter', sans-serif;
  background-color: #f0f0f0;
  color: #333;
  margin: 0;
  padding: 0;
}

.header, .footer {
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
  margin: 0; /* 헤더의 마진 제거 */
  padding: 10px 20px; /* 필요한 패딩만 남김 */
}

.navigation a {
  margin-right: 15px;
  color: #565E6C;
  font-weight: bold;
  text-decoration: none;
}

.logo img {
  height: 40px; /* 로고 이미지의 높이를 40px로 설정 */
  width: auto; /* 너비는 자동 조정 */
}

.actions a {
  margin-left: 10px;
  color: #0C9200;
  font-weight: bold;
  text-decoration: none;
}

main {
  max-width: 900px;
  margin: 0 auto; /* 메인의 마진 제거, 가운데 정렬 */
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

#center {
  text-align: center;
  margin-bottom: 30px;
}

#center h1 {
  font-size: 2.5em;
  color: #4CAF50;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  margin-top: 50px; /* 제목을 아래로 내리기 위해 여백 추가 */
}

#center a {
  display: inline-block;
  margin: 10px 15px;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

#center a:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

form {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

h2 {
  color: #333;
  text-align: center;
  margin-bottom: 20px;
  font-size: 1.8em;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

th, td {
  padding: 12px 15px;
  border: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
  text-align: left;
  color: #333;
  font-weight: bold;
}

td {
  text-align: left;
}

input[type="text"], input[type="password"], textarea {
  width: calc(100% - 20px);
  padding: 10px;
  margin-top: 5px;
  margin-bottom: 15px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 1em;
}

input[type="text"]:focus, input[type="password"]:focus, textarea:focus {
  border-color: #4CAF50;
  box-shadow: 0 0 5px rgba(0, 255, 0, 0.5);
}

/* 버튼 스타일 */
button {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 1em;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

button[type="submit"] {
  background-color: #4CAF50;
  color: #fff;
}

button[type="submit"]:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

button[type="button"] {
  background-color: #f44336;
  color: #fff;
}

button[type="button"]:hover {
  background-color: #e53935;
  transform: scale(1.05);
}

/* 우편번호 검색 버튼 스타일 */
input[type="button"][value="우편번호 검색"] {
  background-color: #008CBA;
  color: #fff;
  margin-left: 10px;
}

input[type="button"][value="우편번호 검색"]:hover {
  background-color: #007BB5;
  transform: scale(1.05);
}

input[type="button"][value="우편번호 검색"]:active {
  background-color: #005F8C;
  transform: scale(1);
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
  margin-top: auto;
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
			<a href="/board01/main">코딩 게시판</a>  
			<a href="/board02/main">팀 모집</a> 
			<a href="/board03/main">프리랜서 검색</a>
			<a href="/list">프리랜서 공고</a> 
			<a href="/board05">취업 공고</a>
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
			<h1>이력서 확인</h1>
			<a href="/myprofile">나의 정보</a>
			<a href="/info">이력서</a>
			<a href="/review/${user.id}">나의 리뷰</a>
			<a href="/myquestion">문의 사항 보기</a>
		</div>
		<form action="update" method="post" id="infock">
			<input type="hidden" name="_method" value="put">
			<div class="container">
    <h1>이력서 정보 확인</h1>
    <table>
        <tr><td>이름 :</td><td>${memberInfo.name}</td></tr>
<tr><td>생년월일 :</td><td>${memberInfo.birth}</td></tr>
<tr><td>나이 :</td><td>${memberInfo.age}</td></tr>
<tr><td>성별 :</td><td>${memberInfo.gender}</td></tr>
<tr><td>휴대폰 :</td><td>${memberInfo.phone}</td></tr>
<tr><td>Email :</td><td>${memberInfo.email}</td></tr>
<tr><td>주소 :</td><td>${memberInfo.address}</td></tr>
<tr><td>나머지 주소 :</td><td>${memberInfo.detail_address}</td></tr>
<tr><td>자기소개서 :</td><td>${memberInfo.content}</td></tr>
<tr><td>학교명 :</td><td>${memberInfo.school_name}</td></tr>
<tr><td>학교 기간 :</td><td>${memberInfo.school_period}</td></tr>
<tr><td>학교 전공 :</td><td>${memberInfo.school_major}</td></tr>
<tr><td>경력 회사명 :</td><td>${memberInfo.career_nme}</td></tr>
<tr><td>경력 기간 :</td><td>${memberInfo.career_period}</td></tr>
<tr><td>경력 담당업무 :</td><td>${memberInfo.career_role}</td></tr>
<tr><td>자격증 이름 :</td><td>${memberInfo.certificate_name}</td></tr>
<tr><td>자격증 취득일자 :</td><td>${memberInfo.certificate_date}</td></tr>
    </table>
    <a href="infowrite.jsp">다시 작성하기</a>
			<div style="text-align: center; margin-top: 20px;">
				<button type="submit">수정하기</button>
				<button type="button" onclick="history.back()">뒤로가기</button>
			</div>
		</form>
	</main>
	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보 처리방침</a> <a href="#">광고문의</a>
			<c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function addPost(){
			new daum.Postcode({
				oncomplete: function(data) {
					document.querySelector("#address").value = data.address;
					document.querySelector("#detailed_address").focus();
					alert("나머지 주소를 입력해 주세요.");
				}
			}).open();
		}
	</script>
</body>
</html>