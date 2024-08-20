<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>취업 공고 list</title>
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
	<div>
		<form action="board05">
			<select name="searchn">
				<option value="0"> 전체 </option>
				<option value="1"> 글번호 </option>
				<option value="2"> 제목 </option>
				<option value="3"> 작성자 </option>
				<option value="4"> 내용 검색 </option>
			</select>
			<input name="search" type="text" placeholder="글번호, 제목, 작성자, 내용 검색" size=30/> <input type="submit" value="검색"/>
		</form>
		<form>
			<input type="button" value="삭제하기" id="delete" name="delete"/>
			<table border=1 width="50%">
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>선택</th>
				</tr>
				<c:forEach var="list05dto" items="${list05}">
					<tr>
						<td>${list05dto.b_no05}</td>
						<td align="center"><a href="/adminpage/content5/${list05dto.b_no05}">${list05dto.title}</a></td>
						<td align="center">${list05dto.id}</td>
						<td align="center"><fmt:formatDate value="${list05dto.date}" dateStyle="short"/></td>
						<td align="center"><input type="checkbox" name="no" value="${list05dto.b_no05}"/></td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="board05?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="board05?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="board05?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
		</form>
	</div>
	
		
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#delete").click(function(){
				let dnums = [];
				$.each($("[name='no']:checked"), function(){
					dnums.push($(this).val())
				})
				console.log(dnums)
				
				$.ajax({url:"/adminpage/delete5",
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