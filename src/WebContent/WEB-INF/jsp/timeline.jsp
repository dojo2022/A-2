<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/killerQueen/css/timeline.css">
<title>タイムライン</title>
</head>
<body id="top">
<%@ include file="/WEB-INF/jsp/common.jsp"%>

<table id="select_tag">
<tr>
	<!-- タイムラインとブックマークのリンク -->
	<th bgcolor="#4b4b4b" width="300" height="30"><a href ="/killerQueen/TimelineServlet" id ="at">タイムライン</a>
	<th bgcolor="#C6BEBA" width="300" height="30"><a href ="/killerQueen/BookmarkServlet" id ="ab">ブックマーク</a>
</tr>
</table>

<main>

<!-- リストのひとかたまり -->
<c:forEach var="t" items="${timelineList}" varStatus="status">
	<div class ="list">

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
						<input type="image" src="/killerQueen/img/icon/whiteHeart.png" width="30px" value="リアクションしてない" id="reaction${status.index}" onclick="goAjax('${status.index}')">
					</div>
				</c:if>
				<c:if test="${t.reactionsId != 0}">
					<div id="change${status.index}">
						<input type="image" src="/killerQueen/img/icon/redHeart.png" width="30px" value="リアクションしてる" id="reaction${status.index}" onclick="goAjax('${status.index}')">
					</div>
				</c:if>
			</div>

			<div class="achieve_rate">
			<c:forEach var="s" items="${steper}" >
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

	<!-- ステップリスト -->
	<nav class="step_list">
		<ul>
			<c:forEach var="s" items="${steper}" >
			<c:if test="${t.decsId == s.declarationId }">

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
			</c:forEach>
		</ul>
	</nav>
</div>
</c:forEach>
<!-- リストのひとかたまりここまで -->

</main>

</body>
<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>
</html>