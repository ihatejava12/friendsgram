<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<li><a href="#">문의사항</a></li>
			<li><a href="#">광고문의</a></li>
			<li><a href="#">홈페이지 광고편집</a></li>
			<li><a href="/adminpage/consent">기업회원 인증 관리</a></li>
			<li><a href="/adminpage/memberlist">비매너 회원 제재</a></li>
			<li><a href="/adminpage/adminlist">관리자 등급 권한 관리</a></li>
			<li><a href="/adminpage/wordlist">금지어 추가 및 관리</a></li>
		</ul>
	</div>
	<hr>
	<form action="/adminpage/newnotice">
		<input type="submit" value="새글쓰기">
	</span>
	
	<input type="button" value="삭제하기" id="delete" name="delete"/>
	<form>
	<table border="1">
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>선택</th>
		</tr>
		<c:forEach items="${nlist}" var="notice">
			<tr>
				<td>${notice.n_no}</td>
				<td><a href="content/${notice.n_no}">${notice.title}</a></td>
				<td><fmt:formatDate value="${notice.date}" dateStyle="short"/></td>
				<td>${notice.id}</td>
				<td align="center"><input type="checkbox" name="no" value="${notice.n_no}"/></td>
			</tr>
		</c:forEach>
	</table>
	

	
	<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="notice?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="notice?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="notice?p=${end+1}">[다음]</a>
				</c:if>
			</div>
	</form>
			
			
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#delete").click(function(){
				let dnums = [];
				$.each($("[name='no']:checked"), function(){
					dnums.push($(this).val())
				})
				console.log(dnums)
				
				$.ajax({url:"/notice/delete",
						data:"list="+dnums,
						method:"delete",
						dataType:"json"
				}).done(function(){
					location.reload();
				})
			})
		})
	</script>		
</body>
</html>