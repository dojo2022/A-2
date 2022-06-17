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
<c:forEach var="e" items="${pageList}">
	<p>${e.decsId}<br>
	${e.decsDeclaration}<br>
	${e.decsTag}<br>
	${e.decsPrivateFlag}<br>
	${e.usersId}<br>
	${e.usersIcon}<br>
	${e.stepsId}<br>
	${e.stepsStep}<br>
	${e.stepsAchieveFlag}<br></p>
</c:forEach>

<form method="POST" action="/killerQueen/MyListServlet" name="insert">
<input type = "text" name="declaration"><br>
<input type = "text" name="tag"><br>
<input type = "text" name="private_flag"><br>
<input type = "text" name="step"><br> <!-- stepのテキストボックスを増やすのはどのようにするのか -->
<input type = "text" name="step"><br>
<input type = "text" name="step"><br>
<input type="submit" value="新規登録"><br>
</form>

<form method="POST" action="/killerQueen/MyListServlet" name="edit">
<input type = "text" name="declaration"><br>
<input type = "text" name="tag"><br>
<input type = "text" name="private_flag"><br>
<input type = "text" name="step"><br>
<input type="submit" value="編集"><br>
</form>

<form method="POST" action="/killerQueen/MyListServlet" name="achieve">
<input type="submit" value="達成"><br>
</form>

<form method="POST" action="/killerQueen/MyListServlet" name="delete">
<input type="submit" value="削除"><br>
</form>

</body>
</html>