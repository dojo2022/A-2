
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
		<form method="POST" action="SettingServlet">
			<p>アイコン</p>
			<div class="radio">
				<input id="radio-1" class="display" type="radio" name="icon" value= 0>
				<label for="radio-1" class="radio-label">
					<img src="/killerQueen/img/icon/userIcon.png">
				</label>
			</div>
			<div class="radio">
				<input id="radio-2" class="display" type="radio" name="icon" value= 1>
				<label for="radio-2" class="radio-label">
					<img src="/killerQueen/img/icon/man.png">
				</label>
			</div>
			<div class="radio">
				<input id="radio-3" class="display" type="radio" name="icon" value= 2>
				<label for="radio-3" class="radio-label">
					<img src="/killerQueen/img/icon/woman.png">
				</label>
			</div>
			<br>
			名前<input type="text" name="name"  required>
			<br>
			ひとこと<input type="text" name="comment">
			<br>
			<p>テーマカラー</p>
			<div class="color">
				<input id="color-1" class="display" type="radio" name="themecolor" value= 0>
				<label for="color-1" class="color-label">
					<img src="/killerQueen/img/icon/gleenHeart.png">
				</label>
			</div>
			<div class="color">
				<input id="color-2" class="display" type="radio" name="themecolor" value= 1>
				<label for="color-2" class="color-label">
					<img src="/killerQueen/img/icon/redHeart.png">
				</label>
			</div>
			<div class="color">
				<input id="color-3" class="display" type="radio" name="themecolor" value= 2>
				<label for="color-3" class="color-label">
					<img src="/killerQueen/img/icon/yellowHeart.png">
				</label>
			</div>
			<br>
			<p>${result.message}</p>
			<br>
			<a href="/killerQueen/MyPageServlet">戻る</a>
			<input type="submit" name="submit" value="変更">
		</form>
	</body>
</html>