<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>신청일자</th>
			<th>지원자</th>
			<th>신청한 언어</th>
			<th>참여 여부</th>
		</tr>
		<c:forEach items="${tlist}" var="team">
			<tr>
				<td><fmt:formatDate value="${team.date}" dateStyle="short"/></td>
				<td>${team.id}</td>
				<td>${team.code}</td>
				<td>
					<input type="checkbox" name="request" value="${team.id}">
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="확정완료" id="teamcheck">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#teamcheck").on('click', function(){
				let list = [];
				$.each($("[name='request']:checked"), function(){
					list.push($(this).val())
				})
				let b_no02 = ${b_no02}
				console.log(b_no02)
				
				$.ajax({url:"/maketeam",
						data:"list="+list+"&b_no02="+b_no02,
						method:"post"
					}).done(function(){
						alert("팀 확정이 완료되었습니다! 축하드립니다!")
						self.close();
					})
			})
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>