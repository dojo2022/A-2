<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>

<!-- 文字フォント -->
<link rel="icon" href="/killerQueen/img/webicon.png">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">

<!-- 検索結果画面のCSS -->
<link rel="stylesheet" type="text/css" href="/killerQueen/css/search_result.css">
<!-- リアクションとブックマークのjs -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!--  アコーディオンメニューのjs -->
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
<body id="top">
<!-- 共通画面のインクルード -->
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<main>

	<!-- あいまい検索機能 -->
	<form method="POST" action="/killerQueen/SearchServlet">
		<table class="search">
		<tr>
			<td ><!-- 検索ボックス -->
				<input type="text" name="str" value = "${search}" autocomplete="off" class="search_box">
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
		<div class="my_botton">
				<a href="/killerQueen/MyPageServlet">
					<c:if test="${t.usersId == id}">
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
					</c:if>
				</a>
			</div>

			<div class="user_botton">
				<a href="/killerQueen/OtherPageServlet?${t.usersId}">
					<c:if test="${t.usersId != id}">
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
		<input type="hidden" value="${t.decsId}" name="decsId" id="decsId${status.index}">
		<input type="hidden" value="${t.usersId}" name="usersId" id="usersId${status.index}">
		<div class = "bookmark_div">
			<c:if test="${t.bookmarksId == 0}">
					<div id="changeBook${status.index}">
							<input type="image" src="/killerQueen/img/icon/bookmarkWhite.png" width="30px" value="ブックマークしてない" id="bookmark${status.index}" onclick="goBook('${status.index}')">
					</div>
							</c:if>
							<c:if test="${t.bookmarksId != 0}">
					<div id="changeBook${status.index}">
							<input type="image" src="/killerQueen/img/icon/bookmarkBlack.png" width="30px" value="ブックマークしてる" id="bookmark${status.index}" onclick="goBook('${status.index}')">
					</div>
							</c:if>
		</div>

		<!-- リアクションアイコン -->
		<div class ="reaction_div">
			<c:if test="${t.reactionsId == 0}">
				<div id="change${status.index}">
					<input type="image" src="/killerQueen/img/icon/whiteHeart.png" class="reaction_white" width="30px" value="リアクションしてない" id="reaction${status.index}" onclick="goAjax('${status.index}')">
				</div>
			</c:if>
			<c:if test="${t.reactionsId != 0}">
				<div id="change${status.index}">
					<input type="image" src="/killerQueen/img/icon/redHeart.png" class="reaction_red" width="30px" value="リアクションしてる" id="reaction${status.index}" onclick="goAjax('${status.index}')">
				</div>
			</c:if>
		</div>

		<!-- ステップ達成率 -->
		<div class="achieve_rate">
			<c:forEach var="s" items="${stepList}" >
			<c:if test="${t.decsId == s.declarationId}">
			<c:if test="${s.step != ''}">
				<c:if test="${s.achieveFlag==true}">
				<%achieve++; %>
				</c:if>
				<%step++; %>
			</c:if>
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
			<c:if test="${s.step != ''&& s.step != null}">
		<li>
			<c:if test="${s.achieveFlag==false}">
				<table>
				<tr>
					<th><img src="/killerQueen/img/circle_icon/circle.png"></th>
					<td>${s.step}</td>
				</tr>
				</table>
			</c:if>
			<c:if test="${s.achieveFlag==true}" >
				<table class="step_achieve">
				<tr>
					<th><img src="/killerQueen/img/circle_icon/check.png"></th>
					<td>${s.step}</td>
				</tr>
				</table>
			</c:if>
		</li>
			</c:if>
			</c:if>
			</c:forEach>
		</ul>
	</nav>
</div>
</c:forEach>
<!-- リストのひとかたまりここまで -->

</main>

<div class="top_back">
<a href="#top"><img src="/killerQueen/img/circle_icon/top.png"></a>
</div>

<!-- タイムラインjs -->
<script src="/killerQueen/js/search_result.js" charset="utf-8"></script>

</body>
</html>