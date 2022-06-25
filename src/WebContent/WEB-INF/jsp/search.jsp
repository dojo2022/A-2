<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索</title>

<!-- 検索結果画面のCSS -->
<link rel="stylesheet" type="text/css" href="/killerQueen/css/search.css">

</head>
<body>
<!-- 共通画面のインクルード -->
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<main>

	<!-- あいまい検索機能 -->
	<form method="POST" action="/killerQueen/SearchServlet">
		<table class="search">
		<tr>
			<td ><!-- 検索ボックス -->
				<input type="text" name="str" autocomplete="off" class="search_box">
			</td>
			<td><!-- 検索ボタン -->
				<input type="image" src="/killerQueen/img/icon/select.png" class="search_button">
			</td>
		</tr>
		</table>
	</form>


	<!-- タグ検索機能 -->
	<form method="POST" action="/killerQueen/SearchServlet">
	<input type="hidden" name="action">

		<table class="tag_search">
		<tr>
		<td>
			<button name="study" onClick="goSubmit(this.form, this)">
				<img src="/killerQueen/img/tag_icon/tag_study.png">
				<p># 勉強</p>
			</button>
		</td>

		<td>
			<button name="work" onClick="goSubmit(this.form, this)">
				<img src="/killerQueen/img/tag_icon/work.png">
				<p># 仕事</p>
			</button>
		</td>

		<td>
			<button name="hobby" onClick="goSubmit(this.form, this)">
				<div class="tag_img">
				<img src="/killerQueen/img/tag_icon/tag_hobby.png">
				</div>
				<p># 趣味</p>
			</button>
		</td>
		</tr>

		<tr>
		<td>
			<button name="diet" onClick="goSubmit(this.form, this)">
				<div class="tag_img">
				<img src="/killerQueen/img/tag_icon/tag_diet.png">
				</div>
				<p># ダイエット</p>
			</button>
		</td>

		<td>
			<button name="exercise" onClick="goSubmit(this.form, this)">
				<img src="/killerQueen/img/tag_icon/tag_exercise.png">
				<p># 運動</p>
			</button>
		</td>

		<td>
			<button name="health" onClick="goSubmit(this.form, this)">
				<img src="/killerQueen/img/tag_icon/tag_health.png">
				<p># 健康</p>
			</button>
		</td>
		</tr>

		<tr>
		<td>
			<button name="beauty" onClick="goSubmit(this.form, this)">
				<img src="/killerQueen/img/tag_icon/tag_beauty.png">
				<p># 美容</p>
			</button>
		</td>

		<td>
			<button name="ordinary" onClick="goSubmit(this.form, this)">
				<img src="/killerQueen/img/tag_icon/tag_everyday.png">
				<p># 日常</p>
			</button>
		</td>

		<td>
			<button name="others" onClick="goSubmit(this.form, this)">
				<div class="tag_img">
				<img src="/killerQueen/img/tag_icon/tag_others.png">
				</div>
				<p># その他</p>
			</button>
		</td>
		</tr>
		</table>

</form>
</main>

<script src="/killerQueen/js/search.js" charset="utf-8"></script>

</body>
</html>
