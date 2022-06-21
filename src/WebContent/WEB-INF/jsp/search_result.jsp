<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>


<style>
body { background-color: #C0C8D5; }
h1 { text-align:center;}
.search {
	margin-left: auto;
 	margin-right: auto; }

/* アコーディオンメニュー */
nav{ display: none; }
.nav-open{
	padding: 15px;
	font-size: 20px;
	position: relative;
}
.nav-open::before{/* 閉じている時 */
	content: "＋";
	position: absolute;
	right: 20px;
}
.nav-open.active::before{/* 開いている時 */
	content: "－";
}

/* 宣言リスト */
.list {
	background-color: #FFFFFF;
	border			: 1px solid;
	border-radius	: 20px;
	border-color	: #8989ff;
	margin-left		: 100px;
	margin-right	: 130px;
	margin-top		: 50px;
	padding			: 40px;
	box-shadow		: 6px 6px 5px #7f7fff;
	}
</style>

<!--  アコーディオンメニューのjQuery -->
<script src="js/jquery-1.12.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(function(){
		$('.nav-open').click(function(){
			$(this).toggleClass('active');
			$(this).next('nav').slideToggle();
		});
	});
</script>


</head>
<body>

<main>

<h1>検索結果</h1>
<hr>

	<form method="POST" action="/killerQueen/SearchServlet">
		<table class="search">
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

<c:forEach var="p" items="${pageList}">
<div class="list">
	<p class="nav-open">
			${p.usersIcon}
			# ${p.decsTag}
			${p.decsDeclaration}
		</p>

		<nav>
		<ul>
			<c:forEach var="s" items="${stepList}" >
				<c:if test="${p.decsId == s.declarationId }">
				<li>${s.achieveFlag} ${s.step}</li>
			</c:if>
			</c:forEach>
		</ul>
		</nav>
</div>
</c:forEach>

</main>

</body>
</html>