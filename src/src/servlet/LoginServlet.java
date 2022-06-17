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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ログイン画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// リクエストスコープ(parameter区画)からユーザーが入力した「id」「pw」を取得
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// UsersDaoをインスタンス化してログイン処理を行う
		// UsersDaoをインスタンス化
		UsersDao usersDao = new UsersDao();

		// ログイン処理
		boolean ans = usersDao.isLoginOK(id, pw);

		// ログイン成功(UsersDaoかtrueが返ってきた場合)
		if (ans == true) {
			// セッションスコープ(attribute区画)にidを格納する
			HttpSession session = request.getSession();
			session.setAttribute("id", id);

			// MyListServletにリダイレクトする
			response.sendRedirect("/killerQueen/MyListServlet");
		}

		// ログイン失敗(UsersDaoかfalseが返ってきた場合)
		else {
			// リクエストスコープ(attribute区画)にエラーメッセージを格納する
			Result result = new Result();
			result.setMessage("idかpasswordが異なります。");
			request.setAttribute("result", result);

			// ログイン画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
