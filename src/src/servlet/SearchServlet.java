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

		//		// ユーザーIDをセッションスコープから取得
//		HttpSession session = request.getSession();
//		session.getAttribute("userId");
//		テスト用（今回は、お試しで「1」を使います。（56行目の引数））
		String userId = "1";

		// あいまい検索！！！！！！！！！！
		if (request.getParameter("str") != null) {

		// 入力された文字列をリクエストパラメータから取得
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("str");

		//検索処理を行う
		// DeclarationDaoをインスタンス化する
		DeclarationsDao decdao = new DeclarationsDao();

		//ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> list = decdao.searchResultDec(userId, search);

		// クエストスコープに検索結果"list"を"searchList"として格納する
		request.setAttribute("searchList", list);

		// 検索結果画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);


		// タグ検索！！！！！！！！！！
		} else if ("tag".equals(request.getParameter("tag"))) {

		// 入力された文字列をリクエストパラメータから取得
		request.setCharacterEncoding("UTF-8");
		String tagNumber = request.getParameter("ordinary");
		System.out.println(tagNumber);
		System.out.println("aaaa");

//		int tagNumber;
//		switch(request.getParameter()) {
//		case "study":
//			tagNumber = 1;
//		break;
//		case "ordinary":
//			tagNumber = 7;
//		break;
//		}

		// 検索処理を行う
//		DeclarationsDao dDao = new DeclarationsDao();
//		CommonTable ct = new CommonTable();
//		ct.setDecsDeclaration(str);
//		ct.setStepsStep(str);

//		ArrayList<CommonTable> pageList = dDao.tagSearchDec(userId, tagNumber);
//
//		// 検索結果をリクエストスコープに格納する
//		request.setAttribute("searchList", searchList);
//
//		// 結果ページにフォワードする
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
//		dispatcher.forward(request, response);
		}
	}

}
