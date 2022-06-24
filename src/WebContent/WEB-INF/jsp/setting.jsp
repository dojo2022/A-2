
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>設定</title>
		<link rel="stylesheet" href="/killerQueen/css/setting.css">
	</head>
	<body>

	<%@ include file="/WEB-INF/jsp/common.jsp" %>
		<form method="POST" action="SettingServlet">
			<p>アイコン</p>

			<% String icon0="";
			String icon1="";
			String icon2="";
			String icon3="";
			String icon4="";
			%>
			<c:if test="${icon == 0}">
			<% icon0 = "checked"; %>
			</c:if>
			<c:if test="${icon == 1}">
			<% icon1 = "checked"; %>
			</c:if>
			<c:if test="${icon == 2}">
			<% icon2 = "checked"; %>
			</c:if>
			<c:if test="${icon == 3}">
			<% icon3 = "checked"; %>
			</c:if>
			<c:if test="${icon == 4}">
			<% icon4 = "checked"; %>
			</c:if>

			<div class="radio">
				<input type="radio" <%=icon0 %> name="icon" value= 0 id="radio-1" class="display">
				<label for="radio-1" class="radio-label">
					<img src="/killerQueen/img/user_icon/user_boy.png" class="radio_circle">
				</label>
			</div>
			<div class="radio">
				<input type="radio" <%=icon1 %> name="icon" value= 1 id="radio-2" class="display">
				<label for="radio-2" class="radio-label">
					<img src="/killerQueen/img/user_icon/user_man1.png" class="radio_circle">
				</label>
			</div>
			<div class="radio">
				<input type="radio" <%=icon2 %> name="icon" value= 2 id="radio-3" class="display">
				<label for="radio-3" class="radio-label">
					<img src="/killerQueen/img/user_icon/user_man2.png" class="radio_circle">
				</label>
			</div>
			<div class="radio">
				<input type="radio" <%=icon3 %> name="icon" value= 3 id="radio-4" class="display">
				<label for="radio-4" class="radio-label">
					<img src="/killerQueen/img/user_icon/user_woman1.png" class="radio_circle">
				</label>
			</div>
			<div class="radio">
				<input type="radio" <%=icon4 %> name="icon" value= 4 id="radio-5" class="display">
				<label for="radio-5" class="radio-label">
					<img src="/killerQueen/img/user_icon/user_woman2.png" class="radio_circle">
				</label>
			</div>


			<br>
			名前<input type="text" name="name" required value="${name}" minlength="1" maxlength="10">
			<br>
			ひとこと<input type="text" name="comment" value="${comment}" maxlength="30">
			<br>
			<p>テーマカラー</p>
			<% String color0 = "";
			String color1 = "";
			String color2 = "";
			%>
			<c:if test="${themecolor == 0}">
			<% color0 = "checked"; %>
			</c:if>
			<c:if test="${themecolor == 1}">
			<% color1 = "checked"; %>
			</c:if>
			<c:if test="${themecolor == 2}">
			<% color2 = "checked"; %>
			</c:if>
			<div class="color">
				<input type="radio" <%=color0 %> name="themecolor" value= 0 id="color-1" class="display">
				<label for="color-1" class="color-label">
					<img src="/killerQueen/img/themecolor/themecolor0.png" class="radio_circle">
				</label>
			</div>
			<div class="color">
				<input type="radio" <%=color1 %> name="themecolor" value= 1 id="color-2" class="display">
				<label for="color-2" class="color-label">
					<img src="/killerQueen/img/themecolor/themecolor1.png" class="radio_circle">
				</label>
			</div>
			<div class="color">
				<input  type="radio" <%=color2 %> name="themecolor" value= 2 id="color-3" class="display">
				<label for="color-3" class="color-label">
					<img src="/killerQueen/img/themecolor/themecolor2.png" class="radio_circle">
				</label>
			</div>
			<br>
			<p>${result.message}</p>
			<br>
			<a href="/killerQueen/MyPageServlet">戻る</a>
			<input type="submit" name="submit" value="変更">
		</form>
	</body>
</html>