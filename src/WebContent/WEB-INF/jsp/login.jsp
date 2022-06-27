
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="icon" href="/killerQueen/img/webicon.png">
<link rel="stylesheet" type="text/css" href="/killerQueen/css/login.css">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
</head>

<body>

<div class="left">
	<img src="/killerQueen/img/back/login_left.png" class="left img1">
</div>

<div class="main">
	<img src="/killerQueen/img/back/login_logo.png" class="main login_logo">

	<hr>

	<img src="/killerQueen/img/back/login_icon.png" class="main login_icon">

	<form method="POST" action="/killerQueen/LoginServlet">

		<table>
			<tr>
				<td class="main under_line">
					<span>　  id　　　  </span><input type="text" name="id" required minlength="1" maxlength="10" class="main text-box">
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td class="under_line">
					<span>password　</span><input type="password" name="pw" required minlength="4" maxlength="10" class="main text-box">
				</td>
			</tr>
		</table>

		<p>${result.message}</p>
		<input type="submit" name="login" value="ログイン" class="main login_button">
	</form>
	<p class="main p">新規登録は<a href="/killerQueen/RegistServlet">こちら</a></p>
</div>

<div class="right">
	<img src="/killerQueen/img/back/login_right.png" class="right img2">
</div>

</body>
</html>