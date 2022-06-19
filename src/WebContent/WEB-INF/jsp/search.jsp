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
				<input type="text" name="str" autocomplete="off"><br>
			</td>
			<td class="search_button">
				<input type="submit" name="submit" value="検索">
			</td>
		</tr>
		</table>
	</form>
</div>

<div class="tag_search">
	<form name="tag" method="POST" action="/killerQueen/SearchServlet">
	<input type="hidden" name="action">
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