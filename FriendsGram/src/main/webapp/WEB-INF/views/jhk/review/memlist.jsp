<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach items="${memlist}" var="mlist">
		<fieldset>
			<span>${mlist.id}</span>
		</fieldset>
	</c:forEach>
	
</body>
</html>