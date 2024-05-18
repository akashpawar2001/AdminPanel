package Model;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

public class Images {
	private int imgId;
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	private String imgTitle;
	private String imgDate;
	private InputStream inputStream;
	private String imgType;
	
	private String base64Image;
	 
    public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
	
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	
	public String getImgTitle() {
		return imgTitle;
	}
	public void setImgTitle(String imgTitle) {
		this.imgTitle = imgTitle;
	}
	public String getImgDate() {
		return imgDate;
	}
	public void setImgDate(String imgDate) {
		this.imgDate = imgDate;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public Images() {
	
	}
}
