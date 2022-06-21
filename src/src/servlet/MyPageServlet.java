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
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
		response.sendRedirect("/killerQueen/LoginServlet");
					return;
		}

		//セッションスコープから自分のID取得
		String id = (String)session.getAttribute("id");
		//String id = "2";


		//テスト用！！
		/*
		session.setAttribute("id", "id");
		session.setAttribute("name", "Name");
		session.setAttribute("icon", 1);
		session.setAttribute("comment", "comment");*/

		//テスト用
		//String test = "1";

		//DeclarationsDaoのインスタンスを作成
		DeclarationsDao decdao = new DeclarationsDao();

		int countAchieve = decdao.countAchieve(id);



		//ArrayList<CommonTable>のインスタンスを作成　検索処理
		ArrayList<CommonTable> myPageList = decdao.myPageDec(id);

		//リアクション数を数えるよ
		//宣言IDをもってきて
		ArrayList<CommonTable> reacter = new ArrayList<CommonTable>();
		for(int i = 0; i < myPageList.size(); i++) {
			CommonTable ct = myPageList.get(i);
			int decId = ct.getDecsId();
			CommonTable st = new CommonTable();
			st.setDecsId(ct.getDecsId());
			st.setCountReaction(decdao.countReaction(decId));
			reacter.add(st);
		}
		int r = 0;
		int t = 1;
		while(r < reacter.size()) { //リストが０行以上だったら
			while(t < reacter.size()) { //リストが１行以上
				//マイリストのi行目とi+1行目のDecsidが同じだったら行削除、違えばプラス１
				if(reacter.get(r).getDecsId() == reacter.get(t).getDecsId()) {
					reacter.remove(t);
				}else {
					r++;
					t++;
				}
			}
			break;
		}


		//MypageListからstep項目を抽出する
		ArrayList<Steps> steper = new ArrayList<Steps>();
		for(int i = 0; i < myPageList.size(); i++) {
			CommonTable ct = myPageList.get(i);
			Steps st = new Steps();
			st.setStep(ct.getStepsStep());
			st.setAchieveFlag(ct.isStepsAchieveFlag());
			st.setDeclarationId(ct.getDecsId());
			steper.add(st);
		}

		//timelineListから（DECIDがかぶっている箇所）不要な宣言を削除する
		int i = 0;
		int k = 1;
		while(i < myPageList.size()) { //リストが０行以上だったら
			while(k < myPageList.size()) { //リストが１行以上
				//マイリストのi行目とi+1行目のDecsidが同じだったら行削除、違えばプラス１
				if(myPageList.get(i).getDecsId() == myPageList.get(k).getDecsId()) {
					myPageList.remove(k);
				}else {
					i++;
					k++;
				}
			}
			break;
		}




		//リクエストスコープにlistを"timelineList"という名前を付けて入れる
		request.setAttribute("myPageList", myPageList);
		request.setAttribute("steper", steper);
		request.setAttribute("countAchieve", countAchieve);
		request.setAttribute("reacter", reacter);


	//マイページにフォワード
	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/my_page.jsp");
	dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
