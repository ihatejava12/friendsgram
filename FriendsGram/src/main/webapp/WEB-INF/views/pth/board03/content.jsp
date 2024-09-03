<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FreindsGram</title>
<style>

#workwith {
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

#headcontent {
	background-color: lightgreen;
}

#content {
	align: center;
	margin: auto 15%;
}

.free {
	margin: 20px;
}


a {
	text-decoration: none;
	color:black;
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

button[class='info'] {
background-color: #f0f0f0; /* 버튼 스타일 추가 */
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 5px 10px;
	margin-right: 5px;
	margin-bottom: 5px;
	cursor: pointer;
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

	<div id="headcontent" style="height: 200px; padding: 40px; background-color:#E0F2F1;">
		<h1 style="color: black;" align="center">프로젝트에 알맞은</h1>
		<h1 style="color: black;" align="center">능력 있는 프리랜서를 찾아보세요</h1>
		<br>

	</div>


	<main style="background-color:#f9f9f9;">
		<!--  freelancer 라는 이름으로 Board03Dto 객체 하나 받아옴 -->
		<div class="articlemain"
			style="margin-left: auto; margin-right: auto; width: 1100px; ">

			<div class="main"
				style="float: left; margin: 20px; width: 600px; border: thin solid #e0e0e0; padding:20px;
				border-radius:10px; background-color:white;">

				<div class="introduce" style="margin: 15px;">
					<h3><span><font size="4">${freelancer.name }</font></span></h3>
					</div>
					
					<div style="margin: 15px;">
					
					<c:if test="${freelancer.work_type == 0}">
			원격 가능
		</c:if>
					<c:if test="${freelancer.work_type == 1}">
			상주 가능
		</c:if>
					<c:if test="${freelancer.work_type == 2}">
			원격,상주 가능
		</c:if>
		
					</div>
					<div style="margin-left: 15px; margin-bottom:30px;">
		
					 경력
					<c:if test="${freelancer.career == -1 }">
		없음
		</c:if>
					<c:if test="${freelancer.career == 0 }">
		1년 이하
		</c:if>
					<c:if test="${freelancer.career == 1 }">
		1년
		</c:if>
					<c:if test="${freelancer.career == 2 }">
		2년
		</c:if>
					<c:if test="${freelancer.career == 3 }">
		3년
		</c:if>
					<c:if test="${freelancer.career == 4 }">
		4년
		</c:if>
					<c:if test="${freelancer.career == 5 }">
		5년
		</c:if>
					<c:if test="${freelancer.career == 6 }">
		6년
		</c:if>
					<c:if test="${freelancer.career == 7 }">
		7년
		</c:if>
					<c:if test="${freelancer.career == 8 }">
		8년 이상
		</c:if>
		
		
		
		
				</div>


				<!--  보유개발언어 스킬 나열 -->
				<!--  skillist 라는 이름으로 모든 Board03_SkilDto 객체 list 가져왔음 -->
				<div id="skils" style="margin: 15px;">
					<font size="3"><b>보유 개발 스킬</b></font> <br><br>
					<c:forEach items="${skillist }" var="skil">
						<c:if test="${skil.b_no03 == freelancer.b_no03 }">
							<button type="button">${skil.skil }</button>
						</c:if>
					</c:forEach>
				</div>
				<br>

				<div style="margin: 15px;">
					<font size="3"><b> 프로젝트 시작 가능일 : 
					<fmt:formatDate value="${freelancer.work_date }"
						pattern="yyyy-MM-dd" /></b></font>
				</div>

				<br>
				<div style="margin: 15px;">
					<font size="3"><b>상세소개</b></font>
					<p>${freelancer.content}</p>
				</div>

				<br>

				<div style="margin: 15px;">
					<div style="margin-bottom:10px;">
					<font size="3"><b>포트폴리오 및 이력서</b></font>
					</div>


					<div id="${freelancer.portfolio }" 
						style="width:150px; height:80px; background-image: url(${freelancer.portfolio});
			background-size: cover;
			background-position:center; margin-bottom:4px;">
					</div>
					<c:if test="${freelancer.portfolio != '' }">
						<button class="info"><a
							href="/board03/portfolio/download?path=${freelancer.portfolio }">포트폴리오
							다운로드</a></button>
					</c:if>
	
				</div>
		
				<div style="margin:15px;">
				<c:if test="${user.role != -1 }">
						<div>
							<button class="info"><a href="/infock/${freelancer.id}">이력서 보기</a></button>
						</div>
				</c:if>
				</div>

			</div>

			<c:if test="${user.role == 3 }">
			<div class="sub" style="float: left; margin: 15px; width: 400px; height: 300px; padding: 30px;
			border: thin solid #e0e0e0; border-radius:10px; background-color:white;">
				<font size="4"><b>이 프리랜서와 함께 일하고 싶다면!</b></font><br>
				<div style="margin-top:20px; margin-bottom:40px;">
					메시지를 통해 협업 의사를 전달해보세요.<br><br>
				</div>
				<button id="workwith" style="width:300px; height:40px;" class="/mail/writeTofreelancer/${freelancer.id}"
				onclick="buttonclick()">
					협업 제의하기</a>
				</button>
			</div>
			</c:if>	
			
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
		function portfolio(path) {
			var path = path.id;
			var link = "/board03/portfolio?path=" + path;
			window.open(link, "_blank", "width=1000, height= 800");
		}
		
		
		function buttonclick(){
			var url = $("button[class]").attr("class");
			window.open(url, '_blank', 'width=780, height=480,left=600,top=200')
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