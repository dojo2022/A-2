<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>共通画面</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/common.css">
</head>
<body>

<header>
    <div class="my_list_logo">
      <a href="/killerQueen/MyListServlet">
        <img src="/killerQueen/img/logo/logo.png">
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
			<li><a href="/killerQueen/MyPageServlet"></a></li>
			<li><a href="/killerQueen/MyListServlet">マイリスト</a></li>
			<li><a href="/killerQueen/TimelineServlet">タイムライン</a></li>
			<li><a href="/killerQueen/BookmarkServlet">ブックマーク</a></li>
			<li><a href="/killerQueen/SearchServlet">検索</a></li>
			<li><a href="/killerQueen/HelpServlet">ヘルプ</a></li>
			<li><a href="/killerQueen/LogoutServlet">ログアウト</a></li>
		</ul>
	</nav>
</div>

</body>
<script src="/killerQueen/js/common.js" charset="utf-8"></script>
</html>