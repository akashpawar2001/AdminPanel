package Controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Dao;
import Model.Images;

@WebServlet("/addimage")
@MultipartConfig(maxFileSize = 16177215)
public class AddPhotoServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		String date=req.getParameter("date");
		String type=req.getParameter("type");
		Images img=null;
        // obtains the upload file part in this multipart request
        Part filePart = req.getPart("file");
        if (filePart != null) {
            // prints out some information for debugging
         
            img=new Images();
            img.setImgTitle(title);
            img.setImgType(type);
            img.setImgDate(date);
            img.setInputStream(filePart.getInputStream());
            int count=Dao.addImage(img);
           
            if(count>0) {
            	resp.sendRedirect("gallary");
            }
        }
        
        
	}
}
