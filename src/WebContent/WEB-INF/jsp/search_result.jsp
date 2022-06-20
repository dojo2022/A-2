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

<c:forEach var="e" items="${decList}">
<details>
	<summary>
	宣言ID:${e.id}
	宣言：${e.declaration}
	タグ：${e.tag}
	非公開：${e.privateFlag}
	</summary>

	<c:forEach var="t" items="${searchList}" >
		<c:if test="${t.stepsDecId == e.id }">
		ユーザーID：${t.usersId}<br>
		アイコン：${t.usersIcon}<br>
		ステップID：${t.stepsId}<br>
		ステップ：${t.stepsStep}<br>
		ステップ達成：${t.stepsAchieveFlag}<br>
		ステップ外部キー:${t.stepsDecId }<br>
		</c:if>
	</c:forEach>
</details>
</c:forEach>

</main>

</body>
</html>