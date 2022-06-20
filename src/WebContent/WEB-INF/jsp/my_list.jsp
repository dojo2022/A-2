<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイリスト</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/my_list.css">
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
<button id="open_modal2" name="open_modal_btn2">編集</button>
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
	 	<span class='close'>X</span>
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
DecID<input type ="hidden" name="declaration_id">
宣言：<input type = "text" name="declaration"><br>
タグ：<input type = "text" name="tag"><br>
非公開<input type = "text" name="private_flag"><br>
ステップ<input type = "text" name="step"><br>
<input type="submit" value="編集" name="bt"><br>


<!-- 宣言の達成
<input type="submit" value="達成" name="bt"><br>
     宣言の削除
<input type="submit" value="削除" name="bt"><br>-->

</form>
<a href="/killerQueen/SettingServlet">設定へ(ごめん書かせて)</a>
<!-- モーダル表示のjs -->
<script>
'use strict;'

var modal = document.getElementById('resist_modal');
var btn = document.getElementById('open_modal');
var close = modal.getElementsByClassName('close')[0];
//新規登録へを押したらモーダルを表示する
btn.onclick = function() {
	  modal.style.display = 'block';
};
//×を押したらモーダルを閉じる
close.onclick = function() {
		  modal.style.display = 'none';
};

// When the user clicks outside the modal -- close it.
window.onclick = function(event) {
	if (event.target == modal) {

		modal.style.display = 'none';
	}
};

</script>
<!-- テキストボックス追加のjs -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
'use strict'

var i = 1;
function addForm(){
	var input_data = document.createElement('input');
	input_data.type = 'text';
	input_data.id = 'inputform_' + i;
	var step = document.createElement('span');
	step.innerHTML = 'ステップ：';
	var br = document.createElement('br');
	var parent = document.getElementById('target');
	parent.appendChild(step);
	parent.appendChild(input_data);
	parent.appendChild(br);
	i++;
	return false;
}

//jQueryのやり方
//$(document).on("click", ".add", function() {
//    $(this).parent().clone(true).insertAfter($(this).parent());
//
//});

</script>

</body>
</html>