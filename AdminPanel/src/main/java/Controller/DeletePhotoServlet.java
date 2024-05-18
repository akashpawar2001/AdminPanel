package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;

@WebServlet("/delete")
public class DeletePhotoServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		int imgId=Integer.parseInt(id);
		
		int count=Dao.deleteImg(imgId);
		if(count>0) {
			resp.sendRedirect("gallary");
		}
	}
}
