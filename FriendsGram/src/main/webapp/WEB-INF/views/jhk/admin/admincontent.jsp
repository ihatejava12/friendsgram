<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<li><a href="/adminpage/board01">게시판 관리</a></li>
			<li><a href="/adminpage/notice">공지사항</a></li>
			<li><a href="/adminpage/questionlist">문의사항</a></li>
			<li><a href="/adminpage/advertisinglist">광고문의</a></li>
			<li><a href="#">홈페이지 광고편집</a></li>
			<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
			<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
			<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
			<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
		</ul>
	</div>
	<hr>
	<form action="/updaterating">
	<table border="1">
		<tr><td>아이디</td><td>${aclist.id}<input type="hidden" value="${aclist.id}" name="id" ></td>
		<tr><td>이메일</td><td>${aclist.email}</td>
		<tr><td>전화번호</td><td>${aclist.phone}</td>
		<tr><td>제재여부</td><td>
								<select name="role" id="role">
									<option value="0">일반 회원</option>
									<option value="1">중간 관리자</option>
								</select>
							  </td>
		<tr><td colspan="2" align="right">
		<a href="/adminpage/adminlist">목록으로 이동</a>
			<input type="submit" name="update" id="update">
		</td>
		
	</table>
	</form>
</body>
</html>