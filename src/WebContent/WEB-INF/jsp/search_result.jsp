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
ul{list-style: none;}
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
	display			: block;
	width			: 700px;
	background-color: #FFFFFF;
	border			: 1px solid;
	border-radius	: 20px;
	border-color	: #8989ff;
	margin-left		: auto;
	margin-right	: auto;
	margin-top		: 50px;
	padding			: 40px;
	box-shadow		: 6px 6px 5px #7f7fff;
}

/* hoverすると少し反応する*/
.list:hover {
	top:-3px;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.3);
}

.user_botton img {
float: left;
width : 50px;
height : 50px;
}

.decla_tag{ font-size: 15px; }
.decla_list{ font-weight:bold; }


.step_list img{
width : 25px;
height : 25px;
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

<c:forEach var="t" items="${pageList}">
<div class="list">
	<div class="nav-open">
		<div class="user_botton">
			<c:if test="${t.usersIcon==0}">
			<img src="/killerQueen/img/icon/userIcon.png">
			</c:if>
			<c:if test="${t.usersIcon==1}">
			<img src="/killerQueen/img/icon/man.png">
			</c:if>
			<c:if test="${t.usersIcon==2}">
			<img src="/killerQueen/img/icon/woman.png">
			</c:if>
		</div>

		<div class="dec">
		<div class="decla_tag">
			<c:if test="${t.decsTag == 0}">#勉強</c:if>
			<c:if test="${t.decsTag == 1}">#仕事</c:if>
			<c:if test="${t.decsTag == 2}">#趣味</c:if>
			<c:if test="${t.decsTag == 3}">#ダイエット</c:if>
			<c:if test="${t.decsTag == 4}">#運動</c:if>
			<c:if test="${t.decsTag == 5}">#健康</c:if>
			<c:if test="${t.decsTag == 6}">#美容</c:if>
			<c:if test="${t.decsTag == 7}">#日常</c:if>
			<c:if test="${t.decsTag == 8}">#その他</c:if>
		</div>

		<div class="decla_list">
			${t.decsDeclaration}
		</div>
		</div>
	</div>

	<nav class="step_list">
	<ul>
		<c:forEach var="s" items="${stepList}" >
		<c:if test="${t.decsId == s.declarationId }">

	<li>
		<c:if test="${s.achieveFlag==false}"><img src="/killerQueen/img/icon/delete.png"></c:if>
		<c:if test="${s.achieveFlag==true}"><img src="/killerQueen/img/icon/check.png"></c:if>
		${s.step}
	</li>
		</c:if>
		</c:forEach>
	</ul>
	</nav>
</div>
</c:forEach>

</main>

</body>
</html>