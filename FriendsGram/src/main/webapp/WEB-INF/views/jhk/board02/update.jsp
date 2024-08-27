<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
    margin: 20px;
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
}

#content {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

table, th, td {
  border: 1px solid #ccc;
}

th, td {
  padding: 10px;
  text-align: left;
}

th {
  background-color: #4CAF50;
  color: #fff;
  font-weight: bold;
}

input[type="text"], input[type="date"], input[type="number"], textarea {
  width: 95%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 1rem;
  background-color: #f9f9f9;
  color: #333;
  margin-bottom: 10px;
}

input[type="button"], input[type="submit"], button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  text-align: center;
}

input[type="button"]:hover, input[type="submit"]:hover, button:hover {
  background-color: #45a049;
}

.buttons-container {
  text-align: center; /* 버튼들을 가운데 정렬 */
  margin-top: 20px;
}

.buttons-container a.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border-radius: 4px;
  text-decoration: none;
  font-weight: bold;
  margin-right: 10px;
  text-align: center;
}

.buttons-container a.button:hover {
  background-color: #45a049;
}

</style>
</head>
<body>
<div id="content">
<form action="/updateboard02" method="post">
	<input type="hidden" value="${dto.b_no02}" name="b_no02">
	<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title" value="${dto.title}"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="hidden" name="id" value="${dto.id}">${dto.id}</td>
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
				<td><input type="number" name="volunteer" value="${dto.volunteer}" min="1" /></td>
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
				<td colspan="2" class="buttons-container">
					<a href="/board02/main" class="button">돌아가기</a>
					<input type="submit" value="저장하기">
				</td>
			</tr>			
			
		</table>
		</form>
</div>
</body>
</html>
