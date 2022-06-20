
'use strict'

function goAjax(){
	alert("functionはいったよ！");
	// 入力値を取得してくる
		let name = document.getElementById('regist_name').value;
		let id = document.getElementById('regist_id').value;
		let pw = document.getElementById('regist_password').value;

	//{変数名：中に入れるもの}みたいに書いて、複数の値をpostData変数に格納
		let registData = {data1:name,data2:id,data3:pw}


	//非同期通信始めるよ
		$.ajaxSetup({scriptCharset:'utf-8'});
		$.ajax({
			//どのサーブレットに送るか
			//ajaxSampleのところは自分のプロジェクト名に変更する必要あり。
			url: '/killerQueen/RegistServlet',
			//どのメソッドを使用するか
			type:"POST",
			//受け取るデータのタイプ
			dataType:"String",
			//何をサーブレットに飛ばすか（変数を記述）
			data: registData,
			//この下の２行はとりあえず書いてる（書かなくても大丈夫？）
			processDate:false,
			timeStamp: new Date().getTime()
		})

	//非同期通信が成功したときの処理
		.done(function(data) {
			alert("成功1");
			// 今回は上の<div id="message"></div>の中にリダイレクト予告
			document.getElementById("message").textContent = '登録完了！5秒後にログイン画面に移ります。';
			setTimeout(function () {
				window.location = '/killerQueen/LoginServlet';
			}, 5000);
		})
	 //非同期通信が失敗したときの処理
		.fail(function() {
			//失敗とアラートを出す
			alert("失敗！");
		});
}




