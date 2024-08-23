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
            <td>${nlist.title}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${nlist.id}</a></td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                ${nlist.content}
            </td>
        </tr>
        <tr>
            <td>등록일</td>
            <td><fmt:formatDate value="${nlist.date}" dateStyle="short"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <a href="/main">돌아가기</a>
            </td>
        </tr>            
    </table>
   
</body>
</html>
