package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 新規登録画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// 送信されたデータの取得
		String name = request.getParameter("data1");
		String id = request.getParameter("data2");
		String pw = request.getParameter("data3");

		// UsersDaoをインスタンス化して登録処理を行う
		// UsersDaoをインスタンス化
		UsersDao usersDao = new UsersDao();

		// 登録処理(isRegistOKメソッド)
		boolean ans = usersDao.isRegistOk(id, pw, name);

		// 登録成功(UsersDaoからtrueが返ってきた場合)
		if (ans == true) {
			String data = "true";

		}
	}
}
