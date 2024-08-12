<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>프리랜서 검색 내부</title>
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
	<div>
		<ul>
			<li><a href="/adminpage/board01">코딩 게시판</a></li>
			<li><a href="/adminpage/board02">팀 모집</a></li>
			<li><a href="/adminpage/board03">프리랜서 검색</a></li>
			<li><a href="/adminpage/board04">프리랜서 공고</a></li>
			<li><a href="/adminpage/board05">취업 공고</a></li>
		</ul>
	</div>
	<hr>
	<table border="1">
	<tr><td>작성자</td><td>${blist3.id}</td>
	<tr><td>내용</td><td>${blist3.content}</td>
	<tr><td>경력기간</td><td>${blist3.career}</td>
	<tr><td>포토폴리오</td><td>${blist3.portfolio}</td>
	<tr><td colspan="2" align="right">
	<a href="/adminpage/board03">목록으로 이동</a>
	<span id="delete">
		<input type="button" value="삭제">
	</span>
	</table>
	<hr>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#delete").on("click", function(){
				let no = ${blist3.b_no03};
				$.ajax({url:"/delete3/"+no,
					method:"delete"
				}).done(function(){
					location.href='/adminpage/board03';
				})
			})
		})
	</script>
</body>
</html>