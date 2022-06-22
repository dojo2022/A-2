<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/killerQueen/css/help.css">

<title>ヘルプ</title>
</head>
<header> </header>
<body>
	<%@ include file="/WEB-INF/jsp/common.jsp"%>
	<main>
		<div class="line">
			<h1>
				ヘルプ<img src="/killerQueen/img/icon/help.png" width="28" height="28">
			</h1>
		</div>
		<p class="toc_title">目次</p>
		<div class="list">
			<a href="#mylist">1.マイリストページの使い方</a><br> <a href="#timeline">2.タイムライン・ブックマークについて</a><br>
			<a href="#heart">3.ハートについて</a><br> <a href="#rank">4.ランクシステムについて</a><br>
			<a href="#icon">5.アイコンの種類</a><br>

		</div>


		<hr width="650％"></hr>
		<p></p>


		<section class="wrapper">
			<div class="container">
				<div class="content">
					<h2 id="mylist">1.マイリストページの使い方</h2>

					<p>
						●宣言とステップの追加方法<br> ①（アイコン）を押すと宣言を登録、編集できる画面が表示されます。<br>
						②大きい目標である宣言とそれを達成するための小さい目標であるステップを追加することができます。<br>
						③（アイコン）を押すとさらにステップを追加することができます。<br>
						④（アイコン）でその宣言のタイムラインへの公開、非公開を選択できます。<br>
						⑤（アイコン→▼カテゴリを選ぶ）で宣言をカテゴライズすることができます。<br>
						⑥完了ボタンを押すと入力した宣言がマイリストに追加されます。<br>
					</p>
					<p>
						●既存宣言、ステップの編集方法<br> ①（アイコン）を押すと宣言、ステップの編集画面が表示されます。<br>
						②（アイコン）を押すと表示されているステップが削除されます。<br>
					<p>
						●宣言の達成、削除について<br> ①宣言をクリックすると宣言とそのステップの一覧が表示されます。<br>
						②削除を押すと宣言とステップがマイリストから削除されます。<br> ※マイページの軌跡からも完全に削除されます。<br>
						③達成を押すと宣言とステップがマイリストから消え、マイページの軌跡に(アイコン)が表示されます。<br>
					<p>
					<hr width="650％"></hr>

					<h3 id="timeline">2.タイムライン・ブックマークについて</h3>

					<p>
						●タイムラインの使用方法<br> ①画面上部のバーのタイムラインをクリックすると他のユーザーの宣言の一覧が表示されます。
						<br> ②スクロールで色んなユーザーの宣言を閲覧することが可能です。<br>
						※タイムラインは自動更新されます。<br> ③いいなと感じた宣言に対して♡を押すことでリアクションをすることが出来ます。<br>
						④自分も参考にしたいと感じた宣言に対して🏷（ラベル）のボタンを押すことでブックマークに保存することが出来ます。<br>
						⑤🏷（ラベル）マークをクリックするとラベルが白から黒に変わる。<br>

						●ブックマークの使用方法<br>
						⑥画面上部のバーのブックマークをクリックするとタイムラインで保存した宣言の一覧（ブックマーク一覧）が表示されます。<br>
						⑦ブックマークを消したい場合は、ブックマーク一覧の宣言にある🏷（ラベル）マークをクリックして削除する。<br>
					<p>
					<hr width="650％"></hr>
					<h4 id="heart">3.ハートについて</h4>

					<p>
						●ハートの色について<br> もらったリアクションの数で❤が黄、緑、赤に変化します。
					<h5 id="rank"></h5>
					<p>
					<hr width="650％"></hr>
					4.ランクシステムについて <br> ⅰ．宣言リストの達成個数に応じてランクが付くようになっています。<br>
					ⅱ．ランクの分け方は以下の通りです。<br> ランクの名称：ビギナー / ブロンズ / シルバー / ゴールド <br>
					★アップの条件：～10 / 11～50 / 51～99 / 100～ (宣言リストの達成個数) <br>

					<hr width="650％"></hr>
					<h5 id="icon">5.アイコンの種類</h5>
					<div class="icon">
						<table>
							<tr>
								<td><img src="/killerQueen/img/icon/regist.png" width="60"
									height="60">
								<h6 class="heading">宣言の追加</h6> マイリストに宣言を追加することが出来ます。<br></td>
							</tr>
						</table>

						<table>
							<tr>
								<td><img src="/killerQueen/img/icon/select.png" width="60"
									height="60">
								<h6 class="heading">検索</h6> d検索が出来ます。<br></td>
							</tr>
						</table>
						<table>
							<tr>
								<td><img src="/killerQueen/img/icon/close.png" width="60"
									height="60">
								<h6 class="heading">公開、非公開設定</h6> 公開、非公開設定が出来ます。<br></td>
							</tr>
						</table>

						<table>
							<tr>
								<td><img src="/killerQueen/img/icon/add.png" width="60"
									height="60">
									<h6 class="heading">ステップの追加</h6> ステップを追加することが出来ます。<br></td>
							</tr>
						</table>
						<table>
							<tr>
								<td><img src="/killerQueen/img/icon/bookmarkWhite.png"
									width="60" height="60">
									<h6 class="heading">ブックマーク</h6> ブックマークを追加することが出来ます。<br></td>
							</tr>
						</table>







					</div>
				</div>
			</div>

		</section>







	</main>

</body>
</html>