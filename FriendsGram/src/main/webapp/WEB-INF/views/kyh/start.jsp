<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/kyh/start.css" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div class="logo">
			<a href="/main"> <img src="images/logo.png" alt="프렌즈그램 로고"
				class="logo-image" />
			</a>
		</div>
		<nav class="navigation">
			<a href="board01/main">코딩 게시판</a>  <a href="board02/main">팀 모집</a> <a href="board03/main">프리랜서 검색</a>
			 <a	href="/list">프리랜서 공고</a> <a href="/board05">취업 공고</a>
		</nav>
		<div class="actions">
			<c:if test="${user.id != null }">
			<a class="login" href="/logout">로그아웃</a>
			</c:if>
			<c:if test="${user.id == null }">
			<a class="login" href="/loginform">로그인</a>
			</c:if>
			
			 <a class="profile" href="/myprofile">프로필</a>
			<a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
			
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
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			if(${user.role} != 3){
		    if (${user.r_consent} == 0) {  // 'user.r_consent'가 false인 경우에만
		        $("a").click(function(event){
		            // 특정 조건에 따라 예외 처리
		            if ($(this).attr('href').includes('/question') || $(this).attr('href').includes('/logout')) {
		                return;  // 이 경우 기본 동작을 허용
		            }
	 
		            // 기본 동작을 막음
		            event.preventDefault();
		        });
		    } else if (${user.id} == "") {  // user.id가 비어 있는 경우
		        $("a").click(function(event){
		            // 특정 조건에 따라 예외 처리
		            if (!$(this).attr('href').includes('/login')) {
		                event.preventDefault();  // 로그인 페이지가 아닌 경우 기본 동작을 막음
		            }
		        });
		    }}
		});
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