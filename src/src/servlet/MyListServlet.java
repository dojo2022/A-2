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
 * Servlet implementation class MyListServlet
 */
@WebServlet("/MyListServlet")
public class MyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//セッションが切れていたらLoginServletへ戻る
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		}

		//DeclarationsDaoから宣言とステップのデータを取ってくる.
	    String id =(String) session.getAttribute("id");
		DeclarationsDao decDao =new DeclarationsDao();
        //引数をidとしてdecDAOのmypagedecメゾット呼び出し
		ArrayList<CommonTable> pageList = decDao.myPageDec(id);


		//取ってきたデータをリクエストスコープへ保存
		request.setAttribute("pageList", pageList);



		//my_list.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/my_list.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
