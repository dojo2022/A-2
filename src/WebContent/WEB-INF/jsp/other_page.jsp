<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/killerQueen/img/webicon.png">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="js/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="/killerQueen/css/search_result.css">
<link rel="stylesheet" type="text/css" href="/killerQueen/css/my_page.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>他ユーザーマイページ</title>
<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<main>
<table class="hee">
<tr>
	<td rowspan="2" class="pro">
		<div class="my_icon">
			<c:if test="${userInfo.icon == 0}">
				<img src="/killerQueen/img/user_icon/user_boy.png" width="95px">
			</c:if>
			<c:if test="${userInfo.icon ==1}">
				<img src="/killerQueen/img/user_icon/user_man1.png" width="95px">
			</c:if>
			<c:if test="${userInfo.icon == 2}">
				<img src="/killerQueen/img/user_icon/user_man2.png" width="95px">
			</c:if>
			<c:if test="${userInfo.icon == 3}">
				<img src="/killerQueen/img/user_icon/user_woman1.png" width="95px">
			</c:if>
			<c:if test="${userInfo.icon == 4}">
				<img src="/killerQueen/img/user_icon/user_woman2.png" width="95px">
			</c:if>
		</div>
	</td>
	<td class ="user_name pro haba">${userInfo.name}</td>
	<td class="pro">
		<c:if test="${countAchieve<=10}">
		<img src="/killerQueen/img/icon/beginner.png" width="35px">
		</c:if>
		<c:if test="${countAchieve>10 && countAchieve<=50}">
		<img src="/killerQueen/img/icon/bronze.png" width="35px">
		</c:if>
		<c:if test="${countAchieve>50 && countAchieve<=99}">
		<img src="/killerQueen/img/icon/silver.png" width="35px">
		</c:if>
		<c:if test="${countAchieve>99}">
		<img src="/killerQueen/img/icon/gold.png" width="35px">
		</c:if>
	</td>
</tr>
<tr>
	<td class="comment pro" colspan="2" >
		${userInfo.comment}
	</td>
</tr>

</table>

<hr>



<c:forEach var="t" items="${OtherPageList}" varStatus="status">
<div class="list">

	<!-- アコーディオン -->
	<div class="nav-open"><%int step=0; %><%int achieve=0; %>

		<!-- 達成未達成 -->
		<div class="user_botton">
			<c:if test="${t.decsAchieveFlag==true}">
			<img src="/killerQueen/img/icon/achievement.png" width="30px">
			</c:if>
			<c:if test="${t.decsAchieveFlag==false}">
			<img src="/killerQueen/img/icon/achievement.png" class="kura" width="30px">
			</c:if>
		</div>
<!--
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
 -->


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
					<input type="image" src="/killerQueen/img/icon/whiteHeart.png" width="30px" value="リアクションしてない" id="reaction${status.index}" onclick="goAjax('${status.index}')">
				</div>
			</c:if>
			<c:if test="${t.reactionsId != 0}">
				<div id="change${status.index}">
					<input type="image" src="/killerQueen/img/icon/redHeart.png" width="30px" value="リアクションしてる" id="reaction${status.index}" onclick="goAjax('${status.index}')">
				</div>
			</c:if>
		</div>

		<!-- ステップ達成率 -->
		<div class="achieve_rate">
			<c:forEach var="v" items="${steper}">
				<c:if test="${t.decsId == v.declarationId}">
				<c:if test="${v.step !='' }">
						<c:if test="${v.achieveFlag==true}">
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
			<c:forEach var="v" items="${steper}" varStatus = "st">
				<c:if test="${t.decsId == v.declarationId}">
					<c:if test="${v.step !='' }">

		<li>
					<c:if test="${v.achieveFlag==false}">
						<table>
						<tr>
							<th><img src="/killerQueen/img/circle_icon/add.png"></th>
							<td>${v.step}</td>
						</tr>
						</table>
					</c:if>
					<c:if test="${v.achieveFlag==true}">
						<table class="step_achieve">
						<tr>
							<th><img src="/killerQueen/img/circle_icon/check.png"></th>
							<td>${v.step}</td>
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



</main>

</body>
<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>
</html>