<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FriendsGram</title>

<style>

.boxtype_content {
 /* select 박스의 너비를 200px로 설정 */
    height: 39px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
  	padding-left: 6px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 6px;
}

.boxtype_content2 {
 /* select 박스의 너비를 200px로 설정 */
     /* select 박스의 높이를 35px로 설정 */
    min-height: 200px;
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
  	padding-left: 7px;
  	padding-top:9px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 6px;
    position: relative;
}

.comentcontent {
	border-radius: 5px;
    background-color: #ffffff;
    min-height: 100px;
    border-bottom: 1px solid #ddd;
  	padding-left: 9px;
  	padding-top:9px;
  	
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 6px;
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


#allcontent {
	width: 60%;
	margin: 20px auto;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 50px;
	padding-right: 50px;
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
	color:black;
}

a[class='report'] {
	text-decoration: none;
	color:red;
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



	<main>

		<div id="allcontent">
			<div id="headcontent" align="center" style="height: 80px;">
				<h2 align="center">코딩 게시판</h2>


			</div>

			<div>
				<div align="left" style="float:left;">
					<c:if test="${user.id == content.id}">
						<button class="href">
							<a href="/board01/update/${content.b_no01 }"><font color="white">수정</font></a>
						</button>

						<button id="deletearticle" class="href"><font color="white">삭제</font></button>
					</c:if>
				</div>

				<div align="right">
					<button class="href">
						<a href="/board01/main"><font color="white">목록</font></a>
					</button>
					<button class="href">
						<a href="/board01/write"><font color="white">새글 쓰기</font></a>
					</button>
				</div>
			</div>

			<!--  content 라는 이름으로 글 1개 정보 보냈음 -->
			<div class="articlehead" style="margin-bottom: 20px;">
			
			<div class="boxtype_content"> <h2>${content.title }</h2> </div>
			
				<span><b><font size="3">${content.id}</font></b></span> <span><fmt:formatDate
						value="${content.date }" type="both" dateStyle="short"
						timeStyle="default" /></span> <span>조회 : ${content.readcount }</span>
			</div>
			



			<div class="boxtype_content2">
			<div class="articlemain">
				
				<span>
					${content.content } </span>
			</div>
			
			
			</div>
			
			<div align="right">
				<button style="padding:1px;">
					<a class="report" href="/board01/report/${content.b_no01}"
						onclick="window.open(this.href, '_blank', 'width=480, height=500'); return false;">신고하기</a>
				</button>
			</div>
			
			
			<br>
			<br>

			<div class="articlecoment">
				<b>댓글</b>
				<!--  comentlist 라는 이름으로 댓글 리스트 가져옴 -->
				<c:forEach items="${comentlist }" var="coment">

					<c:if test="${coment.coment == '삭제된 댓글입니다.' }">
						<div
							style="width: 100%; height: 40px;">
							${coment.coment }</div>
					</c:if>

					<c:if test="${coment.coment != '삭제된 댓글입니다.' }">
						<div class="comentcontent">
							

							<c:if test="${coment.ref_level > 0 }">
								<!-- 지금 꺼내온 댓글이 대댓글 이라면  -->
								<div style="float: left; height: 100px; margin-right: 10px;">
									<span class="icon"> <img src="/img/level.gif"
										width="${coment.ref_level * 10}"> <img src="/img/re.gif"
										alt="답변" />
									</span>
								</div>
							</c:if>
							
							<div style="margin-bottom:10px;">
								<div>
								
								<div style="float:left;">
								<b><font size="3">${coment.id }</font></b>
									<font size="2">
									(
									<fmt:formatDate value="${coment.date }" type="both"
										dateStyle="short" timeStyle="default" />
										)
										</font>
									
									

									
								</div>
								
									<div align="right">
									<c:if test="${coment.comentlike >= 1 }">
										<span class="icon"><img src="/img/hot.gif" alt="추천댓글" /></span>
									</c:if>
									<button class="like" style="padding:1px;"><font color="blue">${coment.comentlike} 추천</font></button>
									<button style="padding:1px;">
									<a class="report" href="/board01/coment_report/${coment.c_no01}"
						onclick="window.open(this.href, '_blank', 'width=480, height=500'); return false;">신고하기</a>
									</button>
									</div>
								</div>
								<br>
								
								<div align="letf">
								 <span>${coment.coment }</span>
								 &nbsp;
								  <span><button
										class="writeAnser" id="${coment.c_no01}" style="padding:1px;">답글</button></span>
								<c:if test="${coment.id == user.id }">
									<button style="padding:1px;">
										<a
											href="/board01/coment/delete/${coment.c_no01}/${coment.b_no01}"
											style="text-decoration: none"returnfalse; >삭제</a>
									</button>
								</c:if>
								</div>
							</div>

							<div style="margin-bottom:10px;">
							<form class="${coment.c_no01} " style="display: none;"
								action="/board01/coment/write">

								<input name="id" value="${user.id }" type="hidden" />
								<input name="b_no01" value="${content.b_no01 }" type="hidden" /> 
								<input name="ref_level" value="1" type="hidden" /> 
								<input name="ref" value="${coment.ref}" type="hidden" /> 
								<input class="${coment.c_no01} " name="coment" type="text"
									style="width: 700px; height: 80px; display: none;" />
								<button class="${coment.c_no01} " style="display: none; padding:1px;">등록</button>

							</form>
							</div>
						</div>

					</c:if>
				</c:forEach>
			</div>
			<br>

			<form action="/board01/coment/write" class="newcoment">
				<div class="comentwrite" style="padding-left: 9px;">
					<input name="id" value="${user.id }" type="hidden" /> <input
						name="b_no01" value="${content.b_no01 }" type="hidden" /> <input
						name="ref_level" value="0" type="hidden" />
					<div style="margin-bottom:5px;">${user.name }</div>
					<input name="coment" type="text" style="width: 90%; height: 80px;" />
					<button style="padding:1px;">등록</button>
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
	
	
	
		$(function() {
			
			
			
			

			$(".writeAnser").on("click", function() {
				$("form[class]").hide();
				let no = $(this).attr("id");
				$("." + no).show();

			})//writeAnser click end

			$(".like")
					.on(
							"click",
							function() {
								let like = "${coment.comentlike}";
								let c_no01 = $(this)
										.closest(".comentcontent")
										.find(
												"button[class='writeAnser']:eq(0)")
										.attr("id");
								let id = "${user.id}";

								$
										.ajax(
												{
													url : "/board01/coment/like",
													data : "id=" + id
															+ "&c_no01="
															+ c_no01,
													method : "get"
												})
										.done(
												function(data) {
													if (data == '0') {
														if (confirm("이 댓글을 추천하시겠습니까?")) {
															$
																	.ajax(
																			{
																				url : "/board01/coment/likeconfirm",
																				data : "id="
																						+ id
																						+ "&c_no01="
																						+ c_no01,
																				method : "get"
																			})
																	.done(
																			function(
																					data) {
																				location
																						.reload();
																			})
														}

													} else {
														alert("이미 추천한 댓글입니다.");
													}
												});
							})

			$("#deletearticle").click(function() {
				if (confirm("삭제하시곘습니까?")) {
					location.href = "/board01/delete/${content.b_no01}"
				} else {
					return false;
				}
			})

		})
	</script>



</body>