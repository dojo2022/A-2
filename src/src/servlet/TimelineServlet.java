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

		String dai = "aaa";

		for(CommonTable c : timelineList) {
			if(!dai.equals(c.getDecsDeclaration())) {
				dai = c.getDecsDeclaration();
				System.out.println(dai);
			}
			System.out.println(c.getStepsStep());
		}

		ArrayList<String> as = new ArrayList<String>();
		for(CommonTable c : timelineList) {
			if(!dai.equals(c.getDecsDeclaration())) {
				dai = c.getDecsDeclaration();
			}

		}

		//CommonTableを分解してステップだけSteps.javaに入れなおす。

		//リクエストスコープにlistを"timelineList"という名前を付けて入れる
		request.setAttribute("timelineList", timelineList);
		request.setAttribute("dec", "aaaaa");

		//timeline.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/timeline.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
