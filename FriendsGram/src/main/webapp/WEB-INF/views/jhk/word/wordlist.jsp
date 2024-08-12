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
		</ul>
	</div>
	<hr>
	<div>
		<input placeholder="금지할 단어를 입력하세요" name="newword" id="newword"><button name="insert" id="insert">추가</button>
	</div>
	<hr>
	<div>
		<input type="button" name="delete" id="delete" value="삭제">
		<input type="checkbox" name="allcheck" id="allcheck">전체선택
		<table border="1">
			<tr>
				<th>단어</th>
				<th>선택</th>
			</tr>
			<c:forEach items="${wlist}" var="word">
				<tr>
					<td>${word.word}</td>
					<td><input type="checkbox" name="no" id="no" value="${word.word}"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#insert").on("click", function(){
				let a = $("#newword").val();
				
				$.ajax({url:"/insertword",
						data:"word="+a,
						method:"post",
						dataType:"json"
				}).always(function(){
					location.reload();
				})
			})
			
			$("#delete").click(function(){
				let dnums = [];
				$.each($("[name='no']:checked"), function(){
					dnums.push($(this).val())
				})
				$.ajax({url:"/deleteword",
						data:"list="+dnums,
						method:"delete",
						dataType:"json"
				}).done(function(){
					location.reload();
				})
			})
			
			$("#allcheck").on("click", function(){
				if($("#allcheck").prop("checked")){
					$("[name='no']").prop("checked", true)
				} else {
					$("[name='no']").prop("checked", false)
				}
			})
		})
	</script>
	
	
</body>
</html>