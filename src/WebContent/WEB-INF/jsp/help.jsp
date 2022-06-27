<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/killerQueen/css/help.css">
<link rel="icon" href="/killerQueen/img/webicon.png">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">

<title>ヘルプ</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/common.jsp"%>
	<main>
		<div class="line">
			<h1>
				<font size="5">ヘルプ<img src="/killerQueen/img/icon/help.png"
					width="18" height="18"></font>
			</h1>
		</div>
		<p class="toc_title">目次</p>
		<div class="list">
			<a href="#mylist">1.マイリストページの使い方</a><br> <a href="#timeline">2.タイムライン・ブックマークについて</a><br>
			<a href="#heart">3.ハートについて</a><br> <a href="#rank">4.ランクシステムについて</a><br>
			<a href="#icon">5.アイコンの種類</a><br>

		</div>
		<br>

		<hr width="800％"></hr>
		<p></p>


		<section class="wrapper">
			<div class="container">
				<div class="content">

					<h2 id="mylist">
						<font size="4">1.マイリストページの使い方</font>
					</h2>

					<div class="box">
						<div class="text">
							<p>
								●宣言とステップの追加方法<br> ①<img
									src="/killerQueen/img/icon/regist.png" width="15" height="15">を押すと宣言を登録、編集できる画面が表示されます。<br>
								②大きい目標である宣言とそれを達成するための小さい目標であるステップを追加することができます。<br> ③<img
									src="/killerQueen/img/icon/add.png" width="15" height="15">を押すとさらにステップを追加することができます。<br>
								④<img src="/killerQueen/img/icon/close.png" width="15"
									height="15">でその宣言のタイムラインへの公開、非公開を選択できます。<br>
								⑤[▼カテゴリを選ぶ]で宣言をカテゴライズすることができます。<br>
								⑥[完了ボタン]を押すと入力した宣言がマイリストに追加されます。<br>
							<p>
								●既存宣言、ステップの編集方法<br> ①<img
									src="/killerQueen/img/icon/add.png" width="15" height="15">を押すと宣言、ステップの編集画面が表示されます。<br>
								②<img src="/killerQueen/img/icon/delete.png" width="15"
									height="15">を押すと表示されているステップが削除されます。<br>
							<p>
								●宣言の達成、削除について<br> ①宣言をクリックすると宣言とそのステップの一覧が表示されます。<br>
								②削除を押すと宣言とステップがマイリストから削除されます。<br> ※マイページの軌跡からも完全に削除されます。<br>
								③達成を押すと宣言とステップがマイリストから消え、マイページの軌跡に<img
									src="/killerQueen/img/icon/achievement.png" width="15"
									height="15">が表示されます。<br>
							<p>
							<hr width="800％"></hr>
						</div>
					</div>


					<div class="container">
						<div class="content">


							<h3 id="timeline">
								<font size="4">2.タイムライン・ブックマークについて</font>
							</h3>

							<p>
							<div class="box">
								<div class="text">
									●タイムラインの使用方法<br>
									①画面上部のバーのタイムラインをクリックすると他のユーザーの宣言の一覧が表示されます。 <br>
									②スクロールで色んなユーザーの宣言を閲覧することが可能です。<br> ※タイムラインは自動更新されます。<br>
									③いいなと感じた宣言に対して<img src="/killerQueen/img/icon/whiteHeart.png"
										width="15" height="15">を押すことでリアクションをすることが出来ます。<br>
									④自分も参考にしたいと感じた宣言に対して<img
										src="/killerQueen/img/icon/bookmarkWhite.png" width="15"
										height="15">のボタンを押すことでブックマークに保存することが出来ます。<br> ⑤<img
										src="/killerQueen/img/icon/bookmarkWhite.png" width="15"
										height="15">マークをクリックするとラベルが白から黒に変わる。<br>
									●ブックマークの使用方法<br>
									⑥画面上部のバーのブックマークをクリックするとタイムラインで保存した宣言の一覧（ブックマーク一覧）が表示されます。<br>
									⑦ブックマークを消したい場合は、ブックマーク一覧の宣言にある<img
										src="/killerQueen/img/icon/bookmarkBlack.png" width="15"
										height="15">マークをクリックして削除する。<br>
									<p>
								</div>
							</div>
							<hr width="800％"></hr>
						</div>
					</div>
					<h4 id="heart">
						<font size="4">3.ハートについて</font>
					</h4>

					<p>
					<div class="box">
						<div class="text">
							●ハートの色について<br> もらったリアクションの数で<img
								src="/killerQueen/img/icon/whiteHeart.png" width="15"
								height="15">が黄、緑、赤に変化します。<br>
								★アップの条件：　白：0 / 黄色：1～4 / 緑：5～9 / 赤：10～（いいね数）<br>





							<h5 id="rank"></h5>
							<p>
							<hr width="800％"></hr>
							<font size="4">4.ランクシステムについて <br></font>





							①宣言リストの達成個数に応じてランクが付くようになっています。<br> ②ランクの分け方は以下の通りです。<br>
							ランクの名称：<img src="/killerQueen/img/icon/beginner.png" width="15"
								height="15">ビギナー / <img
								src="/killerQueen/img/icon/bronze.png" width="15" height="15">
							ブロンズ / <img src="/killerQueen/img/icon/silver.png" width="15"
								height="15"> シルバー / <img
								src="/killerQueen/img/icon/gold.png" width="15" height="15">
							ゴールド <br> ★アップの条件：～10 / 11～50 / 51～99 / 100～ (宣言リストの達成個数) <br>
						</div>
					</div>
					<div class="icon">
						<hr width="800％"></hr>
						<h5 id="icon">
						<br>
							<font size="4">5.アイコンの種類</font>
						</h5>
						<div class="table">
							<div class="parent">
								<div class="inline-block_test">
									<table>
										<tr>
											<td><img src="/killerQueen/img/circle_icon/regist.png"
												width="60" height="60">
												<h6 class="heading">宣言の追加</h6> マイリストに宣言を追加することが出来ます。<br></td>
										</tr>
									</table>
								</div>
								<div class="inline-block_test">
								<table>
									<tr>
										<td><img src="/killerQueen/img/icon/select.png"
											width="60" height="60">
											<h6 class="heading">検索</h6> 検索が出来ます。<br></td>
									</tr>
								</table>
								</div>
								<div class="inline-block_test">
								<table>
									<tr>
										<td><img src="/killerQueen/img/icon/close.png" width="60"
											height="60">
											<h6 class="heading">公開、非公開</h6> 公開、非公開設定が出来ます。<br></td>
									</tr>
								</table>
								</div>
								<div class="inline-block_test">
								<table>
									<tr>
										<td><img src="/killerQueen/img/circle_icon/add.png" width="60"
											height="60">
											<h6 class="heading">ステップの追加</h6> ステップを追加することが出来ます。<br></td>
									</tr>
								</table>
								</div>
								<div class="inline-block_test">
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
					</div>
				</div>
			</div>


		</section>

	</main>

</body>
</html>