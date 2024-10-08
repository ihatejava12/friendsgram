<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FreindsGram</title>
<style>

button[class='href']{
	padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}


.free {
	border-radius: 10px;
}

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

#headcontent {
	background-color: lightgreen;
}

#content {
	align: center;
	margin: 30px auto;
}

.free {
	margin: 20px;
}

#skils button {
	background-color: #f0f0f0; /* 버튼 스타일 추가 */
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 5px 10px;
	margin-right: 5px;
	margin-bottom: 5px;
	cursor: pointer;
}

#skils button:hover {
	background-color: #e0e0e0;
}
</style>
</head>



<body>
	<div>
		<header class="header">
			<div class="logo">
				<a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
					class="logo-image" />
				</a>
			</div>
			<nav class="navigation">
				<a href="/board01/main">코딩 게시판</a> <a href="/board02/main">팀 모집</a>
				<a href="/board03/main">프리랜서 검색</a> <a href="/list">프리랜서 공고</a> <a
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
					onclick="window.open(this.href, '_blank', 'width=780, height=480,left=600,top=200'); return false;">메시지</a>
			</div>
		</header>
	
	<main style="background-color:#f9f9f9;">
	
		<div class="mainArticle" style="padding:40px;  
		border: thin solid #e0e0e0; width:900px; margin:20px auto;
		background-color:white;">
			
			<form method="post" enctype="multipart/form-data"
			 onsubmit="return formsubmit()">
			<h2>광고 문의 페이지</h2>
			
			<input type="hidden" name="id" value="${user.id }"/>
			
			<div style="margin: 15px 0px;">회사명 &nbsp;&nbsp;&nbsp;<input size="40" name="company" value="${user.company }" readonly
			style="height: 30px;"/></div>
			
			
			<div style="margin: 15px 0px;">이메일 &nbsp;&nbsp;&nbsp;<input style="height: 30px;" size="40" id="email" type="text" name="email"/> </div>
			
			<div style="margin: 15px 0px;">전화번호 <input style="height: 30px;" size="40" id="company_number" type="text" name="company_number"/> </div>
			
			<div style="margin: 15px 0px;">제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="height: 30px;" size="40" id="title" type="text" name="title"/></div>
			
			<div style="margin: 15px 0px;">첨부파일 <input style="height: 30px;" id="file" name="file" type="file"/>
						
			
			</div>
			
			<div>내용 <br>
				<textarea id="editorTxt" name="content" cols="100;" rows="30;"
				style="resize:none; "></textarea>
			</div>
			
			<div><button class="href">문의 하기</button></div>
			
			</form>
		</div>
	
	
	
	</main>
	
	
	
	
	</div>


	<footer class="footer">
		<div class="footer-links">
			<a href="#">프리랜서 이용약관</a> <a href="/question">고객센터</a> <a href="#">개인정보
				처리방침</a><c:if test="${user.role == 3 }"><a href="/advertising/question">광고문의</a></c:if><c:if test="${user != null && user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
		</div>
		<div class="company-info">
			<p>(주)프렌즈그램(대표이사: 전재민)</p>
			<p>서울 특별시 종로구 종로 12길 15 코아빌딩</p>
		</div>
	</footer>



	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	<script>
	 let oEditors = [];

	    smartEditor = function() {
	      console.log("Naver SmartEditor")
	      nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "editorTxt",
	        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
	        fCreator: "createSEditor2"
	      })
	    };

	   $(document).ready(function(){
	  
	      smartEditor()
	      
	      $("#save").click(function(){
	    	var title = $("#title").val();
	  		if(title == ""){
	  			alert("제목을 입력하세요")
	  			return false;
	  		}
	    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
	    	  //                          이게 ifame에 있는 내용을 textarea 로 옮기는 역할
	    	  $("#writeform").submit();
	      });
	      
	    })
	    
	    
	   
	     function formsubmit(){
		   var email = $("#email").val();
		   var title = $("#title").val();
		   var company_number = $("#company_number").val();
		   var editorTxt = $("#editorTxt").val();
		   
		   if(email == ""){
			   alert("이메일을 입력해주세요");
			   return false;			   
		   }
		   if(title == ""){
			   alert("제목을 입력해주세요");
			   return false;
		   }
		   if(company_number == ""){
			   alert("전화번호를 입력해주세요");
			   return false; 
		   }else{
			   
			   return true;
		   }
	   }
	    
	</script>



</body>
</html>