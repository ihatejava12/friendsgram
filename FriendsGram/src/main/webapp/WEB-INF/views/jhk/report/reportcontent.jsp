<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 20px;
      color: #333;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 20px; /* Fieldset 간의 간격 추가 */
    }

    fieldset {
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 400px;
    }

    h3 {
      font-size: 20px;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    p {
      font-size: 14px;
      color: #555;
      margin-bottom: 10px;
      word-wrap: break-word; /* 긴 텍스트를 줄 바꿈 처리 */
    }

    span {
      display: block;
    }
  </style>
  <title>Insert title here</title>
</head>
<body>

  <c:if test="${b1 != null}">
    <fieldset>
      <div>
        <h3>코딩 게시판 신고글</h3>
        <p><span>글 내용 : ${b1.content}</span></p>
        <p><span>작성자 : ${b1.id}</span></p>
      </div>
    </fieldset>
  </c:if>

  <c:if test="${b2 != null}">
    <fieldset>
      <div>
        <h3>모집 게시판 신고글</h3>
        <p><span>글 내용 : ${b2.content}</span></p>
        <p><span>작성자 : ${b2.id}</span></p>
      </div>
    </fieldset>
  </c:if>

  <c:if test="${bc1 != null}">
    <fieldset>
      <div>
        <h3>코딩 게시판 댓글 신고글</h3>
        <p><span>글 내용 : ${bc1.content}</span></p>
        <p><span>작성자 : ${bc1.id}</span></p>
      </div>
    </fieldset>
  </c:if>

  <c:if test="${bc2 != null}">
    <fieldset>
      <div>
        <h3>모집 게시판 댓글 신고글</h3>
        <p><span>글 내용 : ${bc2.content}</span></p>
        <p><span>작성자 : ${bc2.id}</span></p>
      </div>
    </fieldset>
  </c:if>

 <c:if test="${R != null}">
    <fieldset>
      <div>
        <h3>리뷰글 신고글</h3>
        <p><span>글 내용 : ${R.content}</span></p>
        <p><span>작성자 : ${R.id}</span></p>
      </div>
    </fieldset>
  </c:if>

</body>
</html>
