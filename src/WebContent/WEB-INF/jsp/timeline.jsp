<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="/killerQueen/css/timeline.css">
<title>タイムライン</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/common.jsp"%>
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
				<details>
					<summary>
					宣言：${t.decsDeclaration}
					タグno:${t.decsTag}
					ユーザーid:${t.usersId}
					ユーザーアイコン:${t.usersIcon}
					</summary>
					<c:forEach var="v" items="${steper}" varStatus = "st">
						<c:if test="${t.decsId == v.declarationId}">
							<p>ステップ:${v.step}</p>
							<p>達成:${v.achieveFlag}</p>
						</c:if>
					</c:forEach>
				</details>
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
						<!--  <input type="button" value="リアクション" id="buttonId${status.index}" onclick="goAjax('${status.index}')"> -->
						<!--  <input type="button" value="ブックマーク"  class="buttonId" onclick="goAjax()"> -->
						<p id="test${status.index}">"${t.decsId}"</p>
			</td>

			<c:if test="${status.index % 1 != 0}">
				</tr>
			</c:if>

		</c:forEach>
				</tr>
	</table>
</body>
<script src="/killerQueen/js/timeline.js" charset="utf-8"></script>
</html>