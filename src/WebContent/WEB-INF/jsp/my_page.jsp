<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>
<!-- ユーザー情報 -->
<p>ID: ${id}</p>
<p>NAME: ${name}</p>

<p>ICON: ${icon}
<c:if test="${icon==0}">
0のとき<img src="/killerQueen/img/icon/userIcon.png">
</c:if>
<c:if test="${icon==1}">
1のとき<img src="/killerQueen/img/icon/man.png">
</c:if>
<c:if test="${icon==2}">
2のとき<img src="/killerQueen/img/icon/woman.png">
</c:if>
</p>

<p>COMMENT: ${commment}</p>

<p>
ランク:${countAchieve}
<c:if test="${countAchieve<=10}">
0から10まで<img src="/killerQueen/img/icon/beginner.png">
</c:if>
<c:if test="${countAchieve>10 && countAchieve<=50}">
10から50<img src="/killerQueen/img/icon/bronze.png">
</c:if>
<c:if test="${countAchieve>50 && countAchieve<=99}">
51から99<img src="/killerQueen/img/icon/silver.png">
</c:if>
<c:if test="${countAchieve>99}">
100以上だよ<img src="/killerQueen/img/icon/gold.png">
</c:if>
</p>

<p>ゲージも</p>
<a href="SettingServlet">設定！！</a>


<c:forEach var="t" items="${myPageList}" >
<details>
	<summary><%int step=0; %><%int achieve=0; %>
		宣言：${t.decsDeclaration}
		タグno:${t.decsTag}
		リアクション有無:
		ブックマーク有無:
		宣言達成:${t.decsAchieveFlag}<br>

		<c:forEach var="s" items="${reacter}" >
			<c:if test="${s.decsId == t.decsId}">
				リアクションに応じて画像を変えるよ:${s.countReaction}
				<c:if test="${s.countReaction==0}">
				ゼロだよ<img src="/killerQueen/img/icon/whiteHeart.png">
				</c:if>
				<c:if test="${s.countReaction>0 && s.countReaction<=4}">
				1から４！！<img src="/killerQueen/img/icon/yellowHeart.png">
				</c:if>
				<c:if test="${s.countReaction>4 && s.countReaction<=9}">
				５から９！！<img src="/killerQueen/img/icon/gleenHeart.png">
				</c:if>
				<c:if test="${s.countReaction>9}">
				10以上！！<img src="/killerQueen/img/icon/redHeart.png">
				</c:if>
			</c:if>
		</c:forEach>

	</summary>
		<c:forEach var="v" items="${steper}" varStatus = "st">
			<c:if test="${t.decsId == v.declarationId}">
				ステップ:${v.step}
				達成:${v.achieveFlag}
					<c:if test="${v.achieveFlag==true}">
					達成済み<br>
					<%achieve++; %>
					</c:if>
					<c:if test="${v.achieveFlag==false}">
					未達成<br>
					</c:if>
					<%step++; %>
			</c:if>
		</c:forEach>
</details>
ステップ数<%=step %>
ステップ達成<%=achieve %>
</c:forEach>


</body>
</html>