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
        <img src="images/sample.png">
      </a>
    </div>
</header>

<div class="hamburgar">
	<h1 class = "my_page">
		<a href="/killerQueen/MyPageServlet"><img src="images/sample.png"></a>
	</h1>
	<ul id="nav">
		<li><a href="/killerQueen/MyListServlet">マイリスト</a></li>
		<li><a href="/killerQueen/TimelineServlet">タイムライン</a></li>
		<li><a href="/killerQueen/BookmarkServlet">ブックマーク</a></li>
		<li><a href="/killerQueen/SearchServlet">検索</a></li>
		<li><a href="/killerQueen/HelpServlet">ヘルプ</a></li>
		<li><a href="/killerQueen/LogoutServlet">ログアウト</a></li>
	</ul>
</div>

</body>
</html>