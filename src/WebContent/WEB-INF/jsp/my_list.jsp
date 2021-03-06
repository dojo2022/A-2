<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>マイリスト</title>
<!-- 全体的なCSSby藤井さん -->
<link rel="stylesheet" type="text/css" href="/killerQueen/css/search_result.css">
<link rel="stylesheet" type="text/css" href="/killerQueen/css/my_list.css">
<!--  アコーディオンメニューのjs -->
<script src="js/jquery-1.12.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(function(){
		$('.nav-open').click(function(){
			$(this).toggleClass('active');
			$(this).next('nav.step_list').slideToggle();
		});
	});
</script>
<link rel="icon" href="/killerQueen/img/webicon.png">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<h3>マイリスト</h3>
<!-- 宣言の数が0件の場合 -->
<c:if test="${result.message != '' }">
	<div class="result_message">
	<p>${result.message}</p>
	</div>
</c:if>
<!-- リストのひとかたまり -->
<c:forEach var="e" items="${decList }" varStatus="status">
<div class="list">
	<form method="POST" action="/killerQueen/MyListServlet">
		<!-- アコーディオン -->
		<div class="nav-open">
			<%int step=0; %><%int achieve=0; %>
			<!-- リアクション数に応じてハートマーク -->
			<c:forEach var="s" items="${reacter}" >
			<div class="user_reaction">
					<c:if test="${s.decsId == e.id}">
						<!--  リアクションに応じて画像を変えるよ:${s.countReaction}-->
						<c:if test="${s.countReaction==0}">
							<img src="/killerQueen/img/icon/whiteHeart.png" width="30px" id="white_heart">
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
			</div>
			</c:forEach>

			<!-- タグと宣言のまとまり -->
			<div class="decla_text">
				<input type="hidden" name="declaration_id" value="${e.id }">

				<!-- タグの表示：${e.tag } -->
				<div class="decla_tag">
					<a href="SearchServlet?${e.tag}">
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
					</a>
				</div>


				<!-- 宣言の表示 -->
				<div class="decla_list">
					${e.declaration}
				</div>
			</div>


			<!--  非公開：${e.privateFlag }-->
			<div class ="private_button">
				<c:if test="${e.privateFlag ==true}">
					<img src="/killerQueen/img/icon/close.png" >
				</c:if>
				<c:if test="${e.privateFlag ==false}">
					<span>
						<!-- <img src="/killerQueen/img/icon/open.png" width="30px"> -->
					</span>
				</c:if>
			</div>
			<!-- 編集ボタン -->
			<div class="edit_button">
				<img src="/killerQueen/img/icon/edit.png" width="30px" id="open_modal2${status.index}" name="open_modal_btn2" onclick="disp('${status.index}')" class="edit_text">
				<p class="edit_h">編集画面を表示</p>
			</div>

			<!--ステップ達成率の表示  -->
			<div class="achieve_rate">
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
			</div>

		</div>
		<!-- アコーディオン 閉じている状態 -->


		<!-- ステップの表示 -->
		<nav class="step_list">
			<ul>
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
							<!-- 非公開選択ボタン -->
							<li>
								<c:if test="${t.stepsAchieveFlag == false }">
									<table>
										<tr>
											<th>
												<div id="change${step_ac.index}" class="aj">
													<img src="/killerQueen/img/circle_icon/circle.png" width="20px"  id="step_achieve_flag${step_ac.index}" onclick="goAjax('${step_ac.index}', 'ステップ未達成')" >
												</div>
											</th>
											<td>
												${t.stepsStep}
											</td>
										</tr>
									</table>
								</c:if>
								<c:if test="${t.stepsAchieveFlag == true }">
									<table id="step_achieve">
										<tr>
											<th>
												<div id="change${step_ac.index}" class="aj">
													<img src="/killerQueen/img/circle_icon/check.png" width="20px" id="step_achieve_flag${step_ac.index}" onclick="goAjax('${step_ac.index}', 'ステップ達成')" >
												</div>
											</th>
											<td>
												${t.stepsStep}
											</td>
										</tr>
									</table>
								</c:if>
							</li>
						</c:if>
					</c:if>
				</c:forEach>
			</ul>
			<div class="step_submit">
				<input type="submit" value="達成" name="bt" onclick="return confirm('この宣言とステップを達成します。よろしいですか？(達成済み宣言はマイページに表示されます。)');">
				<input type="submit" value="削除" name="bt" onclick="return confirm('この宣言とステップを削除します。よろしいですか？(どこにも残りません)');">
			</div>
		</nav>
	</form>
</div>
</c:forEach>
<!-- リストのひとかたまり -->


<!-- 宣言＆ステップの新規登録 -->
<div class="regist_bt_m">
	<img src="/killerQueen/img/circle_icon/regist.png" id="open_modal" name="open_modal_btn" class="regist_text">
	<p class="regist_h">新規登録画面へ</p>
</div>
<form method="POST" action="/killerQueen/MyListServlet">
	<div id="resist_modal" class="modal">
		 <div class="modal_content">
		 	<span class="close"><img src="/killerQueen/img/icon/batsu.png"></span>
		 	<div class="modal_body">
		 		<!-- タグ選択のプルダウン -->
		 		<div id="new_decla_text">
		 			<div class="tag_bt">
			 			<select name="tag">
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
		 			  </div>
			 		<!--  <input type = "text" name="tag">-->
			 		<!-- 宣言の入力 -->
					<div class="input_dec">
						<input type = "text" name="declaration" placeholder="宣言を入力してね" required maxlength="20">
					</div>

					<!-- 非公開選択ボタン -->
					<div class="private_edit">
						<input type = "checkbox" name="private_flag" value="true" id="pvf">
						<label for="pvf">
							<img src="/killerQueen/img/icon/open.png" width="30px" id="pv_img" onclick="change()">
						</label>
					</div>

					<!-- ステップの新規登録 -->
					<div id="target" class="target">
						<img src="/killerQueen/img/circle_icon/circle.png"><input type = "text" name="step1" id="inputform_1" placeholder="ステップを入力してね(任意)" maxlength="100"><br>
					</div>
					<input type="hidden" name="count" value="1" id="count">
					<div class="step_add">
						<img src="/killerQueen/img/circle_icon/add.png"onclick="addForm()">
					</div>
					<div class="new_resist">
						<input type="submit" value="登録" name="bt">
					</div>
				</div>
			</div>
		</div>
	</div>
</form>





<!-- 宣言＆ステップの編集 -->
<c:forEach var="e" items="${decList }" varStatus="status">
	<form method="POST" action="/killerQueen/MyListServlet">
		<div id="edit_modal${status.index}" class="modal">
			<div class="modal_content">
				<span class="close2" onclick="batten('${status.index}')" id="close${status.index}"><img src="/killerQueen/img/icon/batsu.png"></span>
				<div class="modal_body">
					<input type="hidden" value="${status.index}" id="status_id${status.index}">
					<input type ="hidden" name="declaration_id_edit" value="${e.id }">
					<!-- タグの編集 -->
					<div id="new_decla_text">
						<div class="tag_bt">
							<select name="tag_edit" >
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
						</div>
						<!-- 宣言の編集 -->
						<div class="input_dec">
							<input type = "text" name="declaration_edit" value="${e.declaration}" required maxlength="20"><br>
						</div>
						<!-- 非公開の編集 -->
						<div class="private_edit">
							<c:choose>
								<c:when test="${e.privateFlag == false }">
									<input type = "checkbox" name="private_flag_edit" value="true" id="pv_edit${status.index }"><br>
									<label for="pv_edit${status.index }">
										<img src="/killerQueen/img/icon/open.png" width="30px" id="pv_img${status.index }" onclick="changewoman(${status.index })">
									</label>
								</c:when>
								<c:otherwise>
									<input type = "checkbox" name="private_flag_edit" value="true" checked id="pv_edit${status.index }"><br>
									<label for="pv_edit${status.index }">
										<img src="/killerQueen/img/icon/close.png" width="30px" id="pv_img${status.index }" onclick="changechild(${status.index })">
									</label>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- ステップの編集 -->
						<%int countStep = 0; %>
						<div class="target">
							<c:forEach var="t" items="${pageList }" varStatus="step_status" >
								<c:if test="${t.stepsDecId == e.id }">
									<c:if test="${t.stepsStep!='' }">
									<img src="/killerQueen/img/circle_icon/circle.png"><input type = "text" name="step_edit<%=countStep %>" value="${t.stepsStep}" id="edit_form<%=countStep %>" maxlength="100"><input type="hidden" name="step_id_edit<%=countStep %>" value="${t.stepsId}"><input type="hidden" name="step_achive_flag_edit" value="${t.stepsAchieveFlag}"><input type="hidden" name="step_foreign_id<%=countStep %>" value="${t.stepsDecId }"><br>
									<%countStep++; %>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<input type="hidden" name="step_count" value="<%=countStep %>">
						<div id="target2${status.index}" class="target">
							<input type="hidden" name="all_count" value="0" id="all_count${status.index}">
						</div>
						<div class="step_add">
							<img src="/killerQueen/img/circle_icon/add.png" onclick="return addEditForm('${status.index}', <%=countStep%>)">
						</div>
						<div class="new_resist">
							<input type="submit" value="完了" name="bt"><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</c:forEach>


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
	input_data.placeholder='ステップを追加してね(任意)';
	input_data.maxlength='100';
	//alert(input_data.name);
	var step = document.createElement('img');
	step.src = '/killerQueen/img/circle_icon/circle.png';
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
	input_data.placeholder='ステップを追加してね(任意)';
	input_data.maxlength='100';
	//alert(input_data.name);
	var step = document.createElement('img');
	step.src = '/killerQueen/img/circle_icon/circle.png';
	//step.style.width='20px';
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



//非公開画像の切り替え
function change(){
	var im = document.getElementById('pv_img').src;
	if(im == '/killerQueen/img/icon/open.png'){
		im= '/killerQueen/img/icon/close.png'
	}else{
		im = '/killerQueen/img/icon/open.png';
	}


}


//編集画面のテキストボックスの追加
//新規登録の非公開ボタン切り替え
function change(){
	var im = document.getElementById('pv_img');
	im.src = "/killerQueen/img/icon/close.png";
	im.removeAttribute("onclick");
	im.setAttribute('onclick', 'changeman()');
}

function changeman(){
	var im = document.getElementById('pv_img');
	im.src = "/killerQueen/img/icon/open.png";
	im.removeAttribute("onclick");
	im.setAttribute('onclick', 'change()');
}


//編集画面の非公開ボタンの切り替え
function changewoman(indexNo){
	var im = document.getElementById('pv_img' + indexNo);
	im.src = "/killerQueen/img/icon/close.png";
	im.removeAttribute("onclick");
	var str = 'changechild(' + indexNo + ')';
	im.setAttribute('onclick', str);
}

function changechild(indexNo){
	var im = document.getElementById('pv_img' + indexNo);
	im.src = "/killerQueen/img/icon/open.png";
	im.removeAttribute("onclick");
	var str = 'changewoman(' + indexNo + ')';
	im.setAttribute('onclick', str);
}

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
	//alert('Ajaxスタート');
	let stepsAId = document.getElementById('steps_id' + indexNo).value;
	//let buttonStatus = document.getElementById('step_achieve_flag' + indexNo).value;
	//alert(stepsAId);
	//alert(imgStr);

	//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
	let postData = {data1:stepsAId,data2:imgStr}
	//alert(postData);


	//alert('非同期通信始めるよ');
	$.ajaxSetup({scriptCharset:'utf-8'});
	$.ajax({
		//どのサーブレットに送るか
		//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
		url: '/killerQueen/StepAjaxServlet',
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
    	//alert("成功");

		if(data == "getAchieveTrue"){
		$("#change" + indexNo).html("");
		var htmltext = "";
		htmltext = htmltext + `<img src="/killerQueen/img/circle_icon/check.png" width="20px" value="ステップ達成" id="step_achieve_flag` + indexNo;
		htmltext = htmltext + `" onclick="goAjax('` + indexNo;
		htmltext = htmltext + `', 'ステップ達成')">`;
		$("#change" + indexNo).append(htmltext);

		}else if(data == "getAchieveFalse"){

		$("#change" + indexNo).html("");
		var htmltext = "";
		htmltext = htmltext + `<img src="/killerQueen/img/circle_icon/circle.png" width="20px" value="ステップ未達成" id="steps_achieve` + indexNo;
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
		alert("ステップの登録に失敗しました。更新してやり直してください。");
	  });
}
</script>
<!--  <script src="/killerQueen/js/my_list.js" charset="utf-8"></script>-->
</html>