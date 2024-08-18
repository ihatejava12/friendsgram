<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="/updateboard02" method="post">
	<input type="hidden" value="${dto.b_no02}" name="b_no02">
	<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title" value="${dto.title}"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input name="id" value="${dto.id}" readonly></td>
			</tr>
			<tr>
				<td>모집 기간</td>
				<td>~ <input type="date" name="join_date" value="${dto.join_date}"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
	        	<textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>모집상태</td>
				<td>
					<c:if test="${dto.join01 == false}">
						모집중
					</c:if>
					<c:if test="${dto.join01 == true}">
						모집 완료
					</c:if>
				</td>
			</tr>
			<tr>
				<td>지원자 수</td>
				<td><input type="number" name="volunteer" value="${dto.volunteer}"/></td>
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
					<input type="submit" value="저장하기">
				</td>
			</tr>			
			
		</table>
		</form>
</body>
</html>