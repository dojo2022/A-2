<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイリスト</title>
<!--  <link rel="stylesheet" type="text/css" href="/killerQueen/css/my_list.css">-->
</head>
<body>
<p>マイリストの表示</p>
<h1>${result.message}</h1>
<c:forEach var="e" items="${decList }" varStatus="satus">
<details>
	<summary>
	宣言ID:${e.id }
	宣言：${e.declaration}
	タグ：${e.tag }
	非公開：${e.privateFlag }
	<c:forEach var="s" items="${reacter}" >
			<c:if test="${s.decsId == e.id}">
				リアクションに応じて画像を変えるよ:${s.countReaction}
				<c:if test="${s.countReaction==0}">
				ゼロだよ<img src="/killerQueen/img/icon/whiteHeart.png">
				</c:if>
				<c:if test="${s.countReaction>0 && s.countReaction<=4}">
				1から４！！<img src="/killerQueen/img/icon/yellowHeart.png">
				</c:if>
				<c:if test="${s.countReaction>4 && s.countReaction<=9}">
				５から９！！<img src="/killerQueen/img/icon/gleenHeart.png">
				</c:if>
				<c:if test="${s.countReaction>9}">
				10以上！！<img src="/killerQueen/img/icon/redHeart.png">
				</c:if>
			</c:if>
		</c:forEach>
	</summary>
	<c:forEach var="t" items="${pageList }" >
		<c:if test="${t.stepsDecId == e.id }">
		ユーザーID：${t.usersId}<br>
		ステップID：${t.stepsId}<br>
		ステップ：${t.stepsStep}<br>
		ステップ達成：${t.stepsAchieveFlag}<br>
		ステップ外部キー:${t.stepsDecId }<br>
		</c:if>
	</c:forEach>
<button id="open_modal2${status.index}" name="open_modal_btn2" onclick="disp('${status.index}')">編集</button>
<form method="POST" action="/killerQueen/MyListServlet">
<input type="submit" value="削除" name="bt"><input type="submit" value="達成" name="bt"><br>
</form>
</details>
</c:forEach>


<!-- 宣言＆ステップの新規登録 -->
<button id="open_modal" name="open_modal_btn">新規登録へ</button>
<form method="POST" action="/killerQueen/MyListServlet">
<div id="resist_modal" class="modal">
	 <div class="modal_content">
	 	<span class="close">X</span>
	 	<div class="modal_body">
			宣言：<input type = "text" name="declaration"><br>
			タグ：<input type = "text" name="tag"><br>
			非公開：<input type = "text" name="private_flag"><br>
			<div id="target">
			<span>ステップ：</span><input type = "text" name="step" id="inputform_0"><br>
			</div>
			<input type="button" value="+" onclick="addForm()">
			<input type="submit" value="新規登録" name="bt"><br>
		</div>
	</div>
</div>






<!-- 宣言＆ステップの編集 -->
<c:forEach var="e" items="${decList }" varStatus="status">
<div id="edit_modal" class="modal">
	<div class="modal_content">
		<span class="close2">X</span>
		<div class="modal_body">
		DecID:<input type ="text" name="declaration_id" value="${e.id }">
		宣言：<input type = "text" name="declaration" value="${e.declaration}"><br>
		タグ：<input type = "text" name="tag" value="${e.tag }"><br>
		非公開:<input type = "text" name="private_flag" value="${e.privateFlag }"><br>
		<c:forEach var="t" items="${pageList }" >
			<c:if test="${t.stepsDecId == e.id }">
			ステップID:<input type="text" name="step_id" value="${t.stepsId}">
			ステップ:<input type = "text" name="step" value="${t.stepsStep}"><br>
			ステップ達成：<input type="text" name="step_achive_flag" value="${t.stepsAchieveFlag}"><br>
			</c:if>
		</c:forEach>
	<input type="submit" value="編集" name="bt"><br>
	</div>
	</div>
</div>
</c:forEach>
</form>
<a href="/killerQueen/SettingServlet">設定へ(ごめん書かせて)</a>




</body>
</html>