<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title" value="${dto.title}" readonly/></td>
			</tr>
			<tr>
				<td>작성자</td><!-- value칸에는 나중에 세션에 저장되어 있는 아이디를 불러오게 만들거임 -->
				<td><input name="id" value="${dto.id}" readonly></td>
			</tr>
			<tr>
				<td>모집 기간</td>
				<td>~ ${dto.join_date}</td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td>${dto.date}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
	        	<textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px" readonly>${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>모집상태</td>
				<c:if test="${dto.join01 == false}">
				<td>모집중</td>
				</c:if>
				<c:if test="${dto.join01 == true}">
				<td>모집완료</td>
				</c:if>
			</tr>
			<tr>
				<td>지원자수/모집자수<br>(팀장미포함)</td>
				<td>${countteam} / ${dto.volunteer}</td>
			</tr>
			<tr>
				<td>중요 코드</td>
				<td>
					<c:forEach items="${clist}" var="codelist">
						${codelist.code}, 
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="/board02/main">돌아가기</a>
					<c:if test="${user.id != null}">
						<button onclick="window.open('/reportcontent/${dto.b_no02}', '_blank', 'width=500,height=600, top=50, left=50, scrollbars=yes')">신고하기</button>
					</c:if>
					<c:if test="${dto.id == user.id}">
						<a href="/board02update/${dto.b_no02}">수정하기</a>
						<form action="/deletecontent02/${dto.b_no02}" method="post">
							<input type="hidden" name="_method" value="delete">
							<input type="submit" value="삭제하기">
						</form>
					</c:if>
				</td>
			</tr>			
			
		</table>
		<hr>
		<c:if test="${user.id != null}">
			<c:if test="${user.id != dto.id}">
				<c:if test="${cjoin == 0}">
					<input type="button" value="신청" id="jointeam">
				</c:if>
				<c:if test="${cjoin != 0}">
					<input type="button" value="신청완료">
				</c:if>
			</c:if>
			<c:if test="${dto.join01 == true}">
				<c:if test="${user.id == dto.id}">
					<button onclick="window.open('/teamlist/${dto.b_no02}', '_blank', 'width=450, height=600, top=50, left=50, scrollbars=yes')">신청자보기</button>
				</c:if>
			</c:if>
		</c:if>
		<hr>
		<c:if test="${user.id != null}">
			<input type="text" placeholder="댓글을 입려하세요." id="comm"><input type="button" id="add_comm">
		</c:if>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$(function(){
				$("#jointeam").click(function(){
					let b_no02 = ${dto.b_no02};
					let id = "${user.id}";
					
					$.ajax({url:"/jointeam",
						data:"id="+id+"&b_no02="+b_no02,
						method:"post"
					}).done(function(){
						alert("신청이 완료되었습니다!");
						location.reload();
					})
				})
				
				$("#add_comm").on('click', function(){
					let coment = $("#comm").val();
					let b_no02 = ${dto.b_no02};
				})
				
			})
		</script>
</body>
</html>