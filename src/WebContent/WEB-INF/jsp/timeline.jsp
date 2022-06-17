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
					<p><c:out value="${t.decsDeclaration}" /></p>
					<p><c:out value="${t.stepsStep}" /></p>
					<form method="POST" action="/simpleBC/bcDetailServlet">
						<input type="hidden" value="${t.reactionsDecId}" name="">
						<input type="hidden" value="${t.bookmarksUserId}" name="">
						<input type="submit" value="詳細" id="">
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