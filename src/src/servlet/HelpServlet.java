package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/HelpServlet")
public class HelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//セッションを使えるようにする
		HttpSession session = request.getSession();

		//セッションが切れていたらLoginServlet.javaにリダイレクトする
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/killerQueen/LoginServlet");
			return;
		}

		// ヘルプページにフォワードする(help.jsp)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/help.jsp");
		dispatcher.forward(request, response);

}

	}

