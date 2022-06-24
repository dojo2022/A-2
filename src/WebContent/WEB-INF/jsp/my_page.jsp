<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/search_result.css">
<link rel="stylesheet" type="text/css" href="/killerQueen/css/my_page.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<main>
<table>
<tr>
	<td rowspan="3">
		<div class="my_icon">
		<c:if test="${icon==0}">
		<img src="/killerQueen/img/icon/userIcon.png" width="50px">
		</c:if>
		<c:if test="${icon==1}">
		<img src="/killerQueen/img/icon/man.png" width="50px">
		</c:if>
		<c:if test="${icon==2}">
		<img src="/killerQueen/img/icon/woman.png" width="50px">
		</c:if>
		</div>
	</td>
	<td>${name}</td>
	<td><a href="SettingServlet"><img src="/killerQueen/img/icon/setting.png" width="20px"></a></td>
</tr>
<tr>
	<td colspan="2">
		${comment}
	</td>
</tr>
<tr>
	<td>
		<c:if test="${countAchieve<=10}">
		<progress id="myProgress" value="${countAchieve}" max="10">${countAchieve}</progress>
		</c:if>
		<c:if test="${countAchieve>10 && countAchieve<=50}">
		<progress id="myProgress" value="${countAchieve-10}" max="40">${countAchieve}</progress>
		</c:if>
		<c:if test="${countAchieve>50 && countAchieve<=99}">
		<progress id="myProgress" value="${countAchieve-50}" max="50">${countAchieve}</progress>
		</c:if>
		<c:if test="${countAchieve>99}">
		<progress id="myProgress" value="100" max="100">${countAchieve}</progress>
		</c:if>
	</td>
	<td>
		<c:if test="${countAchieve<=10}">
		<img src="/killerQueen/img/icon/beginner.png" width="30px">
		</c:if>
		<c:if test="${countAchieve>10 && countAchieve<=50}">
		<img src="/killerQueen/img/icon/bronze.png" width="30px">
		</c:if>
		<c:if test="${countAchieve>50 && countAchieve<=99}">
		<img src="/killerQueen/img/icon/silver.png" width="30px">
		</c:if>
		<c:if test="${countAchieve>99}">
		<img src="/killerQueen/img/icon/gold.png" width="30px">
		</c:if>
	</td>
</tr>
</table>


--------------------------------------------------------<br>
<c:forEach var="t" items="${myPageList}" varStatus="status">
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
					<th><img src="/killerQueen/img/circle_icon/add.png"></th>
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
<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>
</body>
</html>