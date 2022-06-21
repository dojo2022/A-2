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
import model.Users;

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
		Users user = new Users();
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
				/*// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				result.setMessage("登録完了です！ログインをしましょう！");
				request.setAttribute("result", result);*/

				user = usersDao.selectUser(id);

				String comment = user.getComment();
				int icon = user.getIcon();
				int themecolor = user.getThemecolor();

				// セッションスコープ(attribute区画)にそのユーザーの情報(Usersテーブル)すべて格納する
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("icon", icon);
				session.setAttribute("comment", comment);
				session.setAttribute("themecolor", themecolor);

				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				result.setMessage("<a href=\"/killerQueen/MyListServlet\">ここをクリックしてください</a>");
				request.setAttribute("result", result);

				// 新規登録画面にフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
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