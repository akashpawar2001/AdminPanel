package Model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class Dao {
	private static Connection connection=CreateConnection.createConnection();
	
	public static int fetchUsers(){
		String userCountQuery="SELECT COUNT(user_id) FROM USER";
		try {
			int count=0;
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(userCountQuery);
			if(rs.next()) {
				count=rs.getInt(1);
				return count;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
	}
	public static List<User> fethUserDetails(){
		ArrayList<User> users=new ArrayList<>();
		User u1;
		String userDataQuery="select * from user";
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(userDataQuery);
			while(rs.next()) {
				u1=new User();
				u1.setFirstName(rs.getString(2));
				u1.setLastName(rs.getString(3));
				u1.setEmailAddress(rs.getString(4));
				u1.setContact(rs.getString(6));
				users.add(u1);
			}
			return users;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public static int addImage(Images img) {
		String uploadImgQuery="insert into image values(?,?,?,?,?)";
		try {
			PreparedStatement pstmt=connection.prepareStatement(uploadImgQuery);
			pstmt.setInt(1, 0);
			pstmt.setString(2, img.getImgTitle());
			pstmt.setBlob(3, img.getInputStream());
			pstmt.setString(4, img.getImgDate());
			pstmt.setString(5, img.getImgType());
			int count=pstmt.executeUpdate();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public static List<Images> fetchImage(){
		ArrayList<Images> imgList=new ArrayList<>();
		Images img=null;
		String fetchImgData="select * from image";
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(fetchImgData);
			while(rs.next()) {
				img=new Images();
				img.setImgId(rs.getInt(1));
				img.setImgTitle(rs.getString(2));
				Blob blob = rs.getBlob(3);
				
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                img.setBase64Image(base64Image);
				img.setImgDate(rs.getString(4));
				img.setImgType(rs.getString(5));
				imgList.add(img);
				inputStream.close();
				outputStream.close();
			}
			return imgList;
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static int deleteImg(int id) {
		String deleteImageQuery="delete from image where image_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement(deleteImageQuery);
			pstmt.setInt(1,id);
			int count=pstmt.executeUpdate();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int fetchOrderCount(){
		String userCountQuery="SELECT COUNT(order_id) FROM orders";
		try {
			int count=0;
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(userCountQuery);
			if(rs.next()) {
				count=rs.getInt(1);
				return count;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
	}
	
	public static List<OrderDto> fetchOrders(){
		ArrayList<OrderDto> orderList=new ArrayList<>();
		OrderDto o=null;
		String fetchImgData="select * from orders";
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(fetchImgData);
			while(rs.next()) {
				o=new OrderDto();
				o.setOrderId(rs.getInt(1));
				o.setOrderType(rs.getString(2));
				o.setOrderFace(rs.getString(3));
				o.setCustomerName(rs.getString(4));
				o.setCustomerContact(rs.getString(6));
				o.setOrderSize(rs.getString(8));
				o.setOrderPayment(rs.getDouble(9));
				Blob blob = rs.getBlob(10);
				
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                o.setBase64Image(base64Image);
				orderList.add(o);
				inputStream.close();
				outputStream.close();
			}
			return orderList;
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}
	public static double totalRevenue() {
		String totalRevenue="SELECT SUM(order_portrait_price) FROM orders";
		Statement stmt;
		try {
			stmt = connection.createStatement();
			ResultSet rs=stmt.executeQuery(totalRevenue);
			if(rs.next()) {
				double total=rs.getDouble(1);
				return total;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public static int fetchFeedbackCount(){
		String userCountQuery="SELECT COUNT(feedback_id) FROM feedback";
		try {
			int count=0;
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(userCountQuery);
			if(rs.next()) {
				count=rs.getInt(1);
				return count;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	public static List<Feedback> fetchFeedbackMsg() {
		String feedbackMsg="select * from feedback";
		ArrayList<Feedback> msgList=new ArrayList<>();
		Feedback f=null;
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(feedbackMsg);
			while(rs.next()){
				f=new Feedback();
				f.setFeedbackerName(rs.getString(2));
				f.setFeedbackerMessage(rs.getString(4));
				msgList.add(f);
			}
			return msgList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
}
