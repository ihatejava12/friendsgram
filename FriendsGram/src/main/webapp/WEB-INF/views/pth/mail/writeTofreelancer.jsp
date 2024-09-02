<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>


.mailmain {
	width:750px; 
	height:450px; 
	
	background-color: #ffffff;
 	 box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
 	 border-radius: 8px;
 	 padding: 5px;
}

.mailleft {
	border:2px solid lightgreen; 
	float:left; 
	width: 23%;
	height:94%;
	margin-right: 14px;
	background-color: #ffffff;
 	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  	border-radius: 8px;
  	padding: 10px;
}

.mailright {
	float: left;
	border:2px solid lightgreen; 
	width: 68%;
	height:94%; 
	
	background-color: #ffffff;
 	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  	border-radius: 8px;
	padding: 10px;
}

#allcontent {
  
  margin: 10px auto;
  padding: 20px;
  position: relative;
  height: 70%;
}

a[class='main']{
	text-decoration: none;
	color:black;
}

a[class='title']{
	text-decoration: none;
	color:gray;
}

a[class="title"]:link{
	text-decoration: none;
	color:blue;
}

a[class="page"]{
	text-decoration: none;
	color:black;
}



li {
	margin-bottom:7px;
}


#page {
	position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    text-align: center; /* 페이징을 가운데 정렬 */
    
}

input[class='normal'] {
width: 70%; /* select 박스의 너비를 200px로 설정 */
    height: 20px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 10px;
}

textarea[class='normal3'] {
width: 70%; /* select 박스의 너비를 200px로 설정 */
    height: 190px; /* select 박스의 높이를 35px로 설정 */
    border-radius: 5px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 5px 10px;
    color: black;
    font-size: 14px;
    font-family: Arial, sans-serif;
    margin-bottom: 10px;
    resize:none;
}





</style>


</head>
<body>
	<div class="mailmain">
		<div class="mailleft">
			<div style="padding-left:18px; margin-bottom: 20px;"><h3>쪽지함</h3></div>
			<ul>
				<li><a class="main" href="/mail/write">쪽지 보내기</a></li>
				<li><a class="main" href="/mail">받은 쪽지함</a></li>
				<li><a class="main" href="/mail/sendlist">보낸 쪽지함</a></li>
			</ul>
		</div>
		
		<div class="mailright">
			<div style="margin-bottom: 1px; padding-left:20px; padding-top:10px;">${user.name} 님의 새 쪽지 쓰기입니다.</div>
		
		<div id="allcontent">
			<form action="/mail/write/newmail">
			<!--  return_man     title     content -->
			<div style="margin-bottom: 7px;">
			<div style="float:left; width: 80px;"><font size="3"><b>받는 사람</b></font></div>
			<input class="normal" name="return_man" value=${freelancerid } readonly/>
			</div>
			
			<div style="margin-bottom: 7px;">
			<div style="float:left; width: 80px;"><font size="3"><b>제목</b></font></div>
			<input class="normal" name="title" value="프리랜서 협업 제의" readonly/>
			</div>
			
			<div style="margin-bottom: 7px;">
			<div style="float:left; width: 80px;"><font size="3"><b>내용</b></font></div>
			<textarea class="normal3" name="content" required></textarea>
			</div> 
			
			<input type="hidden" name="id" value="${user.id }"/>
			<div align="center"><button>쪽지보내기</button></div>
			</form>
		</div>
		</div>
	
	</div> 
</body>
</html>