<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイリスト</title>
</head>
<body>
<p>マイリストの表示</p>
<c:forEach var="e" items="${listPage}">
	${e.decsId}
	${e.decsDeclaration}
	${e.decsTag}
	${e.decsPrivateFlag}
	${e.decsId}
	${e.decsId}
	${e.decsId}


</c:forEach>

<form method="POST" action="/killerQueen/MyListServlet">
<input type = "text" name="declaration">
<input type = "text" name="tag">
<input type = "text" name="private_flag">

<input type="submit" value="新規登録">
</form>


</body>
</html>