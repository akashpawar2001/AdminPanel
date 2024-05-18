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
import Model.Images;

@WebServlet("/gallary")
public class GallaryServlet extends HttpServlet{	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			ArrayList<Images> imgList=(ArrayList<Images>) Dao.fetchImage();
			RequestDispatcher rd=req.getRequestDispatcher("gallaryphotos.jsp");
			req.setAttribute("IMGDATA", imgList);
			rd.forward(req, resp);
	}
}
