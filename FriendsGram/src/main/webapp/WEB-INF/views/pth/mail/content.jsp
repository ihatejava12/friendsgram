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
			<span>${user.name} 님의 쪽지보기입니다.</span> <br><br>
			<!--  onemail 라는 이름으로 mail 1개 정보 가져옴 -->
			
			<table>
				<tr><td>${onemail.id }</td><td><fmt:formatDate value="${onemail.date }" type="both" 
				dateStyle="default" timeStyle="short"/></td></tr>
				<tr><td>제목</td><td>${onemail.title }</td></tr>
				<tr><td>내용</td><td><div style="overflow:auto;">${onemail.content }</div></td></tr>
			</table>
			
			<button class="maildelete" id="${onemail.m_no }">삭제</button>
		</div>
	
	</div> 
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$(".maildelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					let no = $(this).attr("id");
					$.ajax({
						url:"/mail/delete/"+no,
						method:"get"
					})
				}else{return false;}
			})
		})
	
	</script>
	
	
</body>
</html>