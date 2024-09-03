<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FreindsGram</title>
<style>

/*
#headcontent{
background-image: url("/images/board03_image.png");
}
*/





.filter-group label {
  margin-bottom: 10px;
  font-weight: bold;
}



.filter-group select,
.filter-group input {
  padding: 5px;
  width: 150px;
  height: 35px;
  
}


.free {
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
	
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

	<div id="headcontent" style="height: 240px; padding: 30px; background-color:#E0F2F1;">
		<h1 style="color: black;" align="center">프로젝트에 알맞은</h1>
		<h1 style="color: black;" align="center">능력 있는 프리랜서를 찾아보세요</h1>
		<br>

		<form action="/board03/search" method="get"
			onsubmit="return validate();">

			<div class="search-container"
				style="display: flex; flex-wrap: nowrap; justify-content: center;">
				<div class="filter-group" style="margin: 10px;">
					<div style="margin-bottom: 10px;">
					<label for="selectwork1"><font size="3">근무 형태</font></label>
					</div>
					 <select
						id="selectwork1" class="work1" name="work_type">
						<option value="-1">전체</option>
						<option value="0">원격</option>
						<option value="1">상주</option>
					</select>
				</div>

				<div class="filter-group" style="margin: 10px;">
					<div style="margin-bottom: 10px;">
					<label for="selectskil1"><font size="3">개발 언어</font></label>
					</div>
					 <select
						id="selectskil1" class="skil1 selectskil" name="skil">
						<option value="all">전체</option>
						<option value="java">JAVA</option>
						<option value="python">PYTHON</option>
						<option value="html">HTML</option>
						<option value="database">DATABASE</option>
						<option value="other">직접 입력</option>
					</select> <input id="addskil" name="addskil" style="display: none;"
						size="10" />
				</div>

				<div class="filter-group" style="margin: 10px;">
					<div style="margin-bottom: 10px;">
					<label for="selectcareer1"><font size="3">경력 기간</font></label>
					</div>
					<select
						id="selectcareer1" class="career1" name="career">
						<option value="-2">전체</option>
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
				</div>

				<div style="margin-top:22px;">
				<button class="notnull" style="height: 30px; margin-top: 20px; margin-left:20px; padding: 2px 5px;">
				프리랜서 찾기</button>
				</div>
				
			</div>
		</form>

	</div>


	<main style="background-color:#f9f9f9;">

		<div id="content" align="center">
			<!-- 프리랜서들 정보, blist에서 하나씩 꺼내와서 출력  -->
			<!-- 총 프리랜서 수, count  -->
			<c:forEach items="${blist}" var="freelancer">


				<div id="${freelancer.b_no03 }" onclick="content(this)" class="free"
					id="${freelancer.b_no03 }"
					style="border: thin solid #e0e0e0; border-radius:10px; height: 180px; width:900px;
					padding: 20px; display: flex; background-color:white; ">


					<!--  프리랜서 정보 1개 -->
					<div style="float: left; width: 10%; margin-right: 20px;">
						<img src="/img/PTH.jpg" style="width: 50px">
					</div>
					<div style="float: left; width:370px;" align="left">
						<span> <font size="4">${freelancer.name}</font></span>
						<c:if test="${freelancer.work_type == 0}">
			<font size="2">원격 가능</font>
		</c:if>
						<c:if test="${freelancer.work_type == 1}">
			<font size="2">상주 가능</font>
		</c:if>
						<c:if test="${freelancer.work_type == 2}">
			<font size="2">원격, 상주 가능</font>
		</c:if>
						<div style="margin-top:10px; margin-bottom:10px;"> 경력 
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
						<div id="skils" style="width: 300px; height: 50px; float: left;">
							보유 개발 스킬 <br>
							<c:forEach items="${skillist }" var="skil">
								<c:if test="${skil.b_no03 == freelancer.b_no03 }">
									<button type="button">${skil.skil }</button>
								</c:if>
							</c:forEach>
						</div>

					</div>

					<div style="float: left;">
						
						<div style="width: 350px; height: 130px; border-left: 1px solid #e0e0e0;
						 background-color:white; padding-left:20px; overflow:hidden; text-overflow:ellipsis;">
							<font size="2">${freelancer.content } </font></div>
					</div>


				</div>

			</c:forEach>
		</div>


		<div id="page" align="center">
			<c:if test="${begin > pageNum }">
				<a href=#>[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end}" var="i">
				<a href="/board03/main?p=${i }">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
				<a href=#>[다음]</a>
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
		function content(free) {
			var no = free.id;
			var link = "/board03/content/" + no;
			location.href = link;
		}

		function validate() {
			let skil = $(".skil1").val();
			let work = $(".work1").val();
			let career = $(".career1").val();

			if (work == "not") {
				alert("검색 조건을 설정하세요.")
				return false;
			}
			if (skil == "not") {
				alert("검색 조건을 설정하세요.")
				return false;
			}
			if (career == "not") {
				alert("검색 조건을 설정하세요.")
				return false;
			}
		}

		$(function() {

			$(".selectskil").change(function() {
				if ($(".selectskil").val() == 'other') {
					$("#addskil").show();
				}
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