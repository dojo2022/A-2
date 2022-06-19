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

		// ユーザーIDをセッションスコープから取得
		//HttpSession session = request.getSession();
		//session.getAttribute("userId");
		// テスト用
		String userId = "1";

		// あいまい検索がされたとき
		if (request.getParameter("submit") != null) {

		// 入力された文字列をリクエストパラメータから取得
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("str");

		// 検索処理を行う
		// DeclarationDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		// ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> list = decdao.searchResultDec(userId, search);

		// 検索結果をリクエストスコープにsearchListとして格納する
		request.setAttribute("searchList", list);

		// 検索結果画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);


		// タグ検索がされたとき
		} else if (request.getParameter("action") != null) {

		// 押下されたタグに番号をふる
		int tagNumber = 0;
		switch(request.getParameter("action")) {
		case "study":
			tagNumber = 0;
		break;
		case "work":
			tagNumber = 1;
		break;
		case "hobby":
			tagNumber = 2;
		break;
		case "diet":
			tagNumber = 3;
		break;
		case "exercise":
			tagNumber = 4;
		break;
		case "health":
			tagNumber = 5;
		break;
		case "beauty":
			tagNumber = 6;
		break;
		case "ordinary":
			tagNumber = 7;
		break;
		case "others":
			tagNumber = 8;
		break;
		}


		// 検索処理を行う
		// DeclarationDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		// ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> list = decdao.tagSearchDec(userId, tagNumber);

		// 検索結果をリクエストスコープにsearchListとして格納する
		request.setAttribute("searchList", list);

		// 検索結果画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);
		}
	}
}
