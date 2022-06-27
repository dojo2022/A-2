<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>共通画面</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/common.css">
</head>

	<% String js = ""; %>

	<c:if test="${themecolor == 0}">
		<% js = "changeTheme0()"; %>
	</c:if>
	<c:if test="${themecolor == 1}">
		<% js = "changeTheme1()"; %>
	</c:if>
	<c:if test="${themecolor == 2}">
		<% js = "changeTheme2()"; %>
	</c:if>
	<c:if test="${themecolor == 3}">
		<% js = "changeTheme3()"; %>
	</c:if>
	<c:if test="${themecolor == 4}">
		<% js = "changeTheme4()"; %>
	</c:if>


<body onLoad="<%=js %>">

<header>
	<a href="/killerQueen/MyListServlet"><img src="/killerQueen/img/logo/logo.png" class="logo"></a>
</header>

<div class="menu">
  <div class="line-list" id="js-hamburger">
    <span></span>
    <span></span>
    <span></span>
  </div>
  <div class="menu-bg" id="js-menu-bg"></div>
  <nav class="global-nav">
    <ul class="link-list">
    		<c:if test="${icon == 0}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/user_icon/user_boy.png" class="user_icon"></a></li>
			</c:if>
			<c:if test="${icon == 1}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/user_icon/user_man1.png" class="user_icon"></a></li>
			</c:if>
			<c:if test="${icon == 2}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/user_icon/user_man2.png" class="user_icon"></a></li>
			</c:if>
			<c:if test="${icon == 3}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/user_icon/user_woman1.png" class="user_icon"></a></li>
			</c:if>
			<c:if test="${icon == 4}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/user_icon/user_woman2.png" class="user_icon"></a></li>
			</c:if>

			<li class="li"><a href="/killerQueen/MyListServlet">マイリスト</a></li>
			<li class="li"><a href="/killerQueen/TimelineServlet">タイムライン</a></li>
			<li class="li"><a href="/killerQueen/BookmarkServlet">ブックマーク</a></li>
			<li class="li"><a href="/killerQueen/SearchServlet">検索</a></li>
			<li class="li"><a href="/killerQueen/HelpServlet">ヘルプ</a></li>
			<li class="li"><a href="/killerQueen/LogoutServlet">ログアウト</a></li>
		</ul>
	</nav>
</div>
</body>
<script src="/killerQueen/js/common.js" charset="utf-8"></script>
</html>