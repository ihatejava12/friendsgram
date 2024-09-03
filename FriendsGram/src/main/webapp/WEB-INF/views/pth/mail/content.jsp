<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>



<style>

div[class='normal5'] {
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
    float:left;
}


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
	position:relative;
	background-color: #ffffff;
 	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  	border-radius: 8px;
	padding: 10px;
}

#allcontent {
  
  margin: 10px auto;
  padding-right: 20px;
  padding-left: 20px;
  padding-top: 10px;
  padding-bottom: 10px;
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

a[class="answer"]{
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
    margin-bottom: 4px;
}

textarea[class='normal3'] {
width: 70%; /* select 박스의 너비를 200px로 설정 */
    height: 170px; /* select 박스의 높이를 35px로 설정 */
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
				<li><a class="main" href="/mail">받은 쪽지함</a><font class="numbermail" size="2"></font></li>
				<li><a class="main" href="/mail/sendlist">보낸 쪽지함</a></li>
			</ul>
		</div>
		
		<div class="mailright">
			
			<!--  onemail 라는 이름으로 mail 1개 정보 가져옴 -->
			

			<div id="allcontent">
			
			<!--  return_man     title     content -->
			<div style="margin-bottom: 7px;">
			
			<c:if test="${onemail.return_man == user.id }">
			<div style="float:left; width: 80px;"><font size="3"><b>보낸 사람</b></font></div>		
			<input class="normal" name="return_man" value="${onemail.id }" readonly/>
			</c:if>
			<c:if test="${onemail.id == user.id }">
			<div style="float:left; width: 80px;"><font size="3"><b>받는 사람</b></font></div>		
			<input class="normal" name="return_man" value="${onemail.return_man }" readonly/>
			</c:if>
			
			</div>
			
			<div style="margin-bottom: 7px;">
			<div style="float:left; width: 80px;"><font size="3"><b>날짜</b></font></div>
			<div class="normal5"><fmt:formatDate value="${onemail.date }" type="both" 
				dateStyle="default" timeStyle="short"/></div>
			</div>
			
			<div style="margin-bottom: 7px;">
			<div style="float:left; width: 80px;"><font size="3"><b>제목</b></font></div>
			<input class="normal" name="title" value="${onemail.title }" readonly/>
			</div>
			
			<div style="margin-bottom: 7px;">
			<div style="float:left; width: 80px;"><font size="3"><b>내용</b></font></div>
			<textarea class="normal3" name="content" readonly>${onemail.content }</textarea>
			</div> 
			
			
			
		</div>
			<c:if test="${onemail.return_man == user.id }">
				<div align="center" style="position:absolute; bottom:20px; left:40%;"><button class="answer">
				<a class="answer" href="/mail/writeAnwser/${onemail.id}">답장</a></button></div>
			</c:if>
			<div align="center" style="position:absolute; bottom:20px; left:50%;"><button class="maildelete" id="${onemail.m_no }">삭제</button></div>
		</div>
	
	</div> 
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		
	
	
	
	
		$(function(){
			$(".maildelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					let no = $(this).attr("id");
					$.ajax({
						url:"/mail/delete/"+no,
						method:"get"
					})
				}else{return false;}
			})
		})
		
		$(function(){
		var id = '${user.id}';
		if(id != null){
			$.ajax({
				url:"/mail/numberofmail",
				data: "id="+id,
				method:"post",
				datatype:"text"
			}).done(function(data){
				// 안읽은 메일의 개수 를 String으로 받아온걸 data 에 저장함
				if(data != '0'){
					$(".numbermail").text("( "+data+" )");
				}
			})
		}
	})
	
	</script>
	
	
</body>
</html>