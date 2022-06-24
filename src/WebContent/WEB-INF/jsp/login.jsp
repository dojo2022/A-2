
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" type="text/css" href="/killerQueen/css/login.css">
</head>

<body>

	<img src="/killerQueen/img/back/login_icon.png" class="icon">

	<form method="POST" action="/killerQueen/LoginServlet">

		<table>
			<tr>
				<td>
					ID
				</td>
				<td>
					<input type="text" name="id" required minlength="1" maxlength="10" class="text-box">
				</td>
			</tr>

			<tr>
				<td>
					PW
				</td>
				<td>
					<input type="password" name="pw" required minlength="4" maxlength="10" class="text-box">
				</td>
			</tr>
		</table>
		<p>${result.message}</p>
		<input type="submit" name="login" value="ログイン" class="login_button">
	</form>

	<p>新規登録は<a href="/killerQueen/RegistServlet">こちら</a></p>
</body>
</html>