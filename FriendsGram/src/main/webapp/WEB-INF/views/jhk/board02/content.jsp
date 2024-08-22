<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">

body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 0;
    line-height: 1.6;
}

table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #ffffff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

table tr, table td {
    padding: 10px;
}

table tr:first-child td {
    background-color: #4CAF50; /* 상단 헤더의 배경색 */
    color: #fff;
    font-weight: bold;
    text-align: center;
}

table td {
    border-bottom: 1px solid #ccc;
}

table td input, table td textarea {
    width: 95%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    background-color: #f9f9f9;
    color: #333;
}

table td a, table td button {
    display: inline-block;
    background-color: #4CAF50; /* 버튼 배경색 */
    color: #fff;
    text-decoration: none;
    padding: 10px 20px; /* 버튼 크기 조정 */
    font-size: 1rem;
    border-radius: 4px;
    text-align: center;
    margin: 5px 5px;
    border: none;
    cursor: pointer;
}

table td a:hover, table td button:hover {
    background-color: #45a049; /* 버튼 호버 색상 */
}

hr {
    width: 80%;
    margin: 20px auto;
    border: 0;
    height: 1px;
    background-color: #ccc;
}

.comment-input-container {
    width: 80%;
    margin: 20px auto;
    display: flex;
    justify-content: center; /* 입력창과 버튼들을 중앙에 배치 */
    gap: 10px; /* 입력창과 버튼 사이에 간격 추가 */
}

#comm {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    background-color: #f9f9f9;
    color: #333;
}

#add_comm, .button-apply {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    cursor: pointer;
    font-size: 1rem;
    border-radius: 4px;
}

#add_comm:hover, .button-apply:hover {
    background-color: #45a049;
}

.button-apply {
    background-color: #28a745; /* 신청 버튼을 다른 초록색으로 강조 */
}

.button-apply:hover {
    background-color: #218838;
}

.button-center {
    display: block;
    width: fit-content;
    margin: 0 auto; /* 버튼을 가운데 정렬 */
}

.comment-container {
    width: 60%;
    margin: 20px auto;
    background-color: #ffffff;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.comment {
    margin-bottom: 15px;
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 6px;
    position: relative;
}

.comment.reply {
    margin-left: 20px;
}

.comment .user-info {
    font-weight: bold;
    margin-bottom: 5px;
    color: #4CAF50;
}

.comment .comment-date {
    font-size: 0.85rem;
    color: #777;
    position: absolute;
    top: 10px;
    right: 10px;
}

.comment .comment-text {
    margin-top: 5px;
    font-size: 1rem;
    color: #333;
}

.comment .comment-actions {
    margin-top: 10px;
    text-align: right;
}

.comment .comment-actions button {
    background-color: #dc3545;
    color: #fff;
    border: none;
    padding: 5px 10px;
    font-size: 0.85rem;
    border-radius: 4px;
    cursor: pointer;
}

.comment .comment-actions button:hover {
    background-color: #c82333;
}

fieldset {
    border: none;
    padding: 0;
    margin: 0;
}

.comm_comm {
    cursor: pointer;
    display: block;
    padding: 10px;
    border-radius: 4px;
    background-color: #f1f1f1;
    margin-bottom: 10px;
}

.comm_comm:hover {
    background-color: #e9e9e9;
}

fieldset img {
    vertical-align: middle;
}

fieldset div {
    margin-top: 10px;
    padding-left: 10px;
}

</style>
</head>
<body>
    <table border="1">
        <tr>
            <td>제목</td>
            <td><input name="title" value="${dto.title}" readonly/></td>
        </tr>
        <tr>
            <td>작성자</td>
            <td><a href="/viewreview/${dto.id}" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${dto.id}</a></td>
        </tr>
        <tr>
            <td>모집 기간</td>
            <td>~ ${dto.join_date}</td>
        </tr>
        <tr>
            <td>작성일자</td>
            <td>${dto.date}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" readonly>${dto.content}</textarea>
            </td>
        </tr>
        <tr>
            <td>모집상태</td>
            <c:if test="${dto.join01 == false}">
                <td>모집중</td>
            </c:if>
            <c:if test="${dto.join01 == true}">
                <td>모집완료</td>
            </c:if>
        </tr>
        <tr>
            <td>지원자수/모집자수<br>(팀장미포함)</td>
            <td>${countteam} / ${dto.volunteer}</td>
        </tr>
        <tr>
            <td>중요 코드</td>
            <td>
                <c:forEach items="${clist}" var="codelist">
                    ${codelist.code}, 
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <a href="/board02/main">돌아가기</a>
                <c:if test="${user.id != null}">
                    <button onclick="window.open('/reportcontent/${dto.b_no02}', '_blank', 'width=500,height=600, top=50, left=50, scrollbars=yes')">신고하기</button>
                </c:if>
                <c:if test="${dto.id == user.id}">
                    <a href="/board02update/${dto.b_no02}">수정하기</a>
                    <form action="/deletecontent02/${dto.b_no02}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="삭제하기">
                    </form>
                </c:if>
            </td>
        </tr>            
    </table>
    <hr>
    <c:if test="${user.id != null}">
        <div class="comment-input-container">
            <input type="text" placeholder="댓글을 입력하세요." id="comm">
            <input type="button" id="add_comm" value="추가">
            <c:if test="${user.id != dto.id}">
            	<c:if test="${cjoin == 0}">
                	<button class="button-apply" onclick="window.open('/pickcode/${dto.b_no02}', '_blank', 'width=450, height=600, top=50, left=50, scrollbars=yes')">신청하기</button>
            	</c:if>
            	<c:if test="${cjoin != 0}">
            		<button class="button-apply">신청완료</button>
            	</c:if>
            </c:if>
            <c:if test="${user.id == dto.id}">
            	<c:if test="${dto.join01 == false}">
        			<button class="button-apply" onclick="window.open('/teamlist/${dto.b_no02}', '_blank', 'width=450, height=600, top=50, left=50, scrollbars=yes')">신청자보기</button>
   				</c:if>
   				<c:if test="${dto.join01 == true}">
   					<button class="button-apply">확정 완료</button>
   				</c:if>
   			</c:if>
        </div>
    </c:if>

    <hr>
    <c:forEach items="${commlist}" var="comm">
        <c:if test="${comm.ref_level != 1}">
            <div class="comment-container">
                <fieldset>
                    <span title="${comm.c_no02}" id="${comm.ref_level}" class="comm_comm" data-target="${comm.id}">
                        ${comm.id} / <fmt:formatDate value="${comm.date}" dateStyle="short"/>
                        <button onclick="window.open('/reportcoment/${comm.c_no02}', '_blank', 'width=500,height=600, top=50, left=50, scrollbars=yes')">신고하기</button>
                        <c:if test="${comm.id == user.id}">
                            <input type="button" class="delete" id="${comm.c_no02}" value="삭제">
                        </c:if> 
                        <div>${comm.coment}</div>
                    </span>
                    <span class="${comm.c_no02}"></span>
                </fieldset>
            </div>
        </c:if>
        <c:if test="${comm.ref_level == 1}">
            <div class="comment-container">
                <fieldset>
                    <div style="float:left; height:50px; margin-right: 10px;">
                        <span class="icon">
                            <img src="/img/level.gif" width="${comm.ref_level * 10}">    
                            <img src="/img/re.gif" alt="답변" />
                        </span>
                    </div>
                    <span title="${comm.c_no02}" id="${comm.ref_level}" class="comm_comm" data-target="${comm.id}">
                        ${comm.id} / <fmt:formatDate value="${comm.date}" dateStyle="short"/>
                    
                    <button onclick="window.open('/reportcoment/${comm.c_no02}', '_blank', 'width=500,height=600, top=50, left=50, scrollbars=yes')">신고하기</button>
                    <c:if test="${comm.id == user.id}">
                        <input type="button" class="delete" id="${comm.c_no02}" name="${comm.ref_level}" value="삭제">
                    </c:if> 
                    <div>${comm.coment}</div>
                    </span>
                    <span class="${comm.c_no02}"></span>
                </fieldset>
            </div>
        </c:if>
    </c:forEach>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
            $("#add_comm").on('click', function(){
                let coment = $("#comm").val();
                let id = "${user.id}";
                let b_no02 = ${dto.b_no02};
                if (coment === '') {
                    alert("내용을 입력해주세요!");
                } else {
                    $.ajax({
                        url: "/insertcomm02",
                        data: "coment=" + coment + "&id=" + id + "&b_no02=" + b_no02,
                        method: "post"
                    }).always(function(){
                        location.reload();
                    });
                }
            });

            $(".delete").click(function(){
                let ref_level = $(this).attr("name");
                let c_no02 = $(this).attr("id");
                if (ref_level == 1) {
                    $.ajax({
                        url: "/deletecomm02/" + c_no02,
                        method: "get"
                    }).always(function(){
                        location.reload();
                    });
                } else {
                    $.ajax({
                        url: "/deletecomm03/" + c_no02,
                        method: "get"
                    }).always(function(){
                        location.reload();
                    });
                }
            });

            $(".comm_comm").one('click', function(){
                let ref_level = $(this).attr("id");
                if (ref_level == 0) {
                    let id = $(this).attr("data-target");
                    let no = $(this).attr("title");
                    let s_id = '.' + no;
                    $(s_id).append('<input name="coment" type="text" value="@' + id + '"><input type="button" class="add_coment" value="추가">');
                } else {
                    alert("불가능합니다");
                }
            });

            $("fieldset").on('click', '.add_coment', function(){
                let id = "${user.id}";
                let b_no02 = ${dto.b_no02};
                let ref = $(this).parent().attr('class');
                let coment = $(this).prev().val();
                $.ajax({
                    url: "/insert/comm2",
                    data: "id=" + id + "&b_no02=" + b_no02 + "&ref=" + ref + "&coment=" + coment,
                    method: "post"
                }).always(function(){
                    location.reload();
                });
            });
        });
    </script>
</body>
</html>
