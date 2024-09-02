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
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    fieldset {
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 350px;
    }

    h1 {
      font-size: 24px;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    div {
      margin-bottom: 10px;
    }

    a {
      color: #4CAF50;
      text-decoration: none;
      font-weight: bold;
      display: block;
      text-align: center;
      padding: 10px;
      border: 1px solid #4CAF50;
      border-radius: 4px;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    a:hover {
      background-color: #4CAF50;
      color: white;
    }
  </style>

<title>Insert title here</title>
</head>
<body>
  <fieldset>
    <h1>리뷰 남길 팀원을 선택하세요</h1>
    <c:forEach items="${tlist}" var="list">
      <c:if test="${user.id != list.id}">
        <div><a href="/writereview/${list.id}/${list.b_no02}">${list.id}</a></div>
      </c:if>
    </c:forEach>
  </fieldset>
</body>
</html>
