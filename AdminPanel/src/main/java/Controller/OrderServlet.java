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
import Model.OrderDto;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<OrderDto> orderList=(ArrayList<OrderDto>)Dao.fetchOrders();
		RequestDispatcher rd=req.getRequestDispatcher("Orders.jsp");
		req.setAttribute("ORDERLIST", orderList);
		rd.forward(req, resp);
	}
}
