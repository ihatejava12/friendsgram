<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/kyh/cslist.css" rel="stylesheet">
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
		<form action="/question" method="get">
		    <input type="text" name="search" value="${search}" placeholder="검색어를 입력하세요">
		    <button type="submit">검색</button>
		</form>
		<button>
			<a href="/question/write">문의하기</a>
		</button>
			
		<div>
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>문의번호</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>답변여부</th>
				</tr>
				<c:forEach var="qlist" items="${qlist }">
			        <tr>
			            <td>${qlist.q_no }</td>
			            <td>
						    <c:if test="${qlist.question_type == 0}">계정관련 문의</c:if>
						    <c:if test="${qlist.question_type == 1}">법적 문의</c:if>
						    <c:if test="${qlist.question_type == 2}">기타 문의</c:if>
						</td>
			            <td><a href="/question/${qlist.q_no}">${qlist.title }</a></td>
			            <td><fmt:formatDate value="${qlist.date }" pattern="yyyy-MM-dd" /></td>
			            <td>${qlist.id }</td>
			            <td>
						    <c:if test="${qlist.request == true}">답변완료</c:if>
						    <c:if test="${qlist.request == false}">접수완료</c:if>
						</td>
			        </tr>
		    	</c:forEach>
			</table>
				<div id="page">
    <c:if test="${begin > 1}">
        <a href="question?p=${begin-1}">[이전]</a>
    </c:if>
    <c:forEach begin="${begin}" end="${end}" var="i">
        <a href="question?p=${i}" class="${i == param.p ? 'current-page' : ''}">${i}</a>
    </c:forEach>
    <c:if test="${end < totalPages}">
        <a href="question?p=${end+1}">[다음]</a>
    </c:if>
</div>
				</c:if>
				
				<c:if test="${count == 0 }">
					아직 입력한 글이 없습니다.
				</c:if>

			</div>
			<br><br>
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
      
     </script>
</body>
</html>