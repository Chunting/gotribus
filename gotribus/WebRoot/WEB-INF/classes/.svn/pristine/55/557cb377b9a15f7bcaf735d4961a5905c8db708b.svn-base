package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "activity_pic")
public class ActivityPic {
	private int picId;
	private int albumId;
	private String picPath;
	public String getPicPath_small() {
		return picPath_small;
	}

	public void setPicPath_small(String picPathSmall) {
		picPath_small = picPathSmall;
	}

	public String getPicPath_big() {
		return picPath_big;
	}

	public void setPicPath_big(String picPathBig) {
		picPath_big = picPathBig;
	}

	private String picPath_small;
	private String picPath_big;
	
	private String picDescription;
	private int userId;
	private Date recordDate;

	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getPicId() {
		return picId;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getPicDescription() {
		return picDescription;
	}

	public void setPicDescription(String picDescription) {
		this.picDescription = picDescription;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
}
