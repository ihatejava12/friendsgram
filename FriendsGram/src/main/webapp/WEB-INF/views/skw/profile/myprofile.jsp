<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
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
 	@charset "utf-8";
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

@media (max-width: 768px) {
  .hero-section {
    flex-direction: column;
    text-align: center;
  }

  .hero-image img {
    margin-top: 20px;
  }
 </style>
 
 <header class="header">
        <div class="logo">
            <a href="/main">
                <img src="../img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
            </a>
        </div>
        <nav class="navigation">
            <a href="#">코딩 게시판</a>
            <a href="#">프리랜서 검색</a>
            <a href="#">팀 모집</a>
            <a href="/list">프리랜서 공고</a>
            <a href="#">취업 공고</a>
        </nav>
        <div class="actions">
            
            <a class="logout" href="logout">로그아웃</a>
            <a class="profile" href="myprofile">프로필</a>
            <a class="messages" href="#">메시지</a>
            
        </div>
    </header>
	<div id="center">
		<h1>개인페이지 작성중</h1>
		<a href="/myprofile">나의 정보</a>
		<a href="/info">이력서</a>
		<a href="/review">나의 리뷰</a>
	</div>
	<form action="update" method="post" id="myprofile">
	<input type="hidden" name="_method" value="put">
	<h2>${user.id}님의 개인페이지</h2>
	
	<table>
	<tr><td>아이디:</td><td>${user.id}</td></tr>
	<tr><td>이름:</td><td>${user.name}</td></tr>
	<tr><td>비밀번호:</td><td><input name="password" type="password" id="password"></td></tr><br/>
	<tr><td>이메일:</td><td><input name="email" id="email" value="${user.email}"></td></tr>
	<tr><td>생년월일:</td><td>${user.birth}</td></tr>
	<tr><td>성별:</td><td>${user.gender}</td></tr>
	<tr><td>휴대폰:</td><td><input name="phone" id="phone" value="${user.phone}"></td></tr>
	
	<tr><td colspan="2"><input type="submit" value="수정"></td></tr>
	</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
	$(function(){
	$("#myprofile").submit(function(){
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
			}
		});
	})

	</script>
</body>
</html>