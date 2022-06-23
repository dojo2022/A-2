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
<%@ include file="/WEB-INF/jsp/common.jsp"%>
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
		<button name="study" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_study.png" width="60" height="60">#勉強</p>
		</button>
	</td>

	<td>
		<button name="work" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/work.png" width="60" height="60">#仕事</p>
		</button>
	</td>

	<td>
		<button name="hobby" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_hobby.png" width="60" height="60">#趣味</p>
		</button>
	</td>
	</tr>

	<tr>
	<td>
		<button name="diet" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_diet.png" width="60" height="60">#ダイエット</p>
		</button>
	</td>

	<td>
		<button name="exercise" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_exercise.png" width="60" height="60">#運動</p>
		</button>
	</td>

	<td>
		<button name="health" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_health.png" width="60" height="60">#健康</p>
		</button>
	</td>
	</tr>

	<tr>
	<td>
		<button name="beauty" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_beauty.png" width="60" height="60">#美容</p>
		</button>
	</td>

	<td>
		<button name="ordinary" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_everyday.png" width="60" height="60">#日常</p>
		</button>
	</td>

	<td>
		<button name="others" onClick="goSubmit(this.form, this)">
		<p><img src="/killerQueen/img/tag_icon/tag_others.png" width="60" height="60">#その他</p>
		</button>
	</td>
	</tr>
	</table>

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
