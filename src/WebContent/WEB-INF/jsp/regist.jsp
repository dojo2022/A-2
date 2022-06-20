<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>ユーザー登録</title>
</head>
<body>
	name：<input type="text" name="name" id="regist_name"><br>
	id：<input type="text" name="id" id="regist_id"><br>
	password：<input type="text" name="pw" id="regist_password">
	<input type="button" value="登録" onclick="goAjax()">
	<div id="message"></div>

<script src="/killerQueen/js/regist.js" charset="utf-8"></script>
</body>
</html>