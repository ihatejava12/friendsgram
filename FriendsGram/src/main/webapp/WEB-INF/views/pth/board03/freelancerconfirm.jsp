<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>FreindsGram</title>
<style>

#allcontent {
  width: 40%;
  margin: 20px auto;
  padding: 30px;
  background-color: #ffffff;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

input[class='normal'] {
width: 100%; /* select 박스의 너비를 200px로 설정 */
    height: 35px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 10px;
}

input[class='normal2'] {
width: 85%; /* select 박스의 너비를 200px로 설정 */
    height: 35px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 10px;
}

textarea[class='normal3'] {
width: 100%; /* select 박스의 너비를 200px로 설정 */
    height: 400px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 10px;
    resize:vertical;
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

button[class="button1"]{
margin-bottom: 15px;
	padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
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


a {
	text-decoration: none;
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

#headcontent{
	background-color: lightgreen;
}

#content{
	align: center;
	margin: auto 15%;
}

.free{
	margin: 20px;
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
      
      	<c:if test="${user.id != null }">
				<div style="position:relative; display:inline-block; top:7px;">
					<img style="width: 25px; height:25px;" src="/images/message_icon.png" alt="메세지"/>
					<div id="numberOfMessage" style="position:absolute; top: 10px; left:15px; background-color:red; color:white;
					padding: 1px 6px; border-radius:50%; font-size:13px;"></div>
				</div>
				</c:if>
      
      </div>
   </header>
 
</div>

<div id="headcontent" style="height: 170px; padding: 40px; background-color:#E0F2F1;">

<div style="margin-bottom: 15px;"><h1 style="color: black;" align="center">프리랜서 등록 완료!</h1></div>
<h3 style="color: black;" align="center">새로운 도전을 시작한 것을 축하드립니다!</h3>





</div>


<main>
<div id="allcontent" align="center">
<div style="margin-bottom: 10px;"><font size="4"><b>
협업 제의가 오면 메시지가 도착합니다.  
</b></font></div>
<div style="margin-bottom: 10px;"><font size="4"><b>
당신의 능력과 열정으로 멋진 성과를 이루길 바랍니다.
</b></font></div>

<br>
<div align="center" style="margin-top:10px; margin-bottom:20px;">
	<button class='href'><a href="/board03/main"><font color="white">목록으로</font></a></button>
</div>


<div align="center">
	 <button id="mainbutton" style="border:none;"><img src="/images/logo.png" alt="프렌즈그램 로고" class="logo-image" 
	  style="width:160px; height: 60px;"/></button>
				

</div>



</div>
</main>


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
    
    $(function(){
    	$("#mainbutton").on("click",function(){
    		location.href = "/main";
    	})
    })
    
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