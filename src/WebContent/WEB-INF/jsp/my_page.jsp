<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>
<p>a</p>
<c:forEach var="e" items="${pageList}" >
${e.decsId}
${e.decsDeclaration}
${e.decsTag}
${e.decsPrivateFlag}
</c:forEach>


</body>
</html>