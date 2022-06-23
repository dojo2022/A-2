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

		//for文でインスタンスで取り出す
		//宣言が入るArrayListとステップが入るArrayListを作成
		ArrayList<Declarations> decList = new ArrayList<Declarations>();

		//リアクション数を取ってくる
		//宣言IDをもってきて
		ArrayList<CommonTable> reacter = new ArrayList<CommonTable>();
		for(int i = 0; i < pageList.size(); i++) {
			CommonTable ct = pageList.get(i);
			int decId = ct.getDecsId();
			CommonTable st = new CommonTable();
			st.setDecsId(ct.getDecsId());
			st.setCountReaction(decDao.countReaction(decId));
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
		int i = 0;
		int k = 1;
		while(i < decList.size()) {
			while(k < decList.size()) {
				if(decList.get(i).getDeclaration() == decList.get(k).getDeclaration()) {
					decList.remove(k);
				}else {
					i++;
					k++;

				}
			}
			break;
		}

		/*for (int i = 0; i < decList.size(); i++) {
			for (int j = 1; j < decList.size(); j++) {
				if (decList.get(i).getDeclaration() == decList.get(j).getDeclaration()) {
					decList.remove(j);
				}
			}
			System.out.println(decList.get(i).getDeclaration());
		}*/

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

		//取ってきたデータをリクエストスコープへ保存
		request.setAttribute("pageList", pageList);
		request.setAttribute("decList", decList);
		request.setAttribute("reacter", reacter);
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


		request.setCharacterEncoding("UTF-8");
		String button = request.getParameter("bt");
		//行われた処理によって①～④条件分岐
		if (button.equals("新規登録")) {
			//①新規作成

			//セッションスコープの取得
			String userId = (String) session.getAttribute("id");
			// リクエストパラメータを取得する
			//String userId = "1";
			request.setCharacterEncoding("UTF-8");
			String declaration = request.getParameter("declaration");
			int tag = Integer.parseInt(request.getParameter("tag"));
			boolean privateFlag = Boolean.parseBoolean(request.getParameter("private_flag"));

			//DeclarationsDaoのinsertDecメソッドを呼ぶ
			DeclarationsDao decDao = new DeclarationsDao();
			boolean decResult = decDao.insertDec(declaration, tag, privateFlag, userId);

			//StepをINSERTするメゾット
			//ループして登録する
			int count = Integer.parseInt(request.getParameter("count"));
			System.out.println(request.getParameter("count"));
			for(int i = 1; i < count + 1; i++) {
				String step = request.getParameter("step"+i);
				System.out.println(step);
				StepsDao stepsDao = new StepsDao();
				boolean stepResult = stepsDao.createStep(step);

			}


			//宣言かステップどちらか登録に失敗した場合(トランザクション処理？)
			/*if (decResult == false || stepResult == false) {
				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				Result result = new Result();
				result.setMessage("登録に失敗しました。");
				request.setAttribute("result", result);
			}*/

			//MyListservletでリダイレクトする
			response.sendRedirect("/killerQueen/MyListServlet");
			//MyListservletでフォワードする(これをすると無限doPost)
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/my_list.jsp");
			//dispatcher.forward(request, response);


		}
		//②編集
		// リクエストパラメータを取得する
		if (button.equals("完了")) {
			//選択されたデータを受け取る
			String userId = (String) session.getAttribute("id");
			request.setCharacterEncoding("UTF-8");
			String declaration = request.getParameter("declaration_edit");
			int tag = Integer.parseInt(request.getParameter("tag_edit"));
			System.out.println(declaration);
			boolean privateFlag = Boolean.parseBoolean(request.getParameter("private_flag_edit"));
			int decId = Integer.parseInt(request.getParameter("declaration_id_edit"));



			//データをDeclarationsDao.javaにもっていき、データベースにアクセスする
			//宣言を編集する処理
			DeclarationsDao decDao = new DeclarationsDao();
			boolean decResult = decDao.editDec(declaration, tag, privateFlag, decId);


			//ステップを編集する処理
			// 既存のステップのデータを削除する
			int stepCount= Integer.parseInt(request.getParameter("step_count"));
			System.out.println(stepCount);
			for(int i = 0; i < stepCount; i++) {
				int stepId = Integer.parseInt(request.getParameter("step_id_edit" + i));
				StepsDao stepsDao = new StepsDao();
				boolean stepResult = stepsDao.deleteStep(stepId);
			}


			//宣言かステップどちらか編集に失敗した場合(トランザクション処理？)
			/*if (decResult == false || stepResult == false) {
				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
				Result result = new Result();
				result.setMessage("宣言とステップの編集に失敗しました。");
				request.setAttribute("result", result);
			}*/

			response.sendRedirect("/killerQueen/MyListServlet");

			//MyListservletでフォワードする
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/killerQueen/MyListServlet");
			//dispatcher.forward(request, response);
		}
		//③宣言達成
//		達成ボタンが押されたら、declaration_idを取ってくる
		if (button.equals("達成")) {
			//選択されたデータを受け取る
			String userId = (String) session.getAttribute("id");
			request.setCharacterEncoding("UTF-8");
			int decId = Integer.parseInt(request.getParameter("declaration_id"));

			//データをDeclarationsDao.javaにもっていき、データベースにアクセスする
			//宣言を編集する処理
			DeclarationsDao decDao = new DeclarationsDao();
			boolean decResult = decDao.achiveDec(decId);
//			L変数を用意してT/Fを用意する必要がある

			//登録に失敗した場合
			if(decResult==false) {
				// リクエストスコープ(attribute区画)にエラーメッセージを格納する
//				beansに入っているエラーメッセージのデータをjspに送りたい
				Result result = new Result();
				result.setMessage("宣言の達成登録に失敗しました。");
				request.setAttribute("result",result);

			}
			response.sendRedirect("/killerQueen/MyListServlet");
            //MyListservletでフォワードする
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/killerQueen/MyListServlet");
			//dispatcher.forward(request, response);
		}
			/*
			 * 選択されたデータを受け取る
			CommonTable.javaに格納されたデータをDeclarationsDao.javaにもっていき、データベースにアクセスする
			達成（achieve_flag）を０→１へupdateする
			MyListServletへフォワードする

			 */

	//④削除
	if(button.equals("削除")) {
		//選択されたデータを受け取る
		String userId = (String) session.getAttribute("id");
		request.setCharacterEncoding("UTF-8");
		int decId = Integer.parseInt(request.getParameter("declaration_id"));

		//データをDeclarationsDao.javaにもっていき、データベースにアクセスする
		//宣言を削除する処理
		DeclarationsDao decDao = new DeclarationsDao();
		boolean decResult = decDao.deleteDec(decId);
        //L変数を用意してT/Fを用意する必要がある

		//削除に失敗した場合
		if(decResult==false) {
			// リクエストスコープ(attribute区画)にエラーメッセージを格納する
        //beansに入っているエラーメッセージのデータをjspに送りたい
			Result result = new Result();
			result.setMessage("宣言の削除に失敗しました。");
			request.setAttribute("result",result);

		}
		response.sendRedirect("/killerQueen/MyListServlet");
        //MyListservletでフォワードする
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/killerQueen/MyListServlet");
		//dispatcher.forward(request, response);
	}


	}

}


