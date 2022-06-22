package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarksDao;
import dao.DeclarationsDao;
import dao.ReactionsDao;
import model.CommonTable;
import model.Steps;

/**
 * Servlet implementation class TimelineServlet
 */
@WebServlet("/TimelineServlet")
public class TimelineServlet extends HttpServlet {
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

		//テスト用
		String userId = "1";

		//DeclarationsDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		//ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> timelineList = decdao.timelineDec(userId);

		/*String dai = "aaa";

		for(CommonTable c : timelineList) {
			if(!dai.equals(c.getDecsDeclaration())) {
				dai = c.getDecsDeclaration();
				System.out.println(dai);
			}
			System.out.println(c.getStepsStep());
		}*/


		//timelineListからstep項目を抽出する
		ArrayList<Steps> steper = new ArrayList<Steps>();
		for(int i = 0; i < timelineList.size(); i++) {
			CommonTable ct = timelineList.get(i);
			Steps st = new Steps();
			st.setStep(ct.getStepsStep());
			st.setAchieveFlag(ct.isStepsAchieveFlag());
			st.setDeclarationId(ct.getDecsId());
			steper.add(st);
		}

		//timelineListから不要な宣言を削除する
		int i = 0;
		int k = 1;
		while(i < timelineList.size()) {
			while(k < timelineList.size()) {
				if(timelineList.get(i).getDecsId() == timelineList.get(k).getDecsId()) {
					timelineList.remove(k);
				}else {
					i++;
					k++;
				}
			}
			break;
		}


		//リクエストスコープにlistを"timelineList"という名前を付けて入れる
		request.setAttribute("timelineList", timelineList);
		request.setAttribute("steper", steper);

		//timeline.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/timeline.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// 送信されたデータの取得 int decId int userId
		int decsId = Integer.parseInt(request.getParameter("data1"));
		String usersId = request.getParameter("data2");
		String buttonStatus = request.getParameter("data3");
		PrintWriter out = response.getWriter();
		String resString;

		System.out.print(buttonStatus);


		if(buttonStatus.equals("リアクションしてない")) {
			//ReactionsDaoをインスタンス化
			ReactionsDao rd = new ReactionsDao();
			boolean result = rd.insertReaction(usersId, decsId);
			if(result) {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "inReactTrue";
				out.print(resString);
				resString = "";
			}else {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "inReactFalse";
				out.print(resString);
				resString = "";
			}
		}else if(buttonStatus.equals("リアクションしてる")){
			//ReactionsDaoをインスタンス化
			ReactionsDao rd = new ReactionsDao();
			boolean result =rd.deleteReaction(usersId, decsId);
			//JSPに返却する値を作成する。値はoutの中に格納す
			if(result) {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "delReactTrue";
				System.out.println(resString);
				out.print(resString);
				resString = "";
			}else {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "delReactFalse";
				out.print(resString);
				resString = "";
			}
		}else if(buttonStatus.equals("ブックマークしてない")) {
			BookmarksDao bd = new BookmarksDao();
			boolean resultBook = bd.insertBookmark(usersId, decsId);
			if(resultBook) {
				resString = "inBookTrue";
				out.print(resString);
				resString = "";
			}else {
				resString = "inBookFalse";
				out.print(resString);
				resString = "";
			}
		}else if(buttonStatus.equals("ブックマークしてる")){
			BookmarksDao bd = new BookmarksDao();
			boolean resultBook = bd.deleteBookmark(usersId, decsId);
			if(resultBook) {
				resString = "delBookTrue";
				out.print(resString);
				resString = "";
			}else {
				resString = "delBookFalse";
				out.print(resString);
				resString = "";
			}
		}

		//outの中に持ってきたデータを連結したものを入れる
		//勝手にJSPに渡り、dataという名前で使用することができる
		return;

	}

}
