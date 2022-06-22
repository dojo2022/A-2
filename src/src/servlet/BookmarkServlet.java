package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DeclarationsDao;
import model.CommonTable;

/**
 * Servlet implementation class BookmarkServlet
 */
@WebServlet("/BookmarkServlet")
public class BookmarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//セッションを使えるようにする
		HttpSession session = request.getSession();

		/*もしもログインしていなかったらログインサーブレットにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/loginServlet");
			return;
		}*/

		/*セッションスコープからuse_idを取得する
		String userId = session.getAttribute("user_id");*/

		//bookmark.jspにフォワードする
		String userId = "1";

		//DeclarationsDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		//ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> timelineList = decdao.timelineDec(userId);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
