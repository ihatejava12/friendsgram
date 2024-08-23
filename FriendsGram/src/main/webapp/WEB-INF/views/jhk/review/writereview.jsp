<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
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
			대상 : <input name="subjects" value="${subjects}" readonly><br>
			글쓴이 : <input name="id" value="${user.id}" readonly><br>
			내용 : <input type="text" name="content" placeholder="예쁜 리뷰 부탁드립니다 ^^" size=50><br>
			<input type="submit" value="완료">
		</form>
	</fieldset>
</body>
</html>