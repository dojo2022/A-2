<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>

<style>

/* ----------あいまい検索機能---------- */

/* あいまい検索 */
.search {
	margin-top  : 30px;
	margin-left	: auto; /* 中央揃え */
 	margin-right: auto; /* 中央揃え */
 }

/* 検索ボックス */
.search_box {
	width		: 450px; /* サイズ */
	height		: 30px;  /* サイズ */
	border-radius: 8px;
	font-size: 100%;
}

/* 検索ボタン */
.search_button {
 	width		: 35px; /* サイズ */
	height		: 35px; /* サイズ */
	margin-left : 20px; /* 間隔調整 */
}

.search_count {
	margin-left : 20px; /* 間隔調整 */
	font-size	: 20px;
}

/* ---------宣言リストのひとかたまり--------- */

/* 宣言リスト */
.list {
	display			: block; /*リストをブロック要素*/
	margin-top		: 40px;  /* 間隔調整 */
	margin-left		: auto;  /* 中央揃え */
	margin-right	: auto;  /* 中央揃え */
	padding			: 30px 40px 40px 40px; /*間隔調整*/
	width			: 700px;  /* 幅を700px */
	background-color: #FFFFFF;/* 背景を白 */
	border			: 1px solid; /* 枠線 */
	border-radius	: 20px;   /* 枠線に丸み */
	border-color	: #8989ff;/* 枠線の色 */
	box-shadow		: 6px 6px 5px #7f7fff; /* 影 */
}

/* 宣言リストをhover */
.list:hover {
	top			: -3px; /* 浮く*/
	box-shadow	: 0 2px 3px rgba(0, 0, 0, 0.3); /* 影の色変わる */
}


/* ---------アコーディオンメニュ---------- */

/* ステップリストを隠す */
nav{
	display: none;
}

.nav-open{
	position: relative;
	padding-bottom  : 70px;
}

/* 閉じているとき */
.nav-open::before{
	position: absolute;
}


/* ユーザーアイコン画像 */
.user_botton img {
	float	: left; /* 左に回り込み */
	width 	: 70px; /* サイズ */
	height 	: 70px; /* サイズ */
}

/* タグと宣言の二行 */
.decla_text {
	float		: left; /* 左に回り込み */
	margin-left : 30px; /* 間隔調整 */
}

/* タグ */
.decla_tag{
	font-size	: 18px; /* 文字サイズ */
}


.decla_tag a:link {
	color		   : #8989ff;
	text-decoration: none;
  }
.decla_tag a:visited {
	color		   : #8989ff;
	text-decoration: none;
  }

/* 宣言 */
.decla_list{
	font-weight	: bold; /* 文字太さ */
	font-size	: 22px; /* 文字サイズ */
	margin-left : 10px;
}

/* ブックマーク */
.bookmark_button {
	float		: right; /* 右に回り込み */
	width 		: 30px;  /* サイズ */
	height 		: 30px;  /* サイズ */
	margin-left : 20px;  /* 間隔調整 */
}

/* リアクション白 */
.reaction_white {
	float		: right; /* 右に回り込み */
	width 		: 30px;  /* サイズ */
	height 		: 30px;  /* サイズ */
	margin-left : 20px;  /* 間隔調整 */
	opacity		: 0.7;   /* 画像の色を薄く調整 */
}

/* リアクション赤 */
.reaction_red {
	float		: right; /* 右に回り込み */
	width 		: 30px;  /* サイズ */
	height 		: 30px;  /* サイズ */
	margin-left : 20px;  /* 間隔調整 */
}

/* ステップ達成率 */
.achieve_rate {
	float		: right; /* 右に回り込み */
	font-size	: 20px; /* 文字サイズ */
}

/* ---アコーディオンメニュ閉じている状態ここまで--- */


/* ステップリスト */
.step_list {
	clear		: both; /*回り込み解除*/
	margin-top 	: 40px; /* 間隔調整 */
}

ul{list-style: none;}

.step_list img {
	width		: 25px; /* サイズ */
	height		: 25px; /* サイズ */
	margin-top	: 10px; /* 間隔調整 */
	margin-right: 20px; /* 間隔調整 */
}

.step_achieve td {
	opacity			: 0.8; 	/* 画像の色を薄く調整 */
	text-decoration	: line-through; /* 訂正線 */
}

.top_back img {
	display: block;
	float		: right;
	width		: 50px; /* サイズ */
	height		: 50px; /* サイズ */
	margin-right: 70px;
	margin-bottom: 80px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!--  アコーディオンメニューのjQuery -->
<script src="js/jquery-1.12.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(function(){
		$('.nav-open').click(function(){
			$(this).toggleClass('active');
			$(this).next('nav').slideToggle();
		});
	});
</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<main>

<h1>検索結果</h1>
<hr>

	<!-- あいまい検索機能 -->
	<form method="POST" action="/killerQueen/SearchServlet">
		<table class="search">
		<tr>
			<td ><!-- 検索ボックス -->
				<input type="text" name="str" autocomplete="off" class="search_box">
			</td>
			<td><!-- 検索ボタン -->
				<input type="image" src="/killerQueen/img/icon/select.png" class="search_button">
			</td>
			<td><!-- 検索件数 -->
				<p class="search_count">${pageList.size()}件表示</p>
			</td>
		</tr>
		</table>
	</form>

<!-- リストのひとかたまり -->
<c:forEach var="t" items="${pageList}" varStatus="status">
<div class="list">

	<!-- アコーディオン -->
	<div class="nav-open"><%int step=0; %><%int achieve=0; %>

		<!-- ユーザーアイコン -->
		<div class="user_botton">
		<a href="/killerQueen/OtherPageServlet?${t.usersId}">
			<c:if test="${t.usersIcon==0}">
				<img src="/killerQueen/img/user_icon/user_boy.png">
			</c:if>
			<c:if test="${t.usersIcon==1}">
				<img src="/killerQueen/img/user_icon/user_man1.png">
			</c:if>
			<c:if test="${t.usersIcon==2}">
				<img src="/killerQueen/img/user_icon/user_man2.png">
			</c:if>
			<c:if test="${t.usersIcon==3}">
				<img src="/killerQueen/img/user_icon/user_woman1.png">
			</c:if>
			<c:if test="${t.usersIcon==4}">
				<img src="/killerQueen/img/user_icon/user_woman2.png">
			</c:if>
		</a>
		</div>

		<!-- タグと宣言のまとまり -->
		<div class="decla_text">
			<!-- タグ -->
			<div class="decla_tag">
			<a href="SearchServlet?${t.decsTag}">
				<c:if test="${t.decsTag == 0}">#勉強</c:if>
				<c:if test="${t.decsTag == 1}">#仕事</c:if>
				<c:if test="${t.decsTag == 2}">#趣味</c:if>
				<c:if test="${t.decsTag == 3}">#ダイエット</c:if>
				<c:if test="${t.decsTag == 4}">#運動</c:if>
				<c:if test="${t.decsTag == 5}">#健康</c:if>
				<c:if test="${t.decsTag == 6}">#美容</c:if>
				<c:if test="${t.decsTag == 7}">#日常</c:if>
				<c:if test="${t.decsTag == 8}">#その他</c:if>
			</a>
			</div>

			<!-- 宣言 -->
			<div class="decla_list">
				${t.decsDeclaration}
			</div>
		</div>

		<!-- ブックマークアイコン -->
		<div>
			<c:if test="${t.bookmarksId == 0}">
				<div id="changeBook${status.index}">
					<input type="image" src="/killerQueen/img/icon/bookmarkWhite.png" value="ブックマークしてない" class="bookmark_button" id="bookmark${status.index}" onclick="goBook('${status.index}')">
				</div>
			</c:if>
			<c:if test="${t.bookmarksId != 0}">
				<div id="changeBook${status.index}">
					<input type="image" src="/killerQueen/img/icon/bookmarkBlack.png" value="ブックマークしてる" class="bookmark_button" id="bookmark${status.index}" onclick="goBook('${status.index}')">
			</div>
			</c:if>
			<p id="test${status.index}"></p>
		</div>

		<!-- リアクションアイコン -->
		<div>
			<c:if test="${t.reactionsId == 0}">
				<div id="change${status.index}">
					<input type="image" src="/killerQueen/img/icon/whiteHeart.png" value="リアクションしてない" class="reaction_white" id="reaction${status.index}" onclick="goAjax('${status.index}')">
				</div>
			</c:if>
			<c:if test="${t.reactionsId != 0}">
				<div id="change${status.index}">
					<input type="image" src="/killerQueen/img/icon/redHeart.png" value="リアクションしてる" class="reaction_red" id="reaction${status.index}" onclick="goAjax('${status.index}')">
				</div>
			</c:if>
		</div>

		<!-- ステップ達成率 -->
		<div class="achieve_rate">
			<c:forEach var="s" items="${stepList}" >
			<c:if test="${t.decsId == s.declarationId}">
				<c:if test="${s.achieveFlag==true}">
				<%achieve++; %>
				</c:if>
				<%step++; %>
			</c:if>
			</c:forEach>
				<%=achieve %>/<%=step %>
		</div>
	</div>
	<!-- アコーディオン 閉じている状態ここまで -->

	<!-- ステップリスト -->
	<nav class="step_list">
		<ul>
			<c:forEach var="s" items="${stepList}" >
			<c:if test="${t.decsId == s.declarationId }">

		<li>
			<c:if test="${s.achieveFlag==false}">
				<table>
				<tr>
					<th>〇</th> <!-- いったん〇にしてます後で画像にします -->
					<td>${s.step}</td>
				</tr>
				</table>
			</c:if>
			<c:if test="${s.achieveFlag==true}" >
				<table class="step_achieve">
				<tr>
					<th><img src="/killerQueen/img/icon/check.png"></th>
					<td>${s.step}</td>
				</tr>
				</table>
			</c:if>
		</li>
			</c:if>
			</c:forEach>
		</ul>
	</nav>
</div>
</c:forEach>
<!-- リストのひとかたまりここまで -->

</main>


<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>

</body>
</html>