
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>設定</title>
		<link rel="stylesheet" href="/killerQueen/css/setting.css">
	</head>
	<body>
		<form>
			<div class="radio">
				<input id="radio-1" class="display" type="radio" name="radio" value= 0>
				<label for="radio-1" class="radio-label">
					<img src="/killerQueen/img/icon/userIcon.png">
				</label>
			</div>
			<div class="radio">
				<input id="radio-2" class="display" type="radio" name="radio" value= 1>
				<label for="radio-2" class="radio-label">
					<img src="/killerQueen/img/icon/man.png">
				</label>
			</div>
			<div class="radio">
				<input id="radio-3" class="display" type="radio" name="radio" value= 2>
				<label for="radio-3" class="radio-label">
					<img src="/killerQueen/img/icon/woman.png">
				</label>
			</div>
			名前<input type="text" name="name"  required>
			<br>
			ひとこと<input type="text" name="comment">
			<br>
			<a href="/killerQueen/MyPageServlet">戻る</a>
			<input type="submit" name="submit" value="変更">
		</form>
	</body>
</html>