package servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DeclarationsDao;
import model.CommonTable;
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

		 //セッションスコープを使えるようにする

		HttpSession session = request.getSession();

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		}

		//宣言リストのタグから検索をする
		if (request.getQueryString() != null) {

			// 押下されたタグに番号をふる
			int tagNumber = Integer.parseInt(request.getQueryString());

			// ユーザーIDをセッションスコープから取得
			String userId = (String)session.getAttribute("id");

			// 検索処理を行う
			// DeclarationDaoのインスタンスを作成
			DeclarationsDao decdao = new DeclarationsDao();

			// ArrayList<CommonTable>のインスタンスを作成
			ArrayList<CommonTable> pageList = decdao.tagSearchDec(userId, tagNumber);

			//for文でインスタンスで取り出す
			//ステップが入るArrayListを作成
			ArrayList<Steps> stepList = new ArrayList<Steps>();

			//pageListからステップ関係のデータのみをstepListに入れる
			for (int i = 0; i < pageList.size(); i++) {
				CommonTable ct = pageList.get(i);
				//CommonTableからDeclarationsテーブルの内容だけ取得
				//Declartionsビーンズに格納する
				Steps st = new Steps();
				if(ct.getStepsId() != 0) {
				st.setStep(ct.getStepsStep());
				st.setAchieveFlag(ct.isStepsAchieveFlag());
				st.setDeclarationId(ct.getDecsId());
				//stepsビーンズをArrayListに格納する
				stepList.add(st);
				}
			}

			//decListを選別する
					int i = 0;
					int k = 1;
					while(i < pageList.size()) {
						while(k < pageList.size()) {
							if(pageList.get(i).getDecsId() == pageList.get(k).getDecsId()) {
								pageList.remove(k);
							}else {
								i++;
								k++;

							}
						}
						break;
					}

			// 検索結果をリクエストスコープにpageListとして格納する
			request.setAttribute("pageList", pageList);
			request.setAttribute("stepList", stepList);

			// 検索結果画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
			dispatcher.forward(request, response);
			}

		//検索画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//セッションスコープを使えるようにする
		HttpSession session = request.getSession();

		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		}

		// ユーザーIDをセッションスコープから取得
		 String userId = (String)session.getAttribute("id");

		// テスト用(ユーザーIDを「１」で試す)
		//String userId = "1";

		//リクエストパラメーターの文字コードを設定する
		request.setCharacterEncoding("UTF-8");

		// あいまい検索がされたとき
		if (request.getParameter("str") != null) {

		// 入力された文字列をリクエストパラメータから取得
		String search = request.getParameter("str");

		// 検索処理を行う
		// DeclarationDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		// ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> pageList = decdao.searchResultDec(userId, search);

		//for文でインスタンスで取り出す
		//ステップが入るArrayListを作成
		ArrayList<Steps> stepList = new ArrayList<Steps>();

		//pageListからステップ関係のデータのみをstepListに入れる
		for (int i = 0; i < pageList.size(); i++) {
			CommonTable ct = pageList.get(i);
			//CommonTableからDeclarationsテーブルの内容だけ取得
			//Declartionsビーンズに格納する
			Steps st = new Steps();
			if(ct.getStepsId() != 0) {
			st.setStep(ct.getStepsStep());
			st.setAchieveFlag(ct.isStepsAchieveFlag());
			st.setDeclarationId(ct.getDecsId());
			//stepsビーンズをArrayListに格納する
			stepList.add(st);
			}
		}

		//Listを選別する
				int i = 0;
				int k = 1;
				while(i < pageList.size()) {
					while(k < pageList.size()) {
						if(pageList.get(i).getDecsId() == pageList.get(k).getDecsId()) {
							pageList.remove(k);
						}else {
							i++;
							k++;

						}
					}
					break;
				}

		// 検索結果をリクエストスコープにpageListとして格納する
		request.setAttribute("pageList", pageList);
		request.setAttribute("stepList", stepList);

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
		ArrayList<CommonTable> pageList = decdao.tagSearchDec(userId, tagNumber);

		//for文でインスタンスで取り出す
		//ステップが入るArrayListを作成
		ArrayList<Steps> stepList = new ArrayList<Steps>();

		//pageListからステップ関係のデータのみをstepListに入れる
		for (int i = 0; i < pageList.size(); i++) {
			CommonTable ct = pageList.get(i);
			//CommonTableからDeclarationsテーブルの内容だけ取得
			//Declartionsビーンズに格納する
			Steps st = new Steps();
			if(ct.getStepsId() != 0) {
			st.setStep(ct.getStepsStep());
			st.setAchieveFlag(ct.isStepsAchieveFlag());
			st.setDeclarationId(ct.getDecsId());
			//stepsビーンズをArrayListに格納する
			stepList.add(st);
			}
		}

		//decListを選別する
				int i = 0;
				int k = 1;
				while(i < pageList.size()) {
					while(k < pageList.size()) {
						if(pageList.get(i).getDecsId() == pageList.get(k).getDecsId()) {
							pageList.remove(k);
						}else {
							i++;
							k++;

						}
					}
					break;
				}

		// 検索結果をリクエストスコープにpageListとして格納する
		request.setAttribute("pageList", pageList);
		request.setAttribute("stepList", stepList);

		CommonTable ccc = new CommonTable();
		ccc = pageList.get(1);
		System.out.println(ccc.getReactionsId());

		// 検索結果画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);
		}
	}
}
