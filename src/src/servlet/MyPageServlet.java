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
	/*HttpSession session = request.getSession();
	if (session.getAttribute("id") == null) {
	response.sendRedirect("/killerQueen/LoginServlet");
				return;
	}*/

		HttpSession session = request.getSession();
		//session.setAttribute("id", "1");
	//Daoをインスタンス化
	DeclarationsDao dDao = new DeclarationsDao();

	//セッションスコープの自分のIDから検索処理
	//String id = (String)session.getAttribute("id");
	String id = "1";

	ArrayList<CommonTable> pageList = dDao.myPageDec(id);

	//リクエストスコープに保存
	request.setAttribute("pageList", pageList);

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
