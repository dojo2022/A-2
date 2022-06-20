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
<!-- ユーザー情報 -->
<p>ID: ${id}</p>
<p>NAME: ${name}</p>
<p>ICON: ${icon}</p>
<p>COMMENT: ${commment}</p>
<p>ランク:${countAchieve}</p>
<p>ゲージも</p>
<a href="SettingServlet">設定！！</a>


<c:forEach var="t" items="${myPageList}" >
<details>
	<summary>
		宣言：${t.decsDeclaration}
		タグno:${t.decsTag}
		リアクション有無:
		ブックマーク有無:
		宣言達成:${t.decsAchieveFlag}
		<c:forEach var="s" items="${reacter}" >
			<c:if test="${s.decsId == t.decsId}">
				リアクション:${s.countReaction}<br>
			</c:if>
		</c:forEach>
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