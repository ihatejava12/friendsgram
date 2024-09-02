<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FriendsGram</title>

<style>

#allcontent {
	width: 60%;
	margin: 20px auto;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 40px;
	padding-right: 40px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

#headcontent h2 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
  color: #333;
}

button[class='href']{
	margin-bottom: 15px;
	padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}


select {
width: 100%; /* select 박스의 너비를 200px로 설정 */
    height: 35px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
}

#addskil, #title {
width: 100%; /* select 박스의 너비를 200px로 설정 */
    height: 35px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
}

#smarteditor {
	border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    margin-bottom: 15px;
}

#save {
margin-bottom: 15px;
	padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
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






a {
	text-decoration: none;
}

</style>


</head>
<body>
<!--  bList begin end count pageNum totalPages -->
<div>
 <header class="header">
      <div class="logo">
         <a href="/main"> <img src="/images/logo.png" alt="프렌즈그램 로고"
            class="logo-image" />
         </a>
      </div>
      <nav class="navigation">
         <a href="/board01/main">코딩 게시판</a>  <a href="/board02/main">팀 모집</a> <a href="/board03/main">프리랜서 검색</a>
          <a   href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
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
 
</div>


<main>

<div id="allcontent">
<div id="headcontent" align="center" style="height:80px;">
	<h2 align="center">코딩 게시판</h2>
	
	
	
</div>




<div align="right">
	<button class='href'><a href="/board01/main"><font color="white">목록</font></a></button>
</div>



<!--  oneArticle 라는 이름으로 글정보 Dto 1개 받아옴  -->
<form method="post" id="writeform" action="/board01/update/article">
	<div class="head">
		<input type="hidden" name="id" value="${oneArticle.id}"/>
		<input type="hidden" name="b_no01" value="${oneArticle.b_no01}"/>
		<div style="margin-bottom: 15px; ">
		<div style="margin-bottom: 7px;"><font size="3"><b>개발 언어</b></font></div> 
		<select id="selectskil" name="code">
			<option value="all" ${oneArticle.code == 'all'?"selected":"" }>전체</option>
			<option value="java" ${oneArticle.code == 'java'?"selected":"" }>JAVA</option>
			<option value="python" ${oneArticle.code == 'python'?"selected":"" }>PYTHON</option>
			<option value="html" ${oneArticle.code == 'html'?"selected":"" }>HTML</option>
			<option value="database" ${oneArticle.code == 'database'?"selected":"" }>DATABASE</option>
			<option value="other" ${oneArticle.code == 'other'?"selected":"" }>직접 입력</option>
		</select>
		<input id="addskil" name="addskil" style="display: none;"
								size="10" />
		
		</div>
		<div style="margin-bottom: 15px;">
		<div style="margin-bottom:7px;"><font size="3"><b>제목</b></font></div>
		<input type="text" name="title" id="title" value="${oneArticle.title }"/>
		</div>
	</div>
	
	<div style="margin-bottom:7px;"><font size="3"><b>내용</b></font></div>
	 <div class="content" id="smarteditor">
 		<textarea id="editorTxt" name="content" cols="40" rows="10"
			placeholder="내용을 입력해주세요" style="width:100%; height:400px;">
			${oneArticle.title }
			</textarea>
 	</div>

	<input type="submit" value="글 수정" id="save"/>
</form>

</div>

</main>

  
   <footer class="footer">
      <div class="footer-links">
         <a href="#">프리랜서 이용약관</a> <a href="#">고객센터</a> <a href="#">개인정보
            처리방침</a> <a href="#">광고문의</a><c:if test="${ user.role == 2 || user.role == 1}"><a href="/adminpage/board01">관리자</a></c:if>
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
    
    
    $(function() {

			$("#selectskil").change(function() {
				if ($("#selectskil").val() == 'other') {
					$("#addskil").show();
				}
			})

		})
  </script>




</body>


</html>