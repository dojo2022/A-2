package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StepsDao;

/**
 * Servlet implementation class StepAjaxServlet
 */
@WebServlet("/StepAjaxServlet")
public class StepAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");




		//送信されたデータの取得
		int stepsAId= Integer.parseInt(request.getParameter("data1"));
		String buttonStatus = request.getParameter("data2");
		System.out.println(stepsAId);
		System.out.println(buttonStatus);
		PrintWriter out = response.getWriter();
		String resString;

		//⑤goAjax
		if(buttonStatus.equals("ステップ未達成")) {
			StepsDao stepsDao = new StepsDao();
			boolean result= stepsDao.achieveStep(stepsAId);
			if(result) {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "getAchieveTrue";
				out.print(resString);
				resString = "";
				return;
			}else {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "getAchieveFalse";
				out.print(resString);
				resString = "";
				return;
			}

		} else if(buttonStatus.equals("ステップ達成")) {
			StepsDao stepsDao = new StepsDao();
			boolean result= stepsDao.notAchieveStep(stepsAId);
			if(result) {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "getAchieveFalse";
				out.print(resString);
				resString = "";
				return;
			}else {
				//JSPに返却する値を作成する。値はoutの中に格納する
				resString = "getAchieveTrue";
				out.print(resString);
				resString = "";
				return;
			}
		}
	}

}
