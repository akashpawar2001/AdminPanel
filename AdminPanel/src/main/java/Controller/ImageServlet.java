package Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadImage")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        OutputStream out = null;

        try {
            // Establish database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tybbaca", "root", "sql123");

            // Query to retrieve image data from the database
            String sql = "SELECT image FROM orders WHERE order_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(request.getParameter("imageId"))); // assuming imageId is passed as a request parameter
            rs = stmt.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes(1);

                // Set response headers
                response.setContentType("image/jpeg");
                response.setContentLength(imageData.length);

                // Write image data to response output stream
                out = response.getOutputStream();
                out.write(imageData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (out != null) {
                    out.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
