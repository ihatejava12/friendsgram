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
	<table border="1">
		<tr><td>아이디</td><td>${memlist.id}</td>
		<tr><td>이름</td><td>${memlist.name}</td>
		<tr><td>이메일</td><td>${memlist.email}</td>
		<tr><td>전화번호</td><td>${memlist.phone}</td>
		<tr><td>제재횟수</td><td>
								<input type="number" min="0" value="${memlist.sanction}" name="reportn" id="reportn">
						   </td>
		<tr><td>제재여부</td><td>
								<select name="searchn" id="searchn">
									<option value="0">사용 불가</option>
									<option value="1">사용 가능</option>
								</select>
							  </td>
		<tr><td colspan="2" align="right">
		<a href="/adminpage/memberlist">목록으로 이동</a>
		<span>
			<input type="button" name="update" id="update" value="등록">
		</span>
	</table>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#update").on('click', function(){
				let id = '${memlist.id}';
				let searchn = $("#searchn").val();
				let reportn = $("#reportn").val();
				$.ajax({url:"/updateReport",
						data:"searchn="+searchn+"&reportn="+reportn+"&id="+id,
						method:"post",
						dataType:"json"
				}).always(function(){
					location.href='/adminpage/memberlist';
				})				
			})
		})
	
	
	</script>
</body>
</html>