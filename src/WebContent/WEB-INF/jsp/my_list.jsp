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
<h1>${result.message}</h1>
<c:forEach var="e" items="${decList }">
<details>
	<summary>
	宣言ID:${e.id }
	宣言：${e.declaration}
	タグ：${e.tag }
	非公開：${e.privateFlag }
	</summary>
	<c:forEach var="t" items="${pageList }" >
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
<form method="POST" action="/killerQueen/MyListServlet">
<!-- 宣言＆ステップの新規登録 -->
宣言：<input type = "text" name="declaration"><br>
タグ：<input type = "text" name="tag"><br>
非公開：<input type = "text" name="private_flag"><br>
ステップ：<input type = "text" name="step"><br> <!-- stepのテキストボックスを増やすのはどのようにするのか -->
ステップ<input type = "text" name="step"><br>
ステップ<input type = "text" name="step"><br>
<input type="submit" value="新規登録" name="bt"><br>


<!-- 宣言＆ステップの編集 -->
DecID<input type ="hidden" name="declaration_id">
宣言：<input type = "text" name="declaration"><br>
タグ：<input type = "text" name="tag"><br>
非公開<input type = "text" name="private_flag"><br>
ステップ<input type = "text" name="step"><br>
<input type="submit" value="編集" name="bt"><br>


<!-- 宣言の達成 -->
<input type="submit" value="達成" name="bt"><br>


<!-- 宣言の削除 -->
<input type="submit" value="削除" name="bt"><br>
</form>
<a href="/killerQueen/SettingServlet">設定へ(ごめん書かせて)</a>
</body>
</html>