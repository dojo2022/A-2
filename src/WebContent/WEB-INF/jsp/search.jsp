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
	<div>
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

</main>

</body>
</html>