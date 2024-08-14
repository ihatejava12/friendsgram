<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FreindsGram</title>
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

#headcontent{
	background-color: lightgreen;
}

#content{
	align: center;
	margin: auto 15%;
}

.free{
	margin: 20px;
}

</style>
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
            <a href="/board03/main">프리랜서 검색</a>
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

<div id="headcontent" style="height: 200px; padding: 40px;">
<h1 style="color: black;" align="center">동료처럼 믿고 맡길 수 있는 </h1>
<h1 style="color: black;" align="center"> 우수 프리랜서를 만나보세요</h1>
<br>
<div align="center">
<form action="/board03/search">
<select name="work_type">
	<option>근무 형태</option>
	<option value="-1" ${work_type == -1?"selected":""}>전체</option>
	<option value="0" ${work_type == 0?"selected":""}>원격</option>
	<option value="1" ${work_type == 1?"selected":""}>상주</option>
</select>

<select name="skil">
	<option>개발 언어</option>
	<option value="all" ${skil == 'all'?"selected":""}>전체</option>
	<option value="java" ${skil == 'java'?"selected":""}>JAVA</option>
	<option value="python" ${skil == 'python'?"selected":""}>PYTHON</option>
	<option value="html" ${skil == 'html'?"selected":""}>HTML</option>
	<option value="c" ${skil == 'c'?"selected":""}>C</option>
	<option value="database" ${skil == 'database'?"selected":""}>DATABASE</option>
	<option value="other" ${skil == 'other'?"selected":""}>기타</option>
</select>

<select name="career">
	<option>경력 기간</option>
	<option value="-2" ${career == -2?"selected":""}>전체</option>
	<option value="-1" ${career == -1?"selected":""}>경력 없음</option>
	<option value="0" ${career == 0?"selected":""}>1년 이하</option>
	<option value="1" ${career == 1?"selected":""}>1년</option>
	<option value="2" ${career == 2?"selected":""}>2년</option>
	<option value="3" ${career == 3?"selected":""}>3년</option>
	<option value="4" ${career == 4?"selected":""}>4년</option>
	<option value="5" ${career == 5?"selected":""}>5년</option>
	<option value="6" ${career == 6?"selected":""}>6년</option>
	<option value="7" ${career == 7?"selected":""}>7년</option>
	<option value="8" ${career == 8?"selected":""}>8년 이상</option>
</select>

<button>프리랜서 찾기</button>
</form>
</div>
</div>

<div id="content" align="center">
<!-- 프리랜서들 정보, blist에서 하나씩 꺼내와서 출력  -->
<!-- 총 프리랜서 수, count  -->
	<c:forEach items="${blist}" var="freelancer">
	
	
	<div id="${freelancer.b_no03 }" onclick="content(this)" class="free" id="${freelancer.b_no03 }" style="border:thin solid black; height:150px; padding:20px;">
		
		
		<!--  프리랜서 정보 1개 -->
		<div style="float:left; width:10%;"><img src="/img/PTH.jpg" style="width:50px"></div> 
		<div style="float:left;" align="left"><span> ${freelancer.name}</span> 
		<c:if test="${freelancer.work_type == 0}">
			원격 가능
		</c:if>
		<c:if test="${freelancer.work_type == 1}">
			상주 가능
		</c:if>
		<c:if test="${freelancer.work_type == 2}">
			원격,상주 가능
		</c:if>
		 <br><br>
		 경력 
		<c:if test="${freelancer.career == -1 }">
		없음
		</c:if> 
		<c:if test="${freelancer.career == 0 }">
		1년 이하
		</c:if>
		<c:if test="${freelancer.career == 1 }">
		1년
		</c:if>
		<c:if test="${freelancer.career == 2 }">
		2년
		</c:if>
		<c:if test="${freelancer.career == 3 }">
		3년
		</c:if>
		<c:if test="${freelancer.career == 4 }">
		4년
		</c:if>
		<c:if test="${freelancer.career == 5 }">
		5년
		</c:if>
		<c:if test="${freelancer.career == 6 }">
		6년
		</c:if>
		<c:if test="${freelancer.career == 7 }">
		7년
		</c:if>
		<c:if test="${freelancer.career == 8 }">
		8년 이상
		</c:if>
		
		
		<br><br>
		
		<!--  보유개발언어 스킬 나열 -->
		<!--  skillist 라는 이름으로 모든 Board03_SkilDto 객체 list 가져왔음 -->
		<div id="skils">
			보유 개발 스킬 <br>
			<c:forEach items="${skillist }" var="skil">
				<c:if test="${skil.b_no03 == freelancer.b_no03 }">
					<button type="button">${skil.skil }</button>
				</c:if>
			</c:forEach>
		</div>
		
		</div>
		
		<div>
			자기소개<br>
			<textarea style="width:300px; height:100px;" readOnly> ${freelancer.content } </textarea>
		</div>
		
	
	</div>
	
	</c:forEach>
</div>


<div id="page" align="center">
				<c:if test="${begin > pageNum }">
					<a href=#>[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="/board03/main?p=${i }">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href=#>[다음]</a>
				</c:if>
			</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
function content(free){
	var no = free.id;
	var link = "/board03/content/"+no;
	location.href = link;
}

</script>



</body>
</html>