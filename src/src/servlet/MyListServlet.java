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
import dao.StepsDao;
import model.CommonTable;
import model.Declarations;
import model.Result;
import model.Steps;

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
		//		HttpSession session = request.getSession();
		//		if (session.getAttribute("id") == null) {
		//			response.sendRedirect("/killerQueen/LoginServlet");
		//			return;
		//		}

		//DeclarationsDaoから宣言とステップのデータを取ってくる.
		//String id = (String) session.getAttribute("id");
		DeclarationsDao decDao = new DeclarationsDao();
		//引数をidとしてdecDAOのmypagedecメゾット呼び出し
		ArrayList<CommonTable> pageList = decDao.myListDec("1");

		//for文でインスタンスで取り出す
		//宣言が入るArrayListとステップが入るArrayListを作成
		ArrayList<Declarations> decList = new ArrayList<Declarations>();
		ArrayList<Steps> stepList =  new ArrayList<Steps>();

		//pageListから宣言関係のデータのみをdecListに入れる
		for(int i=0; i<pageList.size(); i++) {
			CommonTable ct = pageList.get(i);
			//CommonTableからDeclarationsテーブルの内容だけ取得
			//Declartionsビーンズに格納する
			Declarations dec = new Declarations();
			dec.setId(ct.getDecsId());
			dec.setDeclaration( ct.getDecsDeclaration());
			dec.setTag(ct.getDecsTag());
			dec.setPrivateFlag(ct.isDecsPrivateFlag());
			//DeclarationsビーンズをArrayListに格納する
			decList.add(dec);
		}
		//decListを選別する
		for(int i = 0; i<decList.size(); i++) {
			for(int j=1; j<decList.size(); j++) {
				if(decList.get(i).getDeclaration()== decList.get(j).getDeclaration()) {
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

		}*/

		/*for(int i=1; i<pageList.size(); i++) {
			if(dec!= de)
			pageList.get(i);
			String de= ct.getDecsDeclaration();
			System.out.println(de);

			String step = ct.getStepsStep();
			System.out.println(step);


		}*/
		//pageListを整頓する必要があるんご

		//取ってきたデータをリクエストスコープへ保存
		request.setAttribute("pageList", pageList);
		request.setAttribute("decList", decList);

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

		String button = request.getParameter("bt");
		//行われた処理によって①～④条件分岐
		if(button.equals("新規登録")) {
			//①新規作成

			//セッションスコープの取得
			String userId = (String) session.getAttribute("id");
			// リクエストパラメータを取得する
			request.setCharacterEncoding("UTF-8");
			String declaration = request.getParameter("declarations.id");
			int tag = Integer.parseInt(request.getParameter("tag"));
			int privateFlag = Integer.parseInt(request.getParameter("private_flag"));

			String step = request.getParameter("step");

			//DeclarationsDaoのinsertDecメソッドを呼ぶ
			DeclarationsDao decDao = new DeclarationsDao();
			boolean decResult = decDao.insertDec(declaration, tag, privateFlag, userId);
			//StepをINSERTするメゾット
			StepsDao stepsDao = new StepsDao();
			boolean stepResult = stepsDao.createStep(step);

			//宣言かステップどちらか登録に失敗した場合(トランザクション処理？)
			if(decResult== false || stepResult== false) {
				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				Result result = new Result();
				result.setMessage("登録に失敗しました。");
				request.setAttribute("result", result);
			}

			//MyListservletでフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/killerQueen/MyListServlet");
			dispatcher.forward(request, response);

			/*仲原さんメモ：String id = (String) session.getAttribute("id");
			DeclarationsDao decDao2 = new DeclarationsDao();
			//引数をidとしてdecDAOのmypagedecメゾット呼び出し
			ArrayList<CommonTable> pageList = decDao2.myListDec(id);
			*/
		}
		//②編集
		// リクエストパラメータを取得する
		if(button.equals("編集")) {
			//選択されたデータを受け取る
			String userId = (String) session.getAttribute("id");
			request.setCharacterEncoding("UTF-8");
			String declaration = request.getParameter("declaration");
			int tag = Integer.parseInt(request.getParameter("tag"));
			int privateFlag = Integer.parseInt(request.getParameter("private_flag"));

			int decId= Integer.parseInt(request.getParameter("declaration_id"));


			String step = request.getParameter("step");

			//データをDeclarationsDao.javaにもっていき、データベースにアクセスする
			//		宣言を編集する処理
			DeclarationsDao decDao = new DeclarationsDao();
			boolean decResult = decDao.editDec(declaration, tag, privateFlag, userId);
			//		ステップを編集する処理
			StepsDao stepsDao = new StepsDao();
			boolean stepResult = stepsDao.editStep(step,decId);

			//宣言かステップどちらか編集に失敗した場合(トランザクション処理？)
			if(decResult== false || stepResult== false) {
				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				Result result = new Result();
				result.setMessage("宣言とステップの編集に失敗しました。");
				request.setAttribute("result", result);
			}

			//MyListservletでフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/killerQueen/MyListServlet");
			dispatcher.forward(request, response);
		}
		//③達成
		if(button.equals("達成")) {

		}

		//④削除
		if(button.equals("削除")) {

		}

	}

}
