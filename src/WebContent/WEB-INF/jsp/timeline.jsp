<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>タイムライン</title>
</head>
<body>
	<div>
		<!-- タイムラインとブックマークのリンク -->
		<p><a href ="/killerQueen/TimelineServlet">タイムライン</a></p>
		<p><a href ="/killerQueen/BookmarkServlet">ブックマーク</a></p>
	</div>

  		<table>
  		<c:forEach var="t" items="${timelineList}" varStatus="status">
  			<c:if test="${status.index % 1 == 0}">
 				<tr>
  			</c:if>

			<td>
				<div>
					<details>
					<summary>
					<p>宣言：${t.decsDeclaration}</p>
					<p>タグno:${t.decsTag}</p>
					<p>ユーザーid:${t.usersId}</p>
					<p>ユーザーアイコン:${t.usersIcon}</p>
					</summary>
					<c:forEach var="v" items="${steper}" varStatus = "st">
						<c:if test="${t.decsId == v.declarationId}">
							<p>ステップ:${v.step}</p>
							<p>達成:${v.achieveFlag}</p>
						</c:if>
					</c:forEach>
					</details>
						<input type="hidden" value="${t.decsId}" name="decsId" class="decsId">
						<input type="hidden" value="${t.usersId}" name="usersId" class="usersId">
						<input type="hidden" value="${status.index}" >
						<input type="button" value="リアクション" class="buttonId" onclick="goAjax()">
						<!--  <input type="button" value="ブックマーク"  class="buttonId" onclick="goAjax()"> -->
						<div class="test">a</div>
				</div>
			</td>

			<c:if test="${status.index % 1 != 0}">
				</tr>
			</c:if>

		</c:forEach>
				</tr>
	</table>

	<script>
		function goAjax(){
			alert("functionはいったよ！");
			//入力値を取得してくる
			let index = 0;
			let usersId = document.getElementsByClassName('usersId')[index].value;
			let decsId = document.getElementsByClassName('decsId')[index].value;
			let buttonId = document.getElementsByClassName('buttonId')[index].value

			//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
			let postData = {data1:decsId,data2:usersId,data3:buttonId}


			//非同期通信始めるよ
			$.ajaxSetup({scriptCharset:'utf-8'});
			$.ajax({
				//どのサーブレットに送るか
				//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
				url: '/killerQueen/TimelineServlet',
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
            	alert("成功1");
				// 今回は上の<div id="test"></div>の中に返ってきた文字列を入れる
				document.getElementsByClassName("test")[index].innerText=data;
			  })
			   //非同期通信が失敗したときの処理
			  .fail(function() {
				//失敗とアラートを出す
				alert("失敗！");
			  });
		}
	</script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</html>