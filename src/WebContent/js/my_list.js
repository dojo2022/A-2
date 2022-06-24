/**
 *
 */
'use strict'

function goAjax(indexNo){
			//入力値を取得してくる
			let stepsId = document.getElementById('steps_id' + indexNo).value;
			let stepsAchieveF = document.getElementById('steps_achieve' + indexNo).value;

			//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
			let postData = {data1:stepsId,data2:stepsAchieveF}


			//非同期通信始めるよ
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
				htmltext = htmltext + `<input type="image" src="/killerQueen/img/circle_icon/check.png" value="ステップ達成" class="reaction_red" id="step_achieve_flag` + indexNo;
				htmltext = htmltext + `" onclick="goAjax('` + indexNo;
				htmltext = htmltext + `')">`;
				$("#change" + indexNo).append(htmltext);

				}else if(data == "getAchieveFalse"){

				$("#change" + indexNo).html("");
				var htmltext = "";
				htmltext = htmltext + `<input type="image" src="/killerQueen/img/circle_icon/circle.png" value="ステップ未達成" class="reaction_white" id="steps_achieve` + indexNo;
				htmltext = htmltext + `" onclick="goAjax('` + indexNo;
				htmltext = htmltext + `')">`;
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