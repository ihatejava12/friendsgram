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
<div style="margin-bottom:10px;"><h1 style="color: black;" align="center">프리랜서 등록 </h1></div>
<h3 style="color: black;" align="center"> 프리랜서로 등록하고 딱맞는 프로젝트/의뢰를 받아보세요.</h3>
<br>
</div>


<main>
<div id="allcontent">
<form method="post" enctype="multipart/form-data">

		<input type="hidden" name="id" value="${user.id}"/>
		<!--   로그인 완성되면, value 에 {user.id} 이런식으로 들어갈 예정 -->
		
	<div>
		<div style="margin-bottom: 7px;"><font size="3"><b>이름</b></font></div> 
		<div><input class="normal" name="name"/></div>
		<div style="margin-bottom: 7px;"><font size="3"><b>이메일</b></font></div> 
		<input class="normal" type="text" name="email"/>
		<div style="margin-bottom: 7px;"><font size="3"><b>연락처</b></font></div>
		<input class="normal" name="phone"/>
		<div style="margin-bottom: 7px;"><font size="3"><b>근무 형태</b></font></div>
			<div style="margin-bottom: 10px;">
			<label><input type="radio" name="work_type" value="0"/>원격</label>
			<label><input type="radio" name="work_type" value="1"/>상주</label>
			<label><input type="radio" name="work_type" value="2"/>모두 가능</label>
			</div>
		<div style="margin-bottom: 7px;"><font size="3"><b>사용 가능한 개발 언어</b></font></div> 
		<input class="normal2" type="text" id="skil"/> 
		<button class="button1" id="add" onclick="return false;">추가</button>
		<div id="manyskil" style="margin-bottom:20px; display:flex; flex-wrap:wrap;"></div>
		
		
		<div style="margin-bottom: 7px;"><font size="3"><b>경력</b></font></div> 
		<select name="career" style="margin-bottom:10px;">
				<option value="-1">경력 없음</option>
				<option value="0">1년 이하</option>
				<option value="1">1년</option>
				<option value="2">2년</option>
				<option value="3">3년</option>
				<option value="4">4년</option>
				<option value="5">5년</option>
				<option value="6">6년</option>
				<option value="7">7년</option>
				<option value="8">8년 이상</option>
			</select> 
			
		<div style="margin-bottom: 7px;"><font size="3"><b>프로젝트 시작 가능일</b></font></div>  
		<input class="normal" type="date" name="work_date"/>
		
		<div style="margin-bottom: 7px;"><font size="3"><b>상세 소개</b></font></div> 
		<textarea class="normal3" name="content"></textarea>
		
		
		
		<div style="margin-bottom: 7px;"><font size="3"><b>포트폴리오 및 이력서</b></font></div> 
		<input class="normal" name="file" type="file"/>
		<br>
		<button class="button1" type="submit">프리랜서 등록하기</button>
	</div>

</form>	

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
<script>

	$(function(){
		$("#add").click(function(){
			var skil = $("#skil").val();
			if(skil == ""){return false;}
			$("#manyskil").append(
			`<span class="\${skil}" style="padding: 10px 15px;
			margin-right: 10px;
			margin-bottom: 15px;
  background-color: #E0F2F1;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
			
			">
			<input style="border:none; width:90px; background-color: #E0F2F1;" name="skil" value="\${skil}" readonly/>
			<button type="button" class="delete" id="\${skil}" >X</button></span>`);
			
			$("#skil").val("");
		})

		
		 $(document).on("click", "button[class='delete']",function(){
			var id = $(this).attr("id");
			console.log(id);
			$("."+id).remove();
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