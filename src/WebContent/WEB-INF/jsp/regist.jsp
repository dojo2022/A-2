<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/login.css">
<link rel="stylesheet" type="text/css" href="/killerQueen/css/regist.css">
</head>

<body>
	<div class="left">
		<img src="/killerQueen/img/back/r_left.png" class="left img1">
	</div>

	<div class="main">
	<img src="/killerQueen/img/back/regist_logo.png" class="main login_logo">

	<hr>

	<img src="/killerQueen/img/back/regist_icon.png" class="main login_icon">

		<form method="POST" action="/killerQueen/RegistServlet">
			<table>
				<tr>
					<td class="main under_line">
						<span>name　　</span><input type="text" name="name" id="regist_name" required minlength="1" maxlength="10" class="main text-box">
					</td>
				</tr>
				<tr></tr>
				<tr>
					<td class="under_line">
						<span>　  id　　　  </span><input type="text" name="id" id="regist_id" required minlength="1" maxlength="10" class="main text-box">
					</td>
				</tr>
				<tr></tr>
				<tr>
					<td class="under_line">
						<span>password　</span><input type="text" name="pw" id="regist_password" required minlength="4" maxlength="10" class="main text-box">
					</td>
				</tr>
			</table>
			<p>${result.message}</p>
			<input type="submit" value="登録" class="main regist_button">

		</form>

		<p>ログインは<a href="/killerQueen/LoginServlet">こちら</a></p>
	</div>

	<div class="right">
		<img src="/killerQueen/img/back/r_right.png" class="right img2">
	</div>

</body>
</html>