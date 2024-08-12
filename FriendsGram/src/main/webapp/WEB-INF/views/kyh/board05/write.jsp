<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Page</title>
</head>
<body>
	<h1>취업 공고 글쓰기</h1>
	<form action="/board05/write" method="post">

		<label for="id">아이디:</label> <input type="text" id="id" name="id"><br>
		<br> <label for="title">제목:</label> <input type="text" id="title"
			name="title"><br> <br> <label for="company">회사명:</label>
		<input type="text" id="company" name="company"><br> <br>
		<label for="work_type">근무 형태:</label> <input type="radio" id="onsite"
			name="work_type" value="true"> <label for="onsite">원격</label>
		<input type="radio" id="remote" name="work_type" value="false">
		<label for="remote">상주</label><br> <br> 
		
		<label for="programming_language">사용 언어:</label>
    <div id="programming_language">
        <label><input type="checkbox" name="programming_language" value="JAVA"> JAVA</label><br>
        <label><input type="checkbox" name="programming_language" value="PYTHON"> PYTHON</label><br>
        <label><input type="checkbox" name="programming_language" value="HTML"> HTML</label><br>
    </div><br><br>
		
		<label for="work_area">근무 지역:</label> <select id="work_area"
			name="work_area">
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
			<option value="강원도">강원도</option>
			<option value="충청도">충청도</option>
			<option value="전라도">전라도</option>
			<option value="경상도">경상도</option>
		</select><br> <br> <label for="salary">급여:</label> <input type="text"
			id="salary" name="salary"><br> <br> <label
			for="career_period">경력 기간:</label> <input type="text"
			id="career_period" name="career_period"><br> <br> <label
			for="background">학력:</label> <input type="text" id="background"
			name="background"><br> <br> <label for="content">내용:</label>
		<textarea id="content" name="content"></textarea>
		<br> <br> <input type="submit" value="Submit">
	</form>

</body>
</html>
