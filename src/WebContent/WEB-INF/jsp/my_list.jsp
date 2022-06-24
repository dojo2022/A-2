<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
			<summary><%int step=0; %><%int achieve=0; %>
				<input type="hidden" name="declaration_id" value="${e.id }">

				<!-- タグの表示：${e.tag } -->
				<c:if test="${e.tag == 0}">
					#勉強
				</c:if>
				<c:if test="${e.tag == 1}">
					#仕事
				</c:if>
				<c:if test="${e.tag == 2}">
					#趣味
				</c:if>
				<c:if test="${e.tag == 3}">
					#ダイエット
				</c:if>
				<c:if test="${e.tag == 4}">
					#運動
				</c:if>
				<c:if test="${e.tag == 5}">
					#健康
				</c:if>
				<c:if test="${e.tag == 6}">
					#美容
				</c:if>
				<c:if test="${e.tag == 7}">
					#日常
				</c:if>
				<c:if test="${e.tag == 8}">
					#その他
				</c:if>

				<!-- 宣言の表示 -->
				宣言：${e.declaration}

				<!--達成/ステップ数の表示  -->
				<c:forEach var="v" items="${pageList }" >
						<c:if test="${e.id  == v.stepsDecId}">
							<c:if test="${v.stepsStep !='' }">
								<c:if test="${v.stepsAchieveFlag==true}">
									<%achieve++; %>
								</c:if>
								<%step++; %>
							</c:if>
						</c:if>
				</c:forEach>
				<%=achieve %>
				/<%=step %>

				<!--  非公開：${e.privateFlag }-->
				<c:if test="${e.privateFlag ==true}">
					<img src="/killerQueen/img/icon/close.png" width="30px">
				</c:if>
				<c:if test="${e.privateFlag ==false}">
					<span>
						<!-- <img src="/killerQueen/img/icon/open.png" width="30px"> -->
					</span>
				</c:if>

				<!-- リアクション数に応じてハートマーク -->
				<c:forEach var="s" items="${reacter}" >
						<c:if test="${s.decsId == e.id}">
							<!--  リアクションに応じて画像を変えるよ:${s.countReaction}-->
							<c:if test="${s.countReaction==0}">
								<img src="/killerQueen/img/icon/whiteHeart.png" width="30px">
							</c:if>
							<c:if test="${s.countReaction>0 && s.countReaction<=4}">
								<img src="/killerQueen/img/icon/yellowHeart.png" width="30px">
							</c:if>
							<c:if test="${s.countReaction>4 && s.countReaction<=9}">
								<img src="/killerQueen/img/icon/gleenHeart.png" width="30px">
							</c:if>
							<c:if test="${s.countReaction>9}">
								<img src="/killerQueen/img/icon/redHeart.png" width="30px">
							</c:if>
						</c:if>
				</c:forEach>
			</summary>

			<!-- ステップの表示 -->
			<c:forEach var="t" items="${pageList }" varStatus="step_ac" >
				<c:if test="${t.stepsDecId == e.id }">
					<!--
						 ユーザーID：${t.usersId}
						ステップID：${t.stepsId}
						ステップ達成：${t.stepsAchieveFlag}
						ステップ外部キー:${t.stepsDecId }<br>
					-->
					<c:if test="${t.stepsStep != ''}">
						<input type="hidden" value="${t.stepsId }" id="steps_id${step_ac.index}" name="steps_id${step_ac.index}">
						<input type="hidden" value="${t.stepsAchieveFlag }" id="steps_achieve${step_ac.index}" name="steps_achieve${step_ac.index}">
						<c:if test="${t.stepsAchieveFlag == false }">
							<div id="change${step_ac.index}">
								<img src="/killerQueen/img/circle_icon/circle.png" width="30px"  id="step_achieve_flag${step_ac.index}" onclick="goAjax('${step_ac.index}', 'ステップ未達成')" >
							</div>
						</c:if>
						<c:if test="${t.stepsAchieveFlag == true }">
							<div id="change${step_ac.index}">
								<img src="/killerQueen/img/circle_icon/check.png" width="30px" id="step_achieve_flag${step_ac.index}" onclick="goAjax('${step_ac.index}', 'ステップ達成')" >
							</div>
						</c:if>
						<span>ステップ：${t.stepsStep}<br></span>
					</c:if>
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
		 		<!-- タグ選択のプルダウン -->
		 		タグ：<select name="tag">
		 				<option value="0">#勉強</option>
		 				<option value="1">#仕事</option>
		 				<option value="2">#趣味</option>
		 				<option value="3">#ダイエット</option>
		 				<option value="4">#運動</option>
		 				<option value="5">#健康</option>
		 				<option value="6">#美容</option>
		 				<option value="7">#日常</option>
		 				<option value="8">#その他</option>
		 			  </select>
		 		<!--  <input type = "text" name="tag">-->
		 		<!-- 宣言の入力 -->
				宣言：<input type = "text" name="declaration"><br>
				<!-- 非公開選択ボタン -->
				非公開：<input type = "checkbox" name="private_flag" value="true"><br>
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
					<input type="hidden" value="${status.index}" id="status_id${status.index}">
					<input type ="hidden" name="declaration_id_edit" value="${e.id }">
					タグ：<select name="tag_edit" >
							<c:choose>
								<c:when test="${e.tag == 0 }">
			 						<option value="0" selected>#勉強</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="0">#勉強</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 1 }">
			 						<option value="1" selected>#仕事</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="1">#仕事</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 2 }">
			 						<option value="2" selected>#趣味</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="2">#趣味</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 3 }">
			 						<option value="3" selected>#ダイエット</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="3">#ダイエット</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 4 }">
			 						<option value="4" selected>#運動</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="4">#運動</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 5 }">
			 						<option value="5" selected>#健康</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="5">#健康</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 6 }">
			 						<option value="6" selected>#美容</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="6">#美容</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 7 }">
			 						<option value="7" selected>#日常</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="7">#日常</option>
			 					</c:otherwise>
			 				</c:choose>
			 				<c:choose>
								<c:when test="${e.tag == 8 }">
			 						<option value="8" selected>#その他</option>
			 					</c:when>
			 					<c:otherwise>
			 						<option value="8">#その他</option>
			 					</c:otherwise>
			 				</c:choose>
		 			      </select>
					宣言：<input type = "text" name="declaration_edit" value="${e.declaration}"><br>
					非公開:<c:choose>
								<c:when test="${e.privateFlag == false }">
									<input type = "checkbox" name="private_flag_edit" value="true"><br>
								</c:when>
								<c:otherwise>
									<input type = "checkbox" name="private_flag_edit" value="true" checked><br>
								</c:otherwise>
							</c:choose>
					<%int countStep = 0; %>
					<c:forEach var="t" items="${pageList }" varStatus="step_status" >
						<c:if test="${t.stepsDecId == e.id }">
							ステップ:<input type = "text" name="step_edit<%=countStep %>" value="${t.stepsStep}" id="edit_form<%=countStep %>">
							<input type="hidden" name="step_id_edit<%=countStep %>" value="${t.stepsId}">
							<input type="hidden" name="step_achive_flag_edit" value="${t.stepsAchieveFlag}">
							<input type="hidden" name="step_foreign_id<%=countStep %>" value="${t.stepsDecId }"><br>
							<%countStep++; %>
						</c:if>
					</c:forEach>
					<input type="hidden" name="step_count" value="<%=countStep %>">
					<div id="target2${status.index}">
						<input type="hidden" name="all_count" value="0" id="all_count${status.index}">
					</div>
					<input type="button" value="+" onclick="return addEditForm('${status.index}', <%=countStep%>)">
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
	//alert('押したやろ');アラート
	//alert(indexNo);アラート
	var modal2 = document.getElementById('edit_modal'+ indexNo);
	//var btn2 = document.getElementById('open_modal2'+indexNo);
	//var stId = document.getElementById('status_id'+indexNo);
	//alert(document.getElementById('edit_modal'+ indexNo));アラート
	if(indexNo == indexNo){
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
	//alert(indexStep);
	num= indexStep + j;
	//alert(num);
	var input_data = document.createElement('input');
	input_data.type = 'text';
	input_data.id = 'edit_form' + j;
	input_data.name='edit_form' + j;
	//alert(input_data.name);
	var step = document.createElement('span');
	step.innerHTML = 'ステップ:';
	var br = document.createElement('br');
	var parent = document.getElementById('target2'+ indexNo);
	parent.appendChild(step);
	parent.appendChild(input_data);
	parent.appendChild(br);
	j++;
	//numが編集する際にプラスされたステップも含めたステップの個数
	var count = document.getElementById('all_count' + indexNo);
	count.value = j;
	//alert(document.getElementById('all_count' + indexNo).value);

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
	//alert(input_data.name);
	var step = document.createElement('span');
	step.innerHTML = 'ステップ：';
	var br = document.createElement('br');
	var parent = document.getElementById('target');
	parent.appendChild(step);
	parent.appendChild(input_data);
	parent.appendChild(br);

	var count = document.getElementById('count');
	count.value = i;
	//alert(document.getElementById('count').value);

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

</body>
<script >
function goAjax(indexNo, imgStr){
	//入力値を取得してくる
	alert('Ajaxスタート');
	let stepsAId = document.getElementById('steps_id' + indexNo).value;
	//let buttonStatus = document.getElementById('step_achieve_flag' + indexNo).value;
	alert(stepsAId);
	alert(imgStr);

	//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
	let postData = {data1:stepsAId,data2:imgStr}
	alert(postData);


	alert('非同期通信始めるよ');
	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/killerQueen/MyListServlet',
		//どのメソッドを使用するか
		type:"POST",
		//ここは今回は決まりの書き方　→　受け取る型
		dataType:"text",
		//何をサーブレットに飛ばすか（変数を記述）
		data: postData,
		//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
		processDate:false,
		timeStamp: new Date().getTime()
	   //非同期通信が成功したときの処理
	})
    .done(function(data) {
    	alert("成功");

		if(data == "getAchieveTrue"){
		$("#change" + indexNo).html("");
		var htmltext = "";
		htmltext = htmltext + `<img src="/killerQueen/img/circle_icon/check.png" width="30px" value="ステップ達成" class="reaction_red" id="step_achieve_flag` + indexNo;
		htmltext = htmltext + `" onclick="goAjax('` + indexNo;
		htmltext = htmltext + `', 'ステップ達成')">`;
		$("#change" + indexNo).append(htmltext);

		}else if(data == "getAchieveFalse"){

		$("#change" + indexNo).html("");
		var htmltext = "";
		htmltext = htmltext + `<img src="/killerQueen/img/circle_icon/circle.png" width="30px" value="ステップ未達成" class="reaction_white" id="steps_achieve` + indexNo;
		htmltext = htmltext + `" onclick="goAjax('` + indexNo;
		htmltext = htmltext + `', 'ステップ未達成')">`;
		$("#change" + indexNo).append(htmltext);

		}else {
		document.getElementById("test" + indexNo).innerText = "失敗";
		}
	  })
	   //非同期通信が失敗したときの処理
	  .fail(function() {
		//失敗とアラートを出す
		alert("失敗！");
	  });
}
</script>
<!--  <script src="/killerQueen/js/my_list.js" charset="utf-8"></script>-->
</html>