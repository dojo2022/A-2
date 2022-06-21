package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import model.Result;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 新規登録画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// 必要なBeansをインスタンス化
		UsersDao usersDao = new UsersDao();
		Result result = new Result();

	// 送信されたデータの取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

	// スペースが入力された場合は空文字にする
		name = name.replaceAll("　| ", ""); // 全角半角スペースを空文字に置換
        id = id.replaceAll("　| ", ""); // 全角半角スペースを空文字に置換
        pw = pw.replaceAll("　| ", ""); // 全角半角スペースを空文字に置換


    // 空文字になってしまった場合はエラーを返す
        if (name.equals("") || id.equals("") || pw.equals("")) {

			// リクエストスコープ(attribute区画)にエラーメッセージを格納する
			result.setMessage("スペースのみでは登録できません。");
			request.setAttribute("result", result);

			// 新規登録画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
			dispatcher.forward(request, response);

        } else {

		// 登録処理を行う
			// 登録処理(isRegistOKメソッド)
			boolean ans = usersDao.isRegistOk(id, pw, name);

			// 登録成功(UsersDaoからtrueが返ってきた場合)
			if (ans == true) {
				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				result.setMessage("登録完了です！ログインをしましょう！");
				request.setAttribute("result", result);

				// 新規登録画面にフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
				dispatcher.forward(request, response);

			} else {

				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				result.setMessage("このidは他のユーザーに使われています。");
				request.setAttribute("result", result);

				// 新規登録画面にフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
				dispatcher.forward(request, response);

			}
        }
	}
}