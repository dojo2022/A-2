<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>共通画面</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/common.css">
</head>


<body>

	<% String js = ""; %>

	<c:if test="${theme == 0}">
		<% js = "changeTheme0()"; %>
	</c:if>
	<c:if test="${theme == 1}">
		<% js = "changeTheme1()"; %>
	</c:if>
	<c:if test="${theme == 2}">
		<% js = "changeTheme2()"; %>
	</c:if>

<div onLoad="<%=js %>">
<header>
    <div class="my_list_logo">
      <a href="/killerQueen/MyListServlet">
        <img src="/killerQueen/img/logo/logo.png" class="logo">
      </a>
    </div>
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
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/icon/userIcon.png"></a></li>
			</c:if>
			<c:if test="${icon == 1}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/icon/man.png"></a></li>
			</c:if>
			<c:if test="${icon == 2}">
				<li><a href="/killerQueen/MyPageServlet"><img src="/killerQueen/img/icon/woman.png"></a></li>
			</c:if>
			<li><a href="/killerQueen/MyListServlet">マイリスト</a></li>
			<li><a href="/killerQueen/TimelineServlet">タイムライン</a></li>
			<li><a href="/killerQueen/BookmarkServlet">ブックマーク</a></li>
			<li><a href="/killerQueen/SearchServlet">検索</a></li>
			<li><a href="/killerQueen/HelpServlet">ヘルプ</a></li>
			<li><a href="/killerQueen/LogoutServlet">ログアウト</a></li>
		</ul>
	</nav>
</div>
</div>
</body>
<script src="/killerQueen/js/common.js" charset="utf-8"></script>
</html>