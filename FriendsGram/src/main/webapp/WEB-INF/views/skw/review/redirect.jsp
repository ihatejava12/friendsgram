<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Redirect Page</title>
    <script>
        function redirectToPage() {
            // 여기서 조건을 평가하여 리디렉션할 페이지를 결정합니다.
            var hasReview = ${!empty relist}; // 서버에서 전달된 리뷰 리스트가 비어있지 않은지 확인

            if (hasReview) {
                window.location.href = "/skw/review/review/{id}";
            } else {
                window.location.href = "/skw/review/noreview";
            }
        }
    </script>
</head>
<body onload="redirectToPage()">
    <h1>페이지로 이동 중입니다...</h1>
</body>
</html>
