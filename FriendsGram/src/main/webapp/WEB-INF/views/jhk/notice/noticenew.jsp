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
			<li><a href="/adminpage/reportlist">신고 상황</a></li>
		</ul>
	</div>
	<hr>
	
	
	<form method="post" action="/insertnotice">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title"/></td>
			</tr>
			<tr>
				<td>작성자</td><!-- value칸에는 나중에 세션에 저장되어 있는 아이디를 불러오게 만들거임 -->
				<td><input name="id" value="admin" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
	        	<textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="save" value="새글 등록"> 
				</td>
			</tr>
		</table>
	</form>


</body>
</html>