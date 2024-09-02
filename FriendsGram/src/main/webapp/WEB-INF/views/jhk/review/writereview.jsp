<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
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
      width: 400px;
    }

    h1 {
      font-size: 24px;
      margin-bottom: 20px;
      color: #333;
      text-align: center;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      font-weight: bold;
      margin-bottom: 5px;
      color: #555;
    }

    input[type="text"], input[type="submit"], input[readonly] {
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: #fff;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }

   .star-rating {
      display: flex;
    }

    .star {
      appearance: none;
      padding: 1px;
    }

    .star::after {
      content: '☆';
      color: #FAE100;
      font-size: 30px;
    }

    .star:hover::after,
    .star:has(~ .star:hover)::after,
    .star:checked::after,
    .star:has(~ .star:checked)::after {
      content: '★';
    }

    .star:hover ~ .star::after {
      content: '☆';
    }

    input[readonly] {
      background-color: #f9f9f9;
      color: #555;
      cursor: not-allowed;
    }
  </style>

  <title>Insert title here</title>
</head>
<body>
  <fieldset>
    <h1>리뷰 남기기</h1>
    <form action="/insertreview" method="post">
      <input type="hidden" name="b_no02" value="${b_no02}">
      
      <div class="star-rating">
        <input type="radio" name="score" class="star" value="1">
        <input type="radio" name="score" class="star" value="2">
        <input type="radio" name="score" class="star" value="3">
        <input type="radio" name="score" class="star" value="4">
        <input type="radio" name="score" class="star" value="5">
      </div>
      <label for="subjects">대상 :</label>
      <input id="subjects" name="subjects" value="${subjects}" readonly>

      <label for="id">글쓴이 :</label>
      <input id="id" name="id" value="${user.id}" readonly>

      <label for="content">내용 :</label>
      <input type="text" id="content" name="content" placeholder="예쁜 리뷰 부탁드립니다 ^^" size="50">
      
      <input type="submit" value="완료">
    </form>
  </fieldset>
</body>
</html>
