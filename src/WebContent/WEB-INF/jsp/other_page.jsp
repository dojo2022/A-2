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

<p>ID: ${t.userId}</p>
<p>NAME: ${OtherPageList.userName}</p>
<p>ICON: ${OtherPageList.userIcon}</p>
<p>COMMENT: ${OtherPageList.userCommment}</p>
<p>ランクを表示したい気持ちはある</p>





<!-- 自分の宣言リストたち -->
<table>
  		<c:forEach var="t" items="${OtherPageList}" varStatus="status">
  			<c:if test="${status.index % 1 == 0}">
 				<tr>
  			</c:if>

			<td>
				<div>
					<p>宣言：${t.decsDeclaration}</p>
					<p>タグno:${t.decsTag}</p>
					<p>リアクション有無:</p>
					<p>ブックマーク有無:</p>
					<p>宣言達成のフラグ後で追加するだおいじるお</p>
					<c:forEach var="v" items="${steper}" varStatus = "st">
						<c:if test="${t.decsId == v.declarationId}">
							<p>ステップ:${v.step}</p>
							<p>達成:${v.achieveFlag}</p>
						</c:if>
					</c:forEach>
					<form method="GET" action="/killerQueen/MyPageServlet">
						<input type="hidden" value="${t.decsId}" name="">
						<input type="submit" value="詳細">
					</form>

				</div>
			</td>

			<c:if test="${status.index % 1 != 0}">
				</tr>
			</c:if>

		</c:forEach>
				</tr>
	</table>

</body>
</html>