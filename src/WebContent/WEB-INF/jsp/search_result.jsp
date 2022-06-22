<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>


<style>
body { background-color: #C0C8D5; }
h1 { text-align:center;}
.search {
	margin-left: auto;
 	margin-right: auto; }

/* アコーディオンメニュー */
nav{ display: none; }
ul{list-style: none;}
.nav-open{
	font-size: 20px;
	position: relative;
	padding-bottom  : 50px;
}
.nav-open::before{/* 閉じている時 */
	position: absolute;
	right: 20px;
}


/* 宣言リスト */
.list {
	display			: block;
	width			: 700px;
	background-color: #FFFFFF;
	border			: 1px solid;
	border-radius	: 20px;
	border-color	: #8989ff;
	margin-left		: auto;
	margin-right	: auto;
	margin-top		: 50px;
	padding			: 30px 40px 40px 40px;
	box-shadow		: 6px 6px 5px #7f7fff;
}

/* hoverすると少し反応する*/
.list:hover {
	top:-3px;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.3);
}

.user_botton img {
float: left;
width : 60px;
height : 60px;
}

.dexala_text {
	float: left;
	margin-left : 30px;
}
.decla_tag{ font-size: 18px; }
.decla_list{
	font-weight:bold;
	font-size: 22px;
}
.achieve_rate { float: right; }

.reaction_white {
	float: right;
	width : 30px;
	height : 30px;
	margin-left : 20px;
	opacity: 0.7;
}

.reaction_red {
	float: right;
	width : 30px;
	height : 30px;
	margin-left : 20px;
}

.bookmark_button {
	float: right;
	width : 30px;
	height : 30px;
	margin-left : 20px;
}

.step_list {
	clear:both;  /*回り込み解除*/
	margin-top : 40px;
}

.step_list img {
	width : 25px;
	height : 25px;
	margin-top: 10px;
	margin-right: 20px;
}

.achieve_step {
	opacity: 0.8;
	text-decoration: line-through;
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

<main>

<h1>検索結果</h1>
<hr>

	<form method="POST" action="/killerQueen/SearchServlet">
		<table class="search">
		<tr>
			<td>
				<input type="text" name="str" autocomplete="off">
			</td>
			<td class="search_button">
				<input type="image" src="/killerQueen/img/icon/select.png"  alt="検索" value="検索" width="30" height="30">
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

		<!-- タグと宣言 -->
		<div class="dexala_text">
			<div class="decla_tag">
				<c:if test="${t.decsTag == 0}">#勉強</c:if>
				<c:if test="${t.decsTag == 1}">#仕事</c:if>
				<c:if test="${t.decsTag == 2}">#趣味</c:if>
				<c:if test="${t.decsTag == 3}">#ダイエット</c:if>
				<c:if test="${t.decsTag == 4}">#運動</c:if>
				<c:if test="${t.decsTag == 5}">#健康</c:if>
				<c:if test="${t.decsTag == 6}">#美容</c:if>
				<c:if test="${t.decsTag == 7}">#日常</c:if>
				<c:if test="${t.decsTag == 8}">#その他</c:if>
			</div>

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
			<input type="hidden" value="${t.decsId}" name="decsId" id="decsId${status.index}">
			<input type="hidden" value="${t.usersId}" name="usersId" id="usersId${status.index}">
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
					<th>〇</th>
					<td>${s.step}</td>
				</tr>
				</table>
			</c:if>
			<c:if test="${s.achieveFlag==true}" >
				<table>
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

</main>


<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>

</body>
</html>