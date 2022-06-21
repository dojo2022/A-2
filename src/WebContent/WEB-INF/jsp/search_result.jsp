<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>


<style>
nav{ display: none; }
.nav-open{
	padding: 15px;
	color: #fff;
	font-size: 20px;
	background: #2073c8;
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
</style>

</head>
<body>

<main>

<h1>検索結果</h1>
<hr>

<c:forEach var="p" items="${pageList}">
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
</c:forEach>


</main>

<script src="js/jquery-1.12.4.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(function(){
		//クリックで動く
		$('.nav-open').click(function(){
			$(this).toggleClass('active');
			$(this).next('nav').slideToggle();
		});
	});
</script>

</body>
</html>