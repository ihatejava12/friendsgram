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
			<span> ${ user.name} 님의 새쪽지쓰기 입니다.</span> <br><br>
			<form action="/mail/write/newmail">
			<table class="mailwrite">
				<tr>
					<td>받는 사람</td> <td><input name="return_man" type="text" value="${freelancerid}"  readonly></td>
				</tr>
				<tr>
					<td>제목</td> <td><input name="title" type="text" value="프리랜서 협업제의" readonly></td>
				</tr>
				<tr>
					<td>내용</td> <td> <input name="content" style="width:450px; height:250px;"/></td>
				</tr>
			</table>
			<input type="hidden" name="id" value="${user.id }"/>
			<button>쪽지보내기</button>
			</form>
		</div>
	
	</div> 
</body>
</html>