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

<a href="SettingServlet">設定！！</a>


<c:forEach var="t" items="${myPageList}" >
<details>
	<summary><%int step=0; %><%int achieve=0; %>
		「アイコン
		<c:if test="${icon==0}">
		0の画像
		</c:if>
		<c:if test="${icon==1}">
		1の画像
		</c:if>
		<c:if test="${icon==2}">
		2の画像
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
		<img src="/killerQueen/img/icon/achievement.png">
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
</html>