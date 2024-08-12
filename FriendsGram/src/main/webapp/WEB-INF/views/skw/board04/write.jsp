<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
</head>
<body>
	<form action="write" method="post" id="writeForm">
	<label for="id">아이디:</label> <input type="text" id="id" name="id"><br>
	<label for="title">제목:</label> <input type="text" id="title" name="title"><br>
	<label for="content">내용:</label>
		<textarea id="content" name="content"></textarea>
	<label for="join_date">모집기간:</label> <input type="text" id="join_date" name="join_date"><br>
	 <tr><td>모집상태 : <input type="radio" name="join2" value="0" checked>모집중
					<input type="radio" name="join2" value="1">모집완</td></tr>
	<tr><td>근무 형태</td><td><select name="work_type" id="work_type">
      				<option value=1>내</option>
      				<option value=2>외</option>
      				</select></td></tr>
      <label for="volunteer">모집자 수:</label> <input type="text" id="volunteer" name="volunteer"><br>	
      	<label for="salary">급여:</label> <input type="text" id="salary" name="salary"><br>
      		<label for="employment_date">기간:</label> <input type="text" id="employment_date" name="employment_date"><br>
      	<label for="employment_start">시작일:</label> <input type="text" id="employment_start" name="employment_start"><br>
      	<label for="career_period">경력기간:</label> <input type="text" id="career_period" name="career_period"><br>	

	
	
	<input type="submit" value="입력">
	</form>
</body>
</html>