<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>他ユーザーマイページ</title>
</head>
<body>

<!-- ユーザー情報 -->

<p>ID: ${userInfo.id}</p>
<p>NAME: ${userInfo.name}</p>
<p>ICON: ${userInfo.icon}</p>
<p>COMMENT: ${userInfo.comment}</p>
<p>ランクを表示したい気持はある</p>


<!-- 自分の宣言リストたち -->
<c:forEach var="t" items="${OtherPageList}">
<details>
	<summary>
		宣言：${t.decsDeclaration}<br>
		タグno:${t.decsTag}<br>
		リアクション有無:<br>
		ブックマーク有無:<br>
		宣言達成:${t.decsAchieveFlag}<br>
	</summary>
		<c:forEach var="v" items="${steper}" varStatus = "st">
			<c:if test="${t.decsId == v.declarationId}">
				ステップ:${v.step}<br>
				達成:${v.achieveFlag}<br>
			</c:if>
		</c:forEach>
</details>
</c:forEach>


</body>
</html>