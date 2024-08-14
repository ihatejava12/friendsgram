<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="mailmain" style="width:750px; height:450px; border:1px solid black;">
		<div class="mailleft" style="border:1px dashed lightgreen; float:left; width:23%; height:98%;
		 margin: 5px;">
			<h3>쪽지함</h3>
			<ul>
				<li><a href="/mail/write">쪽지 보내기</a></li>
				<li><a href="/mail">받은 쪽지함</a></li>
				<li><a href="/mail/sendlist">보낸 쪽지함</a></li>
			</ul>
		</div>
		
		<div class="mailright" style="border:1px dashed lightgreen; width:98%; height:98%; margin: 5px;">
			<span>${user.name } 님의 보낸 편지함입니다.</span> <br><br>
			<button>삭제</button> <br><hr>
			
			<table class="maillist">
				<tr><th>선택</th><th>제목</th><th>보낸사람</th><th>날짜</th></tr>
				<!--  maillist 라는 이름으로 메일 list 가져옴 -->
				<c:forEach items="${maillist }" var="mail">
					<tr> 
					<td><input type="checkbox"/></td><td><a href="/mail/content/${mail.m_no }">${mail.title }</a></td><td>${mail.id }</td>
					<td><fmt:formatDate value="${ mail.date}" type="both" dateStyle="short" timeStyle="short"/></td> 
					</tr> 
				</c:forEach>
				
			</table>
			
				<div id="page" align="center">
				<c:if test="${begin > pageNum }">
					<a href="/mail?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="/mail?p=${i}">${i}</a>
				
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="/mail?p=${end+1}">[다음]</a>
				</c:if>
			</div>
			
		</div>
	
	</div> 
</body>
</html>