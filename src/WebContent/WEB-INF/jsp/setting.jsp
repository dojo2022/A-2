
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>設定</title>
		<link rel="icon" href="/killerQueen/img/webicon.png">
		<link rel="stylesheet" href="/killerQueen/css/setting.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/common.jsp" %>
		<main>
			<form method="POST" action="SettingServlet">
				<table>
					<tr>
						<th>アイコン</th>
						<td>
							<% String icon0="";
							String icon1="";
							String icon2="";
							String icon3="";
							String icon4="";%>

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

							<input type="radio" <%=icon0 %> name="icon" value= 0 id="radio-1" class="display">
							<label for="radio-1" class="radio-label">
								<img src="/killerQueen/img/user_icon/user_boy.png" class="radio_circle">
							</label>

							<input type="radio" <%=icon1 %> name="icon" value= 1 id="radio-2" class="display">
							<label for="radio-2" class="radio-label">
								<img src="/killerQueen/img/user_icon/user_man1.png" class="radio_circle">
							</label>

							<input type="radio" <%=icon2 %> name="icon" value= 2 id="radio-3" class="display">
							<label for="radio-3" class="radio-label">
								<img src="/killerQueen/img/user_icon/user_man2.png" class="radio_circle">
							</label>

							<input type="radio" <%=icon3 %> name="icon" value= 3 id="radio-4" class="display">
							<label for="radio-4" class="radio-label">
								<img src="/killerQueen/img/user_icon/user_woman1.png" class="radio_circle">
							</label>

							<input type="radio" <%=icon4 %> name="icon" value= 4 id="radio-5" class="display">
							<label for="radio-5" class="radio-label">
								<img src="/killerQueen/img/user_icon/user_woman2.png" class="radio_circle">
							</label>
						</td>
					</tr>

					<tr></tr>

					<tr>
						<th>名前</th>
						<td><input type="text" name="name" required value="${name}" minlength="1" maxlength="10" class="text-box name"></td>
					</tr>

					<tr></tr>

					<tr>
						<th>ひとこと</th>
						<td><textarea name="comment" maxlength="30" class="text-box comment">${comment}</textarea></td>
					</tr>

					<tr></tr>

					<tr>
						<th>テーマカラー</th>
						<td>
							<% String color0 = "";
							String color1 = "";
							String color2 = "";
							String color3 = "";
							String color4 = "";%>

							<c:if test="${themecolor == 0}">
								<% color0 = "checked"; %>
							</c:if>
							<c:if test="${themecolor == 1}">
								<% color1 = "checked"; %>
							</c:if>
							<c:if test="${themecolor == 2}">
								<% color2 = "checked"; %>
							</c:if>
							<c:if test="${themecolor == 3}">
								<% color3 = "checked"; %>
							</c:if>
							<c:if test="${themecolor == 4}">
								<% color4 = "checked"; %>
							</c:if>


							<input type="radio" <%=color0 %> name="themecolor" value= 0 id="color-0" class="display">
							<label for="color-0" class="color-label">
								<img src="/killerQueen/img/themecolor/themecolor0.png" class="color" onclick="changeTheme0()">
							</label>

							<input type="radio" <%=color1 %> name="themecolor" value= 1 id="color-1" class="display">
							<label for="color-1" class="color-label">
								<img src="/killerQueen/img/themecolor/themecolor1.png" class="color" onclick="changeTheme1()">
							</label>

							<input  type="radio" <%=color2 %> name="themecolor" value= 2 id="color-2" class="display">
							<label for="color-2" class="color-label">
								<img src="/killerQueen/img/themecolor/themecolor2.png" class="color" onclick="changeTheme2()">
							</label>

							<input  type="radio" <%=color3 %> name="themecolor" value= 3 id="color-3" class="display">
							<label for="color-3" class="color-label">
								<img src="/killerQueen/img/themecolor/themecolor3.png" class="color" onclick="changeTheme3()">
							</label>

							<input  type="radio" <%=color4 %> name="themecolor" value= 4 id="color-4" class="display">
							<label for="color-4" class="color-label">
								<img src="/killerQueen/img/themecolor/themecolor4.png" class="color" onclick="changeTheme4()">
							</label>

						</td>
					</tr>
				</table>
				<br>
				<p>${result.message}</p>
				<button class="button back"><a href="/killerQueen/MyPageServlet">戻る</a></button>
				<input type="submit" name="submit" value="変更" class="button change">
			</form>
		</main>
	</body>
</html>