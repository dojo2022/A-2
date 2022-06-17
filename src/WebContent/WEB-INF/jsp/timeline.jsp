<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タイムライン</title>
</head>
<body>
	<div>
		<!-- タイムラインとブックマークのリンク -->
		<p><a href ="/killerQueen/TimelineServlet">タイムライン</a></p>
		<p><a href ="/killerQueen/BookmarkServlet">ブックマーク</a></p>
	</div>

  		<table>
  		<c:forEach var="t" items="${timelineList}" varStatus="status">
  			<c:if test="${status.index % 1 == 0}">
 				<tr>
  			</c:if>

			<td>
				<div>
					<p>宣言：${t.decsDeclaration}</p>
					<p>ユーザーid :${t.usersId}</p>
					<p>ユーザーアイコン:${t.usersIcon}"</p>
					<p>タグno:${t.decsTag}</p>
					<c:forEach var="v" items="${timelineList}">
						<p>ステップ:${v.stepsStep}"</p>
						<p>達成:${t.stepsAchieveFlag}</p>
					</c:forEach>
					<form method="GET" action="/killerQueen/TimelineServlet">
						<input type="hidden" value="${t.decsId}" name="">
						<input type="hidden" value="${t.usersId}" name="">
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