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

<c:forEach var="e" items="${pageList}" >
	<table>
	<tr>
		<td>宣言</td>
		<td>${e.decsDeclaration}</td>
	</tr>
	<tr>
		<td>ステップ</td>
		<td>${e.stepsStep}</td>
	</tr>
	</table>
</c:forEach>

</main>

</body>
</html>