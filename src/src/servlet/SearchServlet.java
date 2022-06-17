package servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeclarationsDao;
import model.CommonTable;

/**
 * Servlet implementation class SeacrhServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//検索画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// あいまい検索

//		// ユーザーIDをセッションスコープから取得
//		HttpSession session = request.getSession();
//		session.getAttribute("userId");
//		今回は、お試しで「1」を使います。（56行目の引数）

		// 入力された文字列をリクエストパラメータから取得
		request.setCharacterEncoding("UTF-8");

//		String str = request.getParameter("str");
//		今回は、お試しで「情報」を使います。
		String search = "情報";

		// 検索処理を行う
		DeclarationsDao dDao = new DeclarationsDao();
//		CommonTable ct = new CommonTable();
//		ct.setDecsDeclaration(str);
//		ct.setStepsStep(str);

		ArrayList<CommonTable> pageList = dDao.searchResultDec("1", search);

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("pageList", pageList);

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);
	}

}
