package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;
import model.Result;

@WebServlet("/SettingServlet")
public class SettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		/*
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/simpleBC/LoginServlet");
			return;
		}
		*/

		// 設定画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/setting.jsp");
		dispatcher.forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		/*
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/simpleBC/LoginServlet");
			return;
		}
		*/

	// リクエストスコープ(parameter区画)から「ユーザー名」「一言」「アイコン」「テーマカラー」を取得
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		// スペースが入力された場合は空文字にする
		name = name.replaceAll("　", ""); // 全角スペースを空文字に置換
        name = name.replaceAll(" ", ""); // 半角スペースを空文字に変換

		String comment = request.getParameter("comment");
		int icon = Integer.parseInt(request.getParameter("icon"));
		int themecolor  = Integer.parseInt(request.getParameter("themecolor"));


	// UsersDaoをインスタンス化して更新処理を行う
		// UsersDaoをインスタンス化
		UsersDao usersDao = new UsersDao();

	// 更新処理
		boolean ans = usersDao.updateUser(name, comment, icon, themecolor);

		if (ans == true) {
			// セッションスコープ(attribute区画)にidを格納する
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("comment", comment);
			session.setAttribute("icon", icon);
			session.setAttribute("themecolor", themecolor);

			// MyPageServletにリダイレクトする
			response.sendRedirect("/killerQueen/MyPageServlet");
		}

		// ログイン失敗(UsersDaoかfalseが返ってきた場合)
		else {
			// リクエストスコープ(attribute区画)にエラーメッセージを格納する
			Result result = new Result();
			result.setMessage("");
			request.setAttribute("result", result);

			// ログイン画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}






	}

}
