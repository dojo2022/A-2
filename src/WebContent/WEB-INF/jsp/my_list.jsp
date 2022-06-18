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
	宣言${e.decsDeclaration}<br>
	タグ${e.decsTag}<br>
	非公開${e.decsPrivateFlag}<br>
	ユーザーID${e.usersId}<br>
	アイコン${e.usersIcon}<br>
	ステップID${e.stepsId}<br>
	ステップ${e.stepsStep}<br>
	ステップ達成${e.stepsAchieveFlag}<br></p>
</c:forEach>

<form method="POST" action="/killerQueen/MyListServlet" name="insert">
宣言：<input type = "text" name="declaration"><br>
タグ：<input type = "text" name="tag"><br>
非公開：<input type = "text" name="private_flag"><br>
ステップ：<input type = "text" name="step"><br> <!-- stepのテキストボックスを増やすのはどのようにするのか -->
ステップ<input type = "text" name="step"><br>
ステップ<input type = "text" name="step"><br>
ステップ<input type="submit" value="新規登録"><br>
</form>

<form method="POST" action="/killerQueen/MyListServlet" name="edit">
DecID<input type ="hidden" name="declaration_id">
宣言：<input type = "text" name="declaration"><br>
タグ：<input type = "text" name="tag"><br>
非公開<input type = "text" name="private_flag"><br>
ステップ<input type = "text" name="step"><br>
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