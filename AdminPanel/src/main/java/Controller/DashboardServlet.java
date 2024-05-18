package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			getUserCount(req,resp);			
	}

	private void getUserCount(HttpServletRequest req, HttpServletResponse resp) {
		int count=Dao.fetchUsers();
		System.out.println(count);
		RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
		req.setAttribute("USERCOUNT", count);
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
