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
import model.Declarations;
import model.Steps;

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

		/* セッションスコープを使えるようにする
		HttpSession session = request.getSession(); */

		/* もしもログインしていなかったらログインサーブレットにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		} */

		//検索画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* セッションスコープを使えるようにする
		HttpSession session = request.getSession();　*/

		/* もしもログインしていなかったらログインサーブレットにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		} */

		/* ユーザーIDをセッションスコープから取得
		 String userId = session.getAttribute("user_Id"); */

		// テスト用(ユーザーIDを「１」で試す)
		String userId = "1";

		//リクエストパラメーターの文字コードを設定する
		request.setCharacterEncoding("UTF-8");


		// あいまい検索がされたとき
		if (request.getParameter("str") != null) {

//		String test = request.getParameter("str");
//		System.out.println(test);
//		System.out.println("aaa");

		// 入力された文字列をリクエストパラメータから取得
		String search = request.getParameter("str");

		// 検索処理を行う
		// DeclarationDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		// ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> pageList = decdao.searchResultDec(userId, search);

		//for文でインスタンスで取り出す
		//宣言が入るArrayListとステップが入るArrayListを作成
		ArrayList<Declarations> decList = new ArrayList<Declarations>();
		ArrayList<Steps> stepList = new ArrayList<Steps>();

		//pageListから宣言関係のデータのみをdecListに入れる
		for (int i = 0; i < pageList.size(); i++) {
			CommonTable ct = pageList.get(i);
			//CommonTableからDeclarationsテーブルの内容だけ取得
			//Declartionsビーンズに格納する
			Declarations dec = new Declarations();
			dec.setId(ct.getDecsId());
			dec.setDeclaration(ct.getDecsDeclaration());
			dec.setTag(ct.getDecsTag());
			dec.setPrivateFlag(ct.isDecsPrivateFlag());
			//DeclarationsビーンズをArrayListに格納する
			decList.add(dec);
		}

		//decListを選別する
		for (int i = 0; i < decList.size(); i++) {
			for (int j = 1; j < decList.size(); j++) {
				if (decList.get(i).getDeclaration() == decList.get(j).getDeclaration()) {
					decList.remove(j);
				}
			}
			System.out.println(decList.get(i).getDeclaration());
		}

		/*CommonTable ct = pageList.get(0);//一個目のArrayListを取得

		String dec = ct.getDecsDeclaration();//一個目に入っている宣言取得
		System.out.println(dec);
		for (int i = 1; i < pageList.size(); i++) {
			ct = pageList.get(i);
			String dec2 = ct.getDecsDeclaration();
			if (dec == dec2) {
				for (int j = 0; j < pageList.size(); j++) {
					String step = ct.getStepsStep();
					System.out.println(step);
				}
			} else {
				System.out.println(dec2);
			}

		}

		for(int i=1; i< pageList.size(); i++) {
			if(dec!= de)
			pageList.get(i);
			String de= ct.getDecsDeclaration();
			System.out.println(de);

			String step = ct.getStepsStep();
			System.out.println(step);


		}*/


		// 検索結果をリクエストスコープにsearchListとして格納する
		request.setAttribute("searchList", pageList);
		request.setAttribute("decList", decList);

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
		ArrayList<CommonTable> searchList = decdao.tagSearchDec(userId, tagNumber);

		// 検索結果をリクエストスコープにsearchListとして格納する
		request.setAttribute("searchList", searchList);

		// 検索結果画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);
		}
	}
}
