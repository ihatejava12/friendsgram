<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    }

    h1 {
      font-size: 24px;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    fieldset {
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
      width: 350px;
    }

    span {
      display: block;
      font-size: 14px;
      color: #555;
      margin-bottom: 10px;
    }

    h4 {
      font-size: 18px;
      margin-bottom: 10px;
      color: #ffcc00;
    }

    div {
      font-size: 16px;
      margin-bottom: 10px;
    }

    button {
      padding: 8px 15px; /* 버튼 크기를 줄이기 위해 패딩을 조정 */
      background-color: #ff4d4d;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
      font-size: 14px; /* 폰트 크기를 약간 줄임 */
      float: right;
    }

    button:hover {
      background-color: #e60000;
    }

    .review-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
  </style>

<title>Insert title here</title>
</head>
<body>

  <h1>${subjects}님의 평균 별점 : ${star}</h1>

  <div class="review-container">
    <c:forEach items="${relist}" var="rlist">
      <fieldset>
        <span>작성자 : ${rlist.id} / <fmt:formatDate value="${rlist.date}" dateStyle="short"/></span>
        <div>
          <c:if test="${rlist.score == 1}">
            <h4>별점 : ★</h4>
          </c:if>
          <c:if test="${rlist.score == 2}">
            <h4>별점 : ★ ★</h4>
          </c:if>
          <c:if test="${rlist.score == 3}">
            <h4>별점 : ★ ★ ★</h4>
          </c:if>
          <c:if test="${rlist.score == 4}">
            <h4>별점 : ★ ★ ★ ★</h4>
          </c:if>
          <c:if test="${rlist.score == 5}">
            <h4>별점 : ★ ★ ★ ★ ★</h4>
          </c:if>
        </div>
        <div>내용 : ${rlist.content}</div>
        <button onclick="window.open('/reportreview/${rlist.mr_no}', '_blank', 'width=500,height=400, top=50, left=50, scrollbars=yes')">신고하기</button>
      </fieldset>
    </c:forEach>
  </div>

</body>
</html>
