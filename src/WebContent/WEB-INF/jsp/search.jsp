<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索</title>

</head>
<body>

<main>

<h1>検索</h1>
<hr>

<div class="search">
	<form method="POST" action="/killerQueen/SearchServlet">
		<table>
		<tr>
			<td>
				<input type="text" name="str" autocomplete="off">
			</td>
			<td class="search_button">
				<input type="image" src="/killerQueen/img/icon/select.png"  alt="検索" value="検索" width="30" height="30">
			</td>
		</tr>
		</table>
	</form>
</div>

<div class="tag_search">
	<form method="POST" action="/killerQueen/SearchServlet">
	<input type="hidden" name="action">

	<table>
	<tr>
	<td>
		<div id = "study_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_study.png" width="60" height="60">#勉強</p>
		</div>
	</td>

	<td>
		<div id = "work_tag">
		<p><img src="/killerQueen/img/tag_icon/work.png"  width="60" height="60">#仕事</p>
		</div>
	</td>

	<td>
		<div id = "hobby_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_hobby.png"  width="60" height="60">#趣味</p>
		</div>
	</td>
	</tr>

	<tr>
	<td>
		<div id = "diet_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_diet.png" width="60" height="60">#ダイエット</p>
		</div>
	</td>

	<td>
		<div id = "exercise_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_exercise.png" width="60" height="60">#運動</p>
		</div>
	</td>

	<td>
		<div id = "health_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_health.png" width="60" height="60">#健康</p>
		</div>
	</td>
	</tr>

	<tr>
	<td>
		<div id = "beauty_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_beauty.png" width="60" height="60">#美容</p>
		</div>
	</td>

	<td>
		<div id = "ordinary_tag">
		<p><img src="/killerQueen/img/tag_icon/tag_everyday.png" width="60" height="60">#日常</p>
		</div>
	</td>

	<td>
		<div>
		<p><img src="/killerQueen/img/tag_icon/tag_others.png" width="60" height="60">#その他</p>
		</div>
	</td>
	</tr>
	</table>

		<input type="button" onClick="goSubmit(this.form, this)" name="study" value="勉強">
		<input type="button" onClick="goSubmit(this.form, this)" name="work" value="仕事">
		<input type="button" onClick="goSubmit(this.form, this)" name="hobby" value="趣味">
		<input type="button" onClick="goSubmit(this.form, this)" name="diet" value="ダイエット">
		<input type="button" onClick="goSubmit(this.form, this)" name="exercise" value="運動">
		<input type="button" onClick="goSubmit(this.form, this)" name="health" value="健康">
		<input type="button" onClick="goSubmit(this.form, this)" name="beauty" value="美容">
		<input type="button" onClick="goSubmit(this.form, this)" name="ordinary" value="日常">
		<input type="button" onClick="goSubmit(this.form, this)" name="others" value="その他">
	</form>
</div>
</main>

<script type="text/javascript">
function goSubmit(formObj, btnObj) {
formObj.action.value=btnObj.name;
formObj.submit();
}
</script>

</body>
</html>
