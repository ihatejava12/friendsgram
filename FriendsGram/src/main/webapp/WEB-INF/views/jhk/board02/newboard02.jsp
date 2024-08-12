<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>

 .hero-image img {
    margin-top: 20px;
  }

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #fff;
  box-shadow: 0px 3px 6px rgba(18, 18, 18, 0.1);
}

.logo img {
  height: 50px; /* Adjust this value as needed */
  width: auto;
}

.navigation a {
  margin-right: 15px;
  color: #565E6C;
  font-weight: bold;
  text-decoration: none;
}

.actions a {
  margin-left: 10px;
  color: #0C9200;
  font-weight: bold;
  text-decoration: none;
}

#allcontent {
	margin: auto 15%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
	 <header class="header">
	        <div class="logo">
	            <a href="/main">
	                <img src="/img/logo.png" alt="프렌즈그램 로고" class="logo-image"/>
	            </a>
	        </div>
	        <nav class="navigation">
	            <a href="/board01/main">코딩 게시판</a>
	            <a href="/board02/main">프리랜서 검색</a>
	            <a href="#">팀 모집</a>
	            <a href="#">프리랜서 공고</a>
	            <a href="#">취업 공고</a>
	        </nav>
	        <div class="actions">
	            <a class="login" href="#">로그인</a>
	            <a class="profile" href="#">프로필</a>
	            <a class="messages" href="/mail" onclick="window.open(this.href, '_blank', 'width=780, height=480'); return false;">메시지</a>
	        </div>
	    </header>
	</div>
		
	<div id="allcontent">
			<fieldset style="width:100%;">
				<form action="/writeboard02" method="post">
				<table border="1">
					<tr>
						<td>제목</td>
						<td><input name="title"/></td>
					</tr>
					<tr>
						<td>작성자</td><!-- value칸에는 나중에 세션에 저장되어 있는 아이디를 불러오게 만들거임 -->
						<td><input name="id" value="test" readonly></td>
					</tr>
					<tr>
						<td>모집기간</td>
						<td><input type='date' id='currentDate'/> ~ <input type="date" name="join_date"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
			        	<textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px"></textarea>
						</td>
					</tr>
					<tr>
						<td>지원자 수</td>
						<td ><input type="number" name="volunteer"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<a href="/gotomain/${b_no02}">돌아가기</a>
							<button type="submit">등록하기</button>
						</td>
					</tr>	
				</table>
				</form>
				<table border="1">
					<tr>
						<td>개발 언어<input type="text" id="code" name="code"><input type="button" id="add" value="추가"></td>
						<td>
							<c:forEach items="${clist}" var="codelist">
								${codelist.code}<input type="button" id="delete" value="X">,
							</c:forEach>
						</td>
					</tr>
				</table>
			</fieldset>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	</script>
	<script>
		$(function(){
			
			$("#add").on('click', function(){
				let code = $("#code").val();
				let b_no02 = ${b_no02};
				$.ajax({url:"/insertcode",
						data:"code="+code+"&b_no02="+b_no02,
						method:"post",
						dataType:"json"
				}).always(function(){
					location.reload();
				})
			});
			
		})
	</script>
</body>
</html>