<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>

<style>

</style>

<script>
$(function () {
	  // タイトルをクリックすると
	  $(".js-accordion-title").on("click", function () {
	    // クリックした次の要素を開閉
	    $(this).next().slideToggle(300);
	    // タイトルにopenクラスを付け外しして矢印の向きを変更
	    $(this).toggleClass("open", 300);
	  });
	});
</script>

</head>
<body>

<main>

<h1>検索結果</h1>
<hr>

<div class="accordion">
  <div class="accordion-container">

<c:forEach var="p" items="${pageList}">
	<div class="accordion-item">
    	<div class="accordion-title js-accordion-title">
		${p.usersIcon}
		# ${p.decsTag}
		${p.decsDeclaration}
		</div>
	</div>

	<c:forEach var="s" items="${stepList}" >
		<c:if test="${p.decsId == s.declarationId }">
		<div class="accordion-content">
		${s.achieveFlag} ${s.step}
		</div>
		</c:if>
	</c:forEach>
</c:forEach>

</div>
</div>

</main>

</body>
</html>