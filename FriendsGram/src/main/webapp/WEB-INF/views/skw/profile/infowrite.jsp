<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>이력서 작성</title>
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
	<h3>이력서 작성중</h3>
	<form action="insertInfo" method="post" id="infowrite">
		<table>
      <tr><td>이름 : </td><td>${user.name}</td></tr>
      <tr><td>생년월일 : </td><td>${user.birth}</td></tr>
      <tr><td>나이 : </td><td><input name="age" id="age"></td></tr>
      <tr><td>성별 : </td><td>${user.gender}</td></tr>
	  <tr><td>전화번호 : ${user.gender}</td></tr>			
      <tr><td>email : ${user.gender}</td><td>
       <tr><td>주소 :</td><td><input name="address" id="address">
               <input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"></td></tr>
      <tr><td>자기소개서 :</td><td><input type="text" name="content" id="content"></td></tr>
	  <tr><td>학교명<input name="school_name" id="school_name"></td><td>
	  <tr><td>학교 기간<input name="school_period" id="school_period"></td><td>
	  <tr><td>학교 전공<input name="school_major" id="school_major"></td><td>
	  <tr><td>경력 회사명<input name="career_nme" id="career_nme"></td><td>
	  <tr><td>경력 기간<input name="career_period" id="career_period"></td><td>
	  <tr><td>경력 담당업무<input name="career_role" id="career_role"></td><td>
	  <tr><td>자격증 이름<input name="certificate_name" id="certificate_name"></td><td>
	  <tr><td>자격증 취득일자<input name="certificate_date" id="certificate_date"></td><td>
   		
      <tr><td><input type="submit" value="등록"></td></tr>
      <tr><td><input type="button" value="취소"></td></tr>
   </table>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
               document.querySelector("#address").value = data.address;
               alert("나머지 주소도 입력하세요.");
        }
    }).open();
}    
</script>
</body>
</html>