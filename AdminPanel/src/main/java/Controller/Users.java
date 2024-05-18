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
import Model.User;

@WebServlet("/customer")
public class Users extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<User> data=(ArrayList<User>) Dao.fethUserDetails();
		RequestDispatcher rd=req.getRequestDispatcher("customer.jsp");
		req.setAttribute("CUSTOMERS", data);
		rd.forward(req, resp);
	}
}
