<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/kyh/main.css" rel="stylesheet">
<title>프렌즈그램</title>
</head>
<body>
	<header class="header">
      <div class="logo">
         <a href="/main"> <img src="../images/logo.png" alt="프렌즈그램 로고"
            class="logo-image" />
         </a>
      </div>
      <nav class="navigation">
         <a href="board01/main">코딩 게시판</a> <a href="board02/main">팀 모집</a> <a
            href="board03/main">프리랜서 검색</a> <a href="/list">프리랜서 공고</a> <a
            href="/board05">취업 공고</a>
      </nav>
      <div class="actions">
         <c:if test="${user.id != null }">
            <a class="login" href="/logout">로그아웃</a>
            <c:choose>
                    <c:when test="${user.role != 3}">
                        <a class="profile" href="/myprofile">프로필</a>
                     </c:when>
                     <c:when test="${user.role == 3}">
                         <a class="corporationprofile" href="/corporationprofile">기업 페이지</a>
                     </c:when>
              </c:choose>
         </c:if>
         <c:if test="${user.id == null }">
            <a class="login" href="/loginform">로그인</a>
         </c:if>

         <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
      </div>
   </header>

	<main class="main-content">
		<section class="hero-section">
		  <div class="hero-text">
		    <h1>원하는 프리랜서를 찾아보세요!</h1>
		    <button class="cta-button"><a href="board03/main">프리랜서 찾아보기</a></button>
		  </div>
		  <div class="hero-image">
		    <img src="images/hero.png" alt="프리랜서 이미지">
		  </div>
		</section>

		<section class="notice-section">
			<div class="notices">
				<h2 class="noticeshead"><a href="/noticemain">공지사항</a></h2>
				<div class="notice-list">
					<c:forEach var="notice" items="${notices}">
						<div class="notice-item">
							<h3 class="notice-content"><a href="/noticecontent/${notice.n_no}" class="notice-title">${notice.title}</a> </h3>
								<p class="notice-date"><fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd" /></p>
							

						</div>
					</c:forEach>
				</div>
			</div>

			<div class="board04-posts">
				<h2 class="board04_head"><a href="/list">프리랜서 공고</a></h2>
				<div class="board04-list">
                <c:forEach var="b04" items="${b04}">
                    <div class="board04-item">
                        <div class="b04_header">
                            <h3 class="board04_title"><a href="board04/content/${b04.b_no04}">${b04.title}</a></h3>
                        </div>
                        <div class="b04_details">
                            <p>예상 금액: ${b04.salary}</p>
                            <p>시작 예정일: ${b04.employment_start}</p>
                            <p>예상 기간: ${b04.employment_date}</p>
                            <p>상주, 원격: ${b04.work_type ? "상주" : "원격"}</p>
                            <p>사용 언어: 5</p>
                            <p>${b04.join02 ? "모집중" : "모집완료"}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
			</div>
		</section>
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
		            } else {
		            	alert("제재된 회원입니다");
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
