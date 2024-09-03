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
			
			<br>
			<div id="allcontent">
			 <div>쪽지를 보냈습니다.</div>
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