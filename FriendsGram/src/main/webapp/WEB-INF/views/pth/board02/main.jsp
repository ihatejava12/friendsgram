<%@ page contentType="text/html; charset=UTF-8" %>
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
            <a href="#">프리랜서 검색</a>
            <a href="#">팀 모집</a>
            <a href="#">프리랜서 공고</a>
            <a href="#">취업 공고</a>
        </nav>
        <div class="actions">
            <a class="login" href="#">로그인</a>
            <a class="profile" href="#">프로필</a>
            <a class="messages" href="#">메시지</a>
        </div>
    </header>
</div>

<div id="headcontent" style="height: 200px; padding: 40px;">
<h1 style="color: black;" align="center">동료처럼 믿고 맡길 수 있는 </h1>
<h1 style="color: black;" align="center"> 우수 프리랜서를 만나보세요</h1>
<br>
<div align="center">
<select>
	<option>근무 형태</option>
	<option value="원격">원격</option>
	<option value="상주">상주</option>
</select>

<select>
	<option>개발 언어</option>
	<option value="java">JAVA</option>
	<option value="python">PYTHON</option>
	<option value="html">HTML</option>
	<option value="c">C</option>
	<option value="database">DATABASE</option>
	<option value="other">기타</option>
</select>

<select>
	<option>경력 기간</option>
	<option value="1">1년 미만</option>
	<option value="2">1년 이상</option>
	<option value="3">3년 이상</option>
	<option value="4">5년 이상</option>
</select>

<button>프리랜서 찾기</button>
</div>
</div>

<div id="content" align="center">
<!-- 프리랜서들 정보, list에서 하나씩 꺼내와서 출력  -->
	
	<div class="free" style="border:thin solid black; height:150px; padding:20px;">
		<!--  프리랜서 정보 1개 -->
		<div style="float:left; width:10%;"><img src="/img/PTH.jpg" style="width:50px"></div> 
		<div style="float:left;" align="left">박**  원격가능 <br><br>
		경력 4년 <br><br>
		<!--  보유개발언어 스킬 나열 -->
		<button>JAVA</button><button>PYTHON</button><button>HTML</button>
		</div>
		<div>
			<textarea style="width:300px; height:100px;"> 자기소개 자기소개 </textarea>
		</div>
	</div>
</div>

</body>
</html>