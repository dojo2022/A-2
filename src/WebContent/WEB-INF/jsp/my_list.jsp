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
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<p>マイリストの表示</p>
<h1>${result.message}</h1>
<c:forEach var="e" items="${decList }" varStatus="status">
<form method="POST" action="/killerQueen/MyListServlet">
<details>
	<summary>
	宣言ID:${e.id }<input type="hidden" name="declaration_id" value="${e.id }">
	宣言：${e.declaration}
	タグ：${e.tag }
	非公開：${e.privateFlag }
	<c:forEach var="s" items="${reacter}" >
			<c:if test="${s.decsId == e.id}">
				リアクションに応じて画像を変えるよ:${s.countReaction}
				<c:if test="${s.countReaction==0}">
				ゼロだよ<img src="/killerQueen/img/icon/whiteHeart.png" width="30px">
				</c:if>
				<c:if test="${s.countReaction>0 && s.countReaction<=4}">
				1から４！！<img src="/killerQueen/img/icon/yellowHeart.png" width="30px">
				</c:if>
				<c:if test="${s.countReaction>4 && s.countReaction<=9}">
				５から９！！<img src="/killerQueen/img/icon/gleenHeart.png" width="30px">
				</c:if>
				<c:if test="${s.countReaction>9}">
				10以上！！<img src="/killerQueen/img/icon/redHeart.png" width="30px">
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

<input type="submit" value="削除" name="bt"><input type="submit" value="達成" name="bt"><br>
</details>
</form>
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
			<span>ステップ：</span><input type = "text" name="step1" id="inputform_1"><br>
			</div>
			<input type="hidden" name="count" value="1" id="count">
			<input type="button" value="+" onclick="addForm()">
			<input type="submit" value="新規登録" name="bt"><br>
		</div>
	</div>
</div>
</form>





<!-- 宣言＆ステップの編集 -->
<c:forEach var="e" items="${decList }" varStatus="status">
<form method="POST" action="/killerQueen/MyListServlet">
<div id="edit_modal${status.index}" class="modal">
	<div class="modal_content">
		<span class="close2" onclick="batten('${status.index}')" id="close${status.index}">X</span>
		<div class="modal_body">
		<input type="text" value="${status.index}" id="status_id${status.index}">
		DecID:<input type ="text" name="declaration_id_edit" value="${e.id }">
		宣言：<input type = "text" name="declaration_edit" value="${e.declaration}"><br>
		タグ：<input type = "text" name="tag_edit" value="${e.tag }"><br>
		非公開:<input type = "text" name="private_flag_edit" value="${e.privateFlag }"><br>
		<%int countStep = 0; %>
		<c:forEach var="t" items="${pageList }" varStatus="step_status" >
			<c:if test="${t.stepsDecId == e.id }">
			ステップID:<input type="text" name="step_id_edit<%=countStep %>" value="${t.stepsId}">
			ステップ:<input type = "text" name="step_edit<%=countStep %>" value="${t.stepsStep}" id="edit_form<%=countStep %>">
			ステップ達成：<input type="text" name="step_achive_flag_edit" value="${t.stepsAchieveFlag}"><br>
			ステップ外部キー：<input type="text" name="step_foreign_id<%=countStep %>" value="${t.stepsDecId }">
			<%countStep++; %>
			</c:if>
		</c:forEach>
		<input type="hidden" name="step_count" value="<%=countStep %>">
		<div id="target2${status.index}"></div>
		<input type="button" value="+" onclick="return addEditForm('${status.index}', <%=countStep%>)">
		<input type="hidden" name="all_count" value="1" id="all_count">
	<input type="submit" value="完了" name="bt"><br>
	</div>
	</div>
</div>
</form>
</c:forEach>
<a href="/killerQueen/SettingServlet">設定へ(ごめん書かせて)</a>

<script>
//新規登録へを押したらモーダルを表示する
var modal = document.getElementById('resist_modal');
var btn = document.getElementById('open_modal');
var close = modal.getElementsByClassName('close')[0];
btn.onclick = function() {
	  modal.style.display = 'block';
};
//×を押したらモーダルを閉じる
close.onclick = function() {
		  modal.style.display = 'none';
};


//編集画面用のモーダル
//var modal2 = document.getElementById('edit_modal');
//var btn2 = document.getElementById('open_modal2');
//編集ボタンを押した時の表示：function disp()
var j = 0;
function disp(indexNo){
	j=0;
	alert('押したやろ');
	alert(indexNo);
	var modal2 = document.getElementById('edit_modal'+ indexNo);
	//var btn2 = document.getElementById('open_modal2'+indexNo);
	//var stId = document.getElementById('status_id'+indexNo);
	alert(document.getElementById('edit_modal'+ indexNo));
	if(indexNo == indexNo){
		alert('if文にいるよん');
		modal2.style.display = 'block';
		event.preventDefault();
	}else {
		console.log('まだまだだね');
	}

}


//×を押したらモーダルが消える
function batten (indexNo){
	var modal2 = document.getElementById('edit_modal'+ indexNo);
	//var close_btn = modal2.getElementById('close' + indexNo)
	modal2.style.display = 'none';
	console.log(indexNo);
}



//モーダル以外を押したらモーダルが閉じる
window.onclick = function (event)  {
	if (event.target == modal) {

		modal.style.display = 'none';
	}
};




//編集画面のテキストボックスの追加

var num = 0;
function addEditForm(indexNo, indexStep){
	alert(indexStep);
	num= indexStep + j;
	alert(num);
	var input_data = document.createElement('input');
	input_data.type = 'text';
	input_data.id = 'edit_form' + j;
	input_data.name='edit_form' + j;
	alert(input_data.name);
	var step = document.createElement('span');
	step.innerHTML = 'ステップ：';
	var br = document.createElement('br');
	var parent = document.getElementById('target2'+ indexNo);
	parent.appendChild(step);
	parent.appendChild(input_data);
	parent.appendChild(br);
	j++;
	//numが編集する際にプラスされたステップも含めたステップの個数
	var count = document.getElementById('all_count');
	count.value = j;
	alert(document.getElementById('all_count').value);

	return false;

}


<!-- テキストボックス追加のjs-->
'use strict'
//新規登録画面のテキストボックスの追加
var i = 1;
function addForm(){
	i++;
	var input_data = document.createElement('input');
	input_data.type = 'text';
	input_data.id = 'inputform_' + i;
	input_data.name='step' + i;
	alert(input_data.name);
	var step = document.createElement('span');
	step.innerHTML = 'ステップ：';
	var br = document.createElement('br');
	var parent = document.getElementById('target');
	parent.appendChild(step);
	parent.appendChild(input_data);
	parent.appendChild(br);

	var count = document.getElementById('count');
	count.value = i;
	alert(document.getElementById('count').value);

	return false;
}


//編集画面のテキストボックスの追加


//jQueryのやり方
//$(document).on("click", ".add", function() {
//    $(this).parent().clone(true).insertAfter($(this).parent());
//
//});
// When the user clicks outside the modal -- close it.
//window.onclick = function(event) {
//	if (event.target == modal2) {
//
//		modal2.style.display = 'none';
//	}
//};


</script>
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">-->
</body>
</html>