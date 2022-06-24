'use strict'

function goAjax(indexNo){
			//入力値を取得してくる
			let decsId = document.getElementById('decsId' + indexNo).value;
			let buttonStatus = document.getElementById('reaction' + indexNo).value;

			//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
			let postData = {data1:decsId,data2:buttonStatus}


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
            	//alert("成功");

				if(data == "inReactTrue"){
				$("#change" + indexNo).html("");
				var htmltext = "";
				htmltext = htmltext + `<input type="image" src="/killerQueen/img/icon/redHeart.png" value="リアクションしてる" class="reaction_red" id="reaction` + indexNo;
				htmltext = htmltext + `" onclick="goAjax('` + indexNo;
				htmltext = htmltext + `')">`;
				$("#change" + indexNo).append(htmltext);

				}else if(data == "delReactTrue"){

				$("#change" + indexNo).html("");
				var htmltext = "";
				htmltext = htmltext + `<input type="image" src="/killerQueen/img/icon/whiteHeart.png" value="リアクションしてない" class="reaction_white" id="reaction` + indexNo;
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


function goBook(indexNo){
			//入力値を取得してくる
			let decsId = document.getElementById('decsId' + indexNo).value;
			let bookStatus = document.getElementById('bookmark' + indexNo).value;

			//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
			let postData = {data1:decsId,data2:bookStatus}


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
            	//alert("成功");

				if(data == "inBookTrue"){

				$("#changeBook" + indexNo).html("");
				var htmltext = "";
				htmltext = htmltext + `<input type="image" src="/killerQueen/img/icon/bookmarkBlack.png" value="ブックマークしてる" class="bookmark_button"id="bookmark` + indexNo;
				htmltext = htmltext + `" onclick="goBook('` + indexNo;
				htmltext = htmltext + `')">`;
				$("#changeBook" + indexNo).append(htmltext);

				}else if(data == "delBookTrue"){

				$("#changeBook" + indexNo).html("");
				var htmltext = "";
				htmltext = htmltext + `<input type="image" src="/killerQueen/img/icon/bookmarkWhite.png" value="ブックマークしてない" class="bookmark_button" id="bookmark` + indexNo;
				htmltext = htmltext + `" onclick="goBook('` + indexNo;
				htmltext = htmltext + `')">`;
				$("#changeBook" + indexNo).append(htmltext);

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
