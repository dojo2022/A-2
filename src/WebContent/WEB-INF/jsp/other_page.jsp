<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>他ユーザーマイページ</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<table>
<tr>
	<td rowspan="3">
		<div class="my_icon">
		<c:if test="${userInfo.icon==0}">
		<img src="/killerQueen/img/icon/userIcon.png" width="40px">
		</c:if>
		<c:if test="${userInfo.icon==1}">
		<img src="/killerQueen/img/icon/man.png" width="40px">
		</c:if>
		<c:if test="${userInfo.icon==2}">
		<img src="/killerQueen/img/icon/woman.png" width="40px">
		</c:if>
		</div>
	</td>
	<td>${userInfo.name}</td>
	<td><a href="SettingServlet"><img src="/killerQueen/img/icon/setting.png" width="20px"></a></td>
</tr>
<tr>
	<td colspan="2">
		${userInfo.comment}
	</td>
</tr>
<tr>
	<td>

	</td>
	<td><c:if test="${countAchieve<=10}">
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
<!-- ユーザー情報 -->




<!-- 他ユーザーの宣言リストたち -->
<c:forEach var="t" items="${OtherPageList}"  varStatus="status">
<details>
	<summary><%int step=0; %><%int achieve=0; %>
		「
		<c:if test="${icon==0}">
		<img src="/killerQueen/img/icon/userIcon.png" width="20px">
		</c:if>
		<c:if test="${icon==1}">
		<img src="/killerQueen/img/icon/man.png" width="20px">
		</c:if>
		<c:if test="${icon==2}">
		<img src="/killerQueen/img/icon/woman.png" width="20px">
		</c:if>」


		「宣言：${t.decsDeclaration}」
		「タグ:
		<c:if test="${t.decsTag == 0}">
		#勉強
		</c:if>
		<c:if test="${t.decsTag == 1}">
		#仕事
		</c:if>
		<c:if test="${t.decsTag == 2}">
		#趣味
		</c:if>
		<c:if test="${t.decsTag == 3}">
		#ダイエット
		</c:if>
		<c:if test="${t.decsTag == 4}">
		#運動
		</c:if>
		<c:if test="${t.decsTag == 5}">
		#健康
		</c:if>
		<c:if test="${t.decsTag == 6}">
		#美容
		</c:if>
		<c:if test="${t.decsTag == 7}">
		#日常
		</c:if>
		<c:if test="${t.decsTag == 8}">
		#その他
		</c:if>」


		<c:forEach var="v" items="${steper}" varStatus = "st">
			<c:if test="${t.decsId == v.declarationId}">
					<c:if test="${v.achieveFlag==true}">
					<%achieve++; %>
					</c:if>
					<%step++; %>
			</c:if>
		</c:forEach>
		「<%=achieve %>
		/<%=step %>」

「
		<c:if test="${t.decsAchieveFlag==true}">
		<img src="/killerQueen/img/icon/achievement.png" width="30px">
		</c:if>
		<c:if test="${t.decsAchieveFlag==false}">
		未達成（この文は消す）
		</c:if>」

		<c:forEach var="s" items="${reacter}" >
			<c:if test="${s.decsId == t.decsId}">
				「
				<c:if test="${s.countReaction==0}">
				<img src="/killerQueen/img/icon/whiteHeart.png" width="30px">
				</c:if>
				<c:if test="${s.countReaction>0 && s.countReaction<=4}">
				<img src="/killerQueen/img/icon/yellowHeart.png" width="30px">
				</c:if>
				<c:if test="${s.countReaction>4 && s.countReaction<=9}">
				<img src="/killerQueen/img/icon/gleenHeart.png" width="30px">
				</c:if>
				<c:if test="${s.countReaction>9}">
				<img src="/killerQueen/img/icon/redHeart.png" width="30px">
				</c:if>」
			</c:if>
		</c:forEach>

		<input type="hidden" value="${t.decsId}" name="decsId" id="decsId${status.index}">
						<input type="hidden" value="${t.usersId}" name="usersId" id="usersId${status.index}">
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

				<!-- ブックマークアイコン -->
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
				<p id="test${status.index}">"${t.decsId}"</p>

	</summary>
		<c:forEach var="v" items="${steper}" varStatus = "st">
			<c:if test="${t.decsId == v.declarationId}">
					<c:if test="${v.achieveFlag==true}">
					「達成」ステップ:${v.step}<br>
					</c:if>
					<c:if test="${v.achieveFlag==false}">
					「未達成」ステップ:${v.step}<br>
					</c:if>
			</c:if>
		</c:forEach>
</details>
</c:forEach>





</body>
<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>
</html>