<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>他ユーザーマイページ</title>
</head>
<body>

<!-- ユーザー情報 -->

<p>ID: ${userInfo.id}</p>
<p>NAME: ${userInfo.name}</p>
<p>ICON: ${userInfo.icon}</p>
<p>COMMENT: ${userInfo.comment}</p>

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


<!-- 自分の宣言リストたち -->
<c:forEach var="t" items="${OtherPageList}">
<details>
	<summary>
		宣言：${t.decsDeclaration}<br>
		タグno:${t.decsTag}<br>
		リアクション有無:<br>
		ブックマーク有無:<br>
		宣言達成:${t.decsAchieveFlag}<br>
	</summary><%! int count = 0;%><%int localcount = 0;%>
		<c:forEach var="v" items="${steper}" varStatus = "st">
			<c:if test="${t.decsId == v.declarationId}">
				ステップ:${v.step}
				達成:${v.achieveFlag}
					<c:if test="${countAchieve==1}">
						達成済み
					</c:if>
					<c:if test="${countAchieve==0}">
						未達成
					</c:if>
			</c:if>
		</c:forEach>
</details>
</c:forEach>


</body>
</html>