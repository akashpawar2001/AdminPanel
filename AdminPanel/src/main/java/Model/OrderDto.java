package Model;

public class OrderDto {
	private int orderId;
	private String orderType;
	private String customerName;
	private String customerContact;
	private double orderPayment;
	private String orderFace;
	private String base64Image;
	private String orderSize;
	public String getOrderSize() {
		return orderSize;
	}
	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerContact() {
		return customerContact;
	}
	public void setCustomerContact(String customerContact) {
		this.customerContact = customerContact;
	}
	public double getOrderPayment() {
		return orderPayment;
	}
	public void setOrderPayment(double orderPayment) {
		this.orderPayment = orderPayment;
	}
	public String getOrderFace() {
		return orderFace;
	}
	public void setOrderFace(String orderFace) {
		this.orderFace = orderFace;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	
	
}
