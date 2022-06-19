<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
</head>
<body>

<main>

<h1>検索結果</h1>
<hr>


<c:forEach var="s" items="${searchList}" >
	<p><c:out value="${s.decsDeclaration}"/></p>
	<p><c:out value="${s.stepsStep}"/></p>
</c:forEach>

</main>

</body>
</html>