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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//セッションが切れていたらLoginServletへ戻る
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		}

		//DeclarationsDaoから宣言とステップのデータを取ってくる.
		String id = (String) session.getAttribute("id");
		DeclarationsDao decDao = new DeclarationsDao();
		//引数をidとしてdecDAOのmypagedecメゾット呼び出し
		ArrayList<CommonTable> pageList = decDao.myListDec(id);

		//取ってきたデータをリクエストスコープへ保存
		request.setAttribute("pageList", pageList);

		//my_list.jspにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/my_list.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//セッションが切れていたらLoginServletへ戻る
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		}

		//行われた処理によって①～④条件分岐

		//①新規作成

		//セッションスコープの取得
		String userId = (String) session.getAttribute("id");
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String declaration = request.getParameter("declarations.id");
		int tag = Integer.parseInt(request.getParameter("tag"));
		int privateFlag = Integer.parseInt(request.getParameter("private_flag"));

		//DeclarationsDaoのinsertDecメソッドを呼ぶ
		DeclarationsDao decDao = new DeclarationsDao();
		boolean result =decDao.insertDec(declaration,tag,privateFlag,userId);


		//
		String id = (String) session.getAttribute("id");
		DeclarationsDao decDao = new DeclarationsDao();
		//引数をidとしてdecDAOのmypagedecメゾット呼び出し
		ArrayList<CommonTable> pageList = decDao.myListDec(id);

		/*テキストボックスに入力されたデータを
				getParmeterで受け取り、変数に格納する。

				Declarations.javaに格納されたデータをnewしてインスタンス化し、引数としてDeclarationsDao.javaのcreateDecメソッドに渡して、
				データベースにアクセスする*/

		//②編集

		//③達成

		//④削除

	}

}
