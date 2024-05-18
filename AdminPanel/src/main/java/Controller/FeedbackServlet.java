package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;
import Model.Feedback;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<Feedback> f=(ArrayList<Feedback>)Dao.fetchFeedbackMsg();
		RequestDispatcher rd=req.getRequestDispatcher("Feedback.jsp");
		req.setAttribute("FEEDBACKS", f);
		rd.forward(req, resp);
	}
}
