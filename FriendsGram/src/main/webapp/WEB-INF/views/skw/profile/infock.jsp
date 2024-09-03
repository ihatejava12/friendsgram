<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>이력서 확인</title>
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
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
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.header, .footer {
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
  margin: 0;
  padding: 10px 20px;
}

.navigation a {
  margin-right: 15px;
  color: #565E6C;
  font-weight: bold;
  text-decoration: none;
}

.logo img {
  height: 40px;
  width: auto;
}

.actions a {
  margin-left: 10px;
  color: #0C9200;
  font-weight: bold;
  text-decoration: none;
}

main {
  max-width: 900px; /* 메인의 너비를 900px로 넓힘 */
  margin: 60px auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  flex-grow: 1;
}

#center {
  text-align: center;
  margin-bottom: 30px;
}

#center h1 {
  font-size: 2.5em;
  color: #4CAF50;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  margin-top: 0;
  text-align: center; /* 제목을 가운데 정렬 */
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

/* 버튼을 평행하게 나열하기 위한 스타일 */
#button-group {
  display: flex;
  justify-content: space-around; /* 버튼을 균등하게 나열 */
  margin-top: 20px;
}

#button-group a {
  flex: 1; /* 버튼이 균등한 크기로 확장되도록 함 */
  margin: 0 10px; /* 버튼 간 간격 */
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  text-align: center;
  font-weight: bold;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

#button-group a:hover {
  background-color: #0069d9;
  transform: scale(1.05);
}

#button-group a:active {
  background-color: #0056b3;
  transform: scale(1);
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

/* 밑의 수정하기, 뒤로가기 버튼 스타일 */
#form-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

#form-buttons button[type="submit"] {
  background-color: #4CAF50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 1em;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
  width: 48%; /* 버튼들이 평행하게 나열되도록 */
}

#form-buttons button[type="submit"]:hover {
  background-color: #45a049;
  transform: scale(1.05);
}

#form-buttons button[type="button"] {
  background-color: #f44336;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 1em;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
  width: 48%; /* 버튼들이 평행하게 나열되도록 */
}

#form-buttons button[type="button"]:hover {
  background-color: #e53935;
  transform: scale(1.05);
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
		
			<c:if test="${user.id != null }">
				<div style="position:relative; display:inline-block; top:7px;">
					<img style="width: 25px; height:25px;" src="/images/message_icon.png" alt="메세지"/>
					<div id="numberOfMessage" style="position:absolute; top: 10px; left:15px; background-color:red; color:white;
					padding: 1px 6px; border-radius:50%; font-size:13px;"></div>
				</div>
				</c:if>
		
		</div>
	</header>
	<main>
		<div id="button-group">
		    <a href="/myprofile">나의 정보</a>
		    <a href="/info">이력서</a>
		    <a href="/review/${user.id}">나의 리뷰</a>
		    <a href="/myquestion">문의 사항 보기</a>
		    <a href="/board03/freelancer">프리랜서 등록</a>
		 </div>
		<form action="/updateinfo" method="post" id="infock">
			<input type="hidden" name="_method" value="put">
			<input type="hidden" name="id" value="${user.id}">
		    <h1>이력서 정보 확인</h1>
		    <table>
		        <tr><td>이름 :</td><td><input name="name" id="name" value="${memberInfo.name}"></td></tr>
		        <tr><td>생년월일 :</td><td>${memberInfo.birth}</td></tr>
		        <tr><td>나이 :</td><td>${memberInfo.age}</td></tr>
		        <tr><td>성별 :</td><td>${memberInfo.gender}</td></tr>
		        <tr><td>휴대폰 :</td><td><input name="phone" id="phone" value="${memberInfo.phone}"></td></tr>
		        <tr><td>Email :</td><td><input name="email" id="email" value="${memberInfo.email}"></td></tr>
		        <tr><td>주소 :</td><td><input name="address" id="address" value="${memberInfo.address}">
		        <input type="button" id="addbtn" value="우편번호 검색" onclick="openPostcodeSearch()"></td></tr>
		        <tr><td>나머지 주소 :</td><td><input name="detail_address" id="detail_address" value="${memberInfo.detail_address}"></td></tr>
		        <tr><td>자기소개서 :</td><td>${memberInfo.content}</td></tr>
		        <tr><td>학교명 :</td><td><input name="school_name" id="school_name" value="${memberInfo.school_name}"></td></tr>
		        <tr><td>학교 기간 :</td><td><input name="school_period" id="school_period" value="${memberInfo.school_period}"></td></tr>
		        <tr><td>학교 전공 :</td><td><input name="school_major" id="school_major" value="${memberInfo.school_major}"></td></tr>
		        <tr><td>경력 회사명 :</td><td><input name="career_nme" id="career_nme" value="${memberInfo.career_nme}"></td></tr>
		        <tr><td>경력 기간 :</td><td><input name="career_period" id="career_period" value="${memberInfo.career_period}"></td></tr>
		        <tr><td>경력 담당업무 :</td><td><input name="career_role" id="career_role" value="${memberInfo.career_role}"></td></tr>
		        <tr><td>자격증 이름 :</td><td><input name="certificate_name" id="certificate_name" value="${memberInfo.certificate_name}"></td></tr>
		        <tr><td>자격증 취득일자 :</td><td><input name="certificate_date" id="certificate_date" value="${memberInfo.certificate_date}"></td></tr>
		    </table>
    
		    <div id="form-buttons">
                <button type="submit">수정하기</button>
                <button type="button" onclick="history.back()">뒤로가기</button>
            </div>
		</form>
	</main>
	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> 
			<a href="#">고객센터</a> 
			<a href="#">개인정보 처리방침</a> 
			<a href="#">광고문의</a>
			<c:if test="${user != null && user.role == 2 || user.role == 1}">
			    <a href="/adminpage/board01">관리자</a>
			</c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function openPostcodeSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 주소 필드에 선택된 주소를 입력
	                document.querySelector("#address").value = data.address;
	                // 나머지 주소 필드에 포커스를 설정
	                document.querySelector("#detail_address").focus();
	            }
	        }).open({
	            popupName: 'postcodePopup', // 팝업 창 이름 지정
	            left: (window.screen.width / 2) - (500 / 2), // 화면 중앙에 위치
	            top: (window.screen.height / 2) - (600 / 2),
	            width: '500px',
	            height: '600px',
	            scrollbars: 'yes',
	            resizable: 'yes'
	        });
	    }
	    
		$(function(){
			var id = '${user.id}';
			if(id != null){
				$.ajax({
					url:"/mail/numberofmail",
					data: "id="+id,
					method:"post",
					datatype:"text"
				}).done(function(data){
					// 안읽은 메일의 개수 를 String으로 받아온걸 data 에 저장함
					if(data == '0'){
						$("#numberOfMessage").hide();
					}else{
						$("#numberOfMessage").text(data);
					}
				})
			}
		})
	    
	</script>
</body>
</html>
