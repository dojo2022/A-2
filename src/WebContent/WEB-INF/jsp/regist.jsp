<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>

</head>
<body>
	<form method="POST" action="/killerQueen/RegistServlet">

		name：<input type="text" name="name" id="regist_name" required minlength="1" maxlength="10"><br>
		id：<input type="text" name="id" id="regist_id" required minlength="1" maxlength="10"><br>
		password：<input type="text" name="pw" id="regist_password" required minlength="4" maxlength="10">
		<p>${result.message}</p>
		<input type="submit" value="登録">

	</form>
</body>
</html>