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
<h1 style="color: black;" align="center">프리랜서 등록 </h1>
<h3 style="color: black;" align="center"> 프리랜서로 등록하고 딱맞는 프로젝트/의뢰를 받아보세요.</h3>
<br>
</div>
<form method="post">

		<input type="hidden" name="id" value="pth"/>
		<!--   로그인 완성되면, value 에 {user.id} 이런식으로 들어갈 예정 -->
		
	<div align="center">
		이름 : <input name="name"/><br>
		이메일 : <input type="text" name="email"/><br>
		연락처 : <input name="phone"/><br>
		근무형태 : 
			<label><input type="radio" name="work_type" value="0"/>원격</label>
			<label><input type="radio" name="work_type" value="1"/>상주</label>
			<label><input type="radio" name="work_type" value="2"/>모두 가능</label>
			<br>
		사용 가능한 개발 언어 <input type="text" id="skil"/> <button class="add" onclick="return false;">추가</button>
		<div id="manyskil"></div><br>
		<br>
		
		경력: <select name="career">
				<option value="-1">경력 없음</option>
				<option value="0">1년 이하</option>
				<option value="1">1년</option>
				<option value="2">2년</option>
				<option value="3">3년</option>
				<option value="4">4년</option>
				<option value="5">5년</option>
				<option value="6">6년</option>
				<option value="7">7년</option>
				<option value="8">8년 이상</option>
			</select> <br>
		프로젝트 시작 가능일 : <input type="date" name="work_date"/>
		<br>
		자기소개: <textarea name="content"></textarea><br>
		
		포트폴리오 <br>
		<textarea name="portfolio"></textarea>
		<br>
		<button type="submit">프리랜서 등록하기</button>
	</div>

</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		$(".add").click(function(){
			var skil = $("#skil").val();
			if(skil == ""){return false;}
			$("#manyskil").append(`<span class="\${skil}" style="border: 1px solid black; margin: 2px;"><input name="skil" value="\${skil}"/>
			<button type="button" class="delete" id="\${skil}" >X</button></span>`);
			$("#skil").val("");
		})

		
		 $(document).on("click", "button[class='delete']",function(){
			var id = $(this).attr("id");
			console.log(id);
			$("."+id).remove();
		})
	})
</script>

</body>
</html>