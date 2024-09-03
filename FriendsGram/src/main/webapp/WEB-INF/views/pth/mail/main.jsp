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

th[class='choice'],td[class='choice'] {
	width: 10%;
	text-align:center;
}
th[class='title'],td[class='title'] {
	width: 30%;
}
th[class='send'],td[class='send'] {
	width: 20%;
	text-align:center;
}
th[class='date'],td[class='date'] {
	width: 40%;
	text-align:center;
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




</style>


</head>
<body>
	<div class="mailmain">
		<div class="mailleft" >
			<div style="padding-left:18px; margin-bottom: 20px;"><h3>쪽지함</h3></div>
			<ul>
				<li><a class="main" href="/mail/write">쪽지 보내기</a></li>
				<li><a class="main" href="/mail">받은 쪽지함</a><font class="numbermail" size="2"></font></li>
				<li><a class="main" href="/mail/sendlist">보낸 쪽지함</a></li>
			</ul>
		</div>
		
		<div class="mailright">
			<div style="margin-bottom: 1px; padding-left:20px; padding-top:10px;">${user.name} 님의 받은 편지함입니다.</div> 
			
			<div id="allcontent">
			<c:if test="${comentcount == 0 }">
				받은 쪽지가 없습니다.
			</c:if>
			<c:if test="${comentcount != 0 }">
			<button>삭제</button> <br><hr>
			
			<table class="maillist" style="width:100%; border-spacing: 0px 10px;">
				<tr><th class="choice">선택</th><th class="title">제목</th><th class="send">보낸사람</th><th class="date">날짜</th></tr>
				<!--  maillist 라는 이름으로 메일 list 가져옴 -->
				<c:forEach items="${maillist }" var="mail">
					<tr> 
					<td class="choice"><input type="checkbox"/></td>
					<td class="title"><a class="title" href="/mail/content/${mail.m_no }">&nbsp;<font size="2">${mail.title }</font></a></td>
					<td class="send">${mail.id }</td>
					<td class="date"><fmt:formatDate value="${ mail.date}" type="both" dateStyle="short" timeStyle="short"/></td> 
					</tr> 
				</c:forEach>
				
			</table>
			
				<div id="page" align="center">
				<c:if test="${begin > pageNum }">
					<a class="page" href="/mail?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a class="page" href="/mail?p=${i}">${i}</a>
				
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a class="page" href="/mail?p=${end+1}">[다음]</a>
				</c:if>
				</div>
				
			</c:if>
			</div>
			
		</div>
	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
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