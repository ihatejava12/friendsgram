<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<tr><td>아이디</td><td>${clist.id}</td>
		<tr><td>이름</td><td>${clist.name}</td>
		<tr><td>회사명</td><td>${clist.company}</td>
		<tr><td>사업자 등록번호</td><td>${clist.business_number}</td>
		<tr><td>대표자명</td><td>${clist.boss_name}</td>
		<tr><td>회사 주소</td><td>${clist.address}</td>
		<tr><td>전화번호</td><td>${clist.company_number}</td>
		<tr><td>기업인증여부</td><td>
								<select name="searchn" id="searchn">
									<option value="0">확인중</option>
									<option value="1">등록완료</option>
									<option value="2">등록거절</option>
								</select>
							  </td>
		<tr><td colspan="2" align="right">
		<a href="/adminpage/consent">목록으로 이동</a>
		<span>
			<input type="button" name="update" id="update" value="등록">
		</span>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#update").on('click', function(){
				let id = '${clist.id}';
				let searchn = $("#searchn").val();
				$.ajax({url:"/updateconsent",
						data:"searchn="+searchn+"&id="+id,
						method:"post",
						dataType:"json"
				}).always(function(){
					location.href='/adminpage/consent';
				})				
			})
		})
	
	
	</script>
	
	
	
</body>
</html>