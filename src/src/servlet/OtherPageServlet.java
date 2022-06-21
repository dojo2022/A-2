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
import dao.UsersDao;
import model.CommonTable;
import model.Steps;
import model.Users;

/**
 * Servlet implementation class OtherPageServlet
 */
@WebServlet("/OtherPageServlet")
public class OtherPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//セッションを使えるようにする
		HttpSession session = request.getSession();
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/loginServlet");
			return;
		}


		//セッションスコープから自分のID取得
		String myId = (String)session.getAttribute("id");

		//リクエストスコープから他のユーザーIDを取得
		request.setCharacterEncoding("UTF-8");
		String otherId = request.getParameter("id");


//テスト用
/*String mytest = "2";
String othertest = "1";*/

		//ユーザー情報を検索
		UsersDao userdao = new UsersDao();
		Users userInfo = userdao.selectUser(otherId);


		//宣言DAOをインスタンス
		DeclarationsDao decdao = new DeclarationsDao();

		//達成個数を数える。
		int countAchieve = decdao.countAchieve(otherId);

		//ArrayList<CommonTable>のインスタンスを作成
		ArrayList<CommonTable> OtherPageList = decdao.otherPageDec(myId, otherId);

		//timelineListからstep項目を抽出する
		ArrayList<Steps> steper = new ArrayList<Steps>();
		for(int i = 0; i < OtherPageList.size(); i++) {
			CommonTable ct = OtherPageList.get(i);
			Steps st = new Steps();
			st.setStep(ct.getStepsStep());
			st.setAchieveFlag(ct.isStepsAchieveFlag());
			st.setDeclarationId(ct.getDecsId());
			steper.add(st);
		}

		//timelineListから（DECIDがかぶっている箇所）不要な宣言を削除する
		int i = 0;
		int k = 1;
		while(i < OtherPageList.size()) { //リストが０行以上だったら
			while(k < OtherPageList.size()) { //リストが１行以上
				//マイリストのi行目とi+1行目のDecsidが同じだったら行削除、違えばプラス１
				if(OtherPageList.get(i).getDecsId() == OtherPageList.get(k).getDecsId()) {
					OtherPageList.remove(k);
				}else {
					i++;
					k++;
				}
			}
			break;
		}


		//リクエストスコープにlistを"OtherPageList"という名前を付けて入れる
		request.setAttribute("userInfo", userInfo);
		request.setAttribute("OtherPageList", OtherPageList);
		request.setAttribute("steper", steper);
		request.setAttribute("countAchieve", countAchieve);
		//others.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/other_page.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
