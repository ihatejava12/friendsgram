<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
<table border="1">
	<tr><td>제목</td><td>${dto.title}</td>
	<tr><td>작성자</td><td>${dto.id}</td>
	<tr><td>내용</td><td>${dto.content}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.regdate }" dateStyle="long"/></td>
	<tr><td>조회수</td><td>${dto.readcount}</td>
	<tr><td colspan="2" align="right">
	
	<c:if test="${ user.id == dto.id }">
		<a href="/board/update/${dto.no}">글 수정 </a> 
		<a id="${dto.no}" href="#">글 삭제</a>
	</c:if>
	
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id"); //글번호
			$.ajax({url:"/board/delete", 
				data:"no="+no, 
				method:"delete"
				}
			).done(function(){
				location.href="/board/list";
			})
			return false; //하이퍼링크 이동 X
		})//click
	})//ready

</script>

<!--  cList : List<CommDto>-->
<div>
   <div id="comm">
   <c:forEach items="${cList}" var="comm">
      <div title="${comm.cno}">
      <div>${comm.id} / <fmt:formatDate value="${comm.regdate }" dateStyle="short"/></div>
      <div>${comm.content} 
      <c:if test="${comm.id == user.id }">
      <button class="dbtn" id="${comm.cno}">삭제</button>
      </c:if>
      </div>
      <hr>
      </div>
   </c:forEach>
   </div>
   
   <input name="content" id="content"><button id="add">등록</button>
</div><!-- #comm -->
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			$.ajax({url:"/board/delete", data:"no="+no, method:"delete"}
			).done(function(){
				location.href="/board/list";
			})
			return false;
		})//click
		
		$("#add").click(function(){
	         let id = "${user.id}"; // 세션에 저장된 id값
	         
	         if(id == ''){
	            alert("로그인 해주세요.")
	             $("#content").val("");
	            return false;
	         }else{
	         
	         let content = $("#content").val();
	         let no = ${dto.no};
	         
	         $.ajax({url:"/comm/insert",
	               data:"no="+no+"&id="+id+"&content="+content,
	               method:"get",
	               dataType:"json"
	         }).done(function(resp){
	        	 // resp : 현재 글에 대한 모든 댓글(array)
	               //location.reload();
	               //console.log(resp);
	               let clist = "";
	               resp.forEach(function(comm,index){
	                    clist += "<div title="+comm.cno+"><div>"+comm.id+" / "+new Date(comm.regdate).toLocaleDateString()
	                  +"</div><div>"+comm.content;
	                  if(id == comm.id){
	                     clist +='<button class="dbtn" id="'+comm.cno+'">삭제</button>';
	                  }
	                  clist+="</div><hr></div>";
	               });
	               
	               $("#comm").html(clist);
	               $("#content").val("");
	            });
	         }
	      })//click
	      
	      $("#comm").on("click",".dbtn",function(){
	          let cno = $(this).attr("id"); //cno
	          $.ajax({url:"/comm/delete/"+cno,
	             method:"delete"
	       }).done(function(cno){
	             //location.reload();      
	             $("[title="+cno+"]").remove();   
	          });
	       })//click
	})//ready

</script>
</body>
</html>