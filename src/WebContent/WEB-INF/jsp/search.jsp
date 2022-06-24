<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索</title>

<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<style>
/* ----------あいまい検索機能---------- */

body {
  font-family: "Meiryo UI";
}
/* あいまい検索 */
.search {
	margin-top  : 30px; /* 間隔調整 */
	margin-left	: auto; /* 中央揃え */
 	margin-right: auto; /* 中央揃え */
}

/* 検索ボックス */
.search_box {
	width		  : 450px; /* サイズ */
	height		  : 30px;  /* サイズ */
	border		  : 1.5px solid; /* 枠線 */
	border-color  : var(--mono-color);/* 枠線の色 */
	border-radius : 8px; /* 枠線の丸み */
	font-size	  : 100%; /* 入力文字サイズ */
}

/* 検索ボタン */
.search_button {
 	width		: 35px; /* サイズ */
	height		: 35px; /* サイズ */
	margin-left : 20px; /* 間隔調整 */
}


.tag_search {
	margin-top		: 35px;  /* 間隔調整 */
	margin-left		: auto;  /* 中央揃え */
	margin-right	: auto;  /* 中央揃え */
}

.tag_search button {
width: 250px;
height: 110px;
margin: 10px 10px 10px 10px;
	background-color: #FFFFFF;/* 背景を白 */
	border			: 1px solid; /* 枠線 */
	border-color	: var(--mono-color);;/* 枠線の色 */
	border-radius	: 20px;   /* 枠線に丸み */
	box-shadow		: 6px 6px 5px var(--sub-color); /* 影 */
}

/* 宣言リストをhover */
.tag_search button:hover {
	box-shadow		: 0 2px 3px rgba(0, 0, 0, 0.3); /* 影の色変わる */
}

.tag_search img {
	float: left;
	width		: 60px; /* サイズ */
	height		: 60px;
	margin-top: 12px;
	margin-left: 20px;
	margin-right: 5px;

}

.tag_img img{
	width		: 40px; /* サイズ */
	height		: 40px;
}

.tag_search p{
	font-size		: 20px; /* 文字サイズ */
	font-style		: italic; /* 文字の種類 */
	margin-top: 35px;
}

</style>
</head>
<body>
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
		<p>#勉強</p>
		</button>
	</td>

	<td>
		<button name="work" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/work.png">
		<p>#仕事</p>
		</button>
	</td>

	<td>
		<button name="hobby" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/tag_hobby.png" class="tag_img">
		<p>#趣味</p>
		</button>
	</td>
	</tr>

	<tr>
	<td>
		<button name="diet" onClick="goSubmit(this.form, this)">
		<div class="tag_img"><img src="/killerQueen/img/tag_icon/tag_diet.png"></div>
		<p>#ダイエット</p>
		</button>
	</td>

	<td>
		<button name="exercise" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/tag_exercise.png">
		<p>#運動</p>
		</button>
	</td>

	<td>
		<button name="health" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/tag_health.png">
		<p>#健康</p>
		</button>
	</td>
	</tr>

	<tr>
	<td>
		<button name="beauty" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/tag_beauty.png">
		<p>#美容</p>
		</button>
	</td>

	<td>
		<button name="ordinary" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/tag_everyday.png">
		<p>#日常</p>
		</button>
	</td>

	<td>
		<button name="others" onClick="goSubmit(this.form, this)">
		<img src="/killerQueen/img/tag_icon/tag_others.png" class="tag_img">
		<p>#その他</p>
		</button>
	</td>
	</tr>
	</table>

</form>
</main>

<script type="text/javascript">
function goSubmit(formObj, btnObj) {
formObj.action.value=btnObj.name;
formObj.submit();
}
</script>

</body>
</html>
