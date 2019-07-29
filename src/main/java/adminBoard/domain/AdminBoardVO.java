package adminBoard.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("AdminBoardVO")
public class AdminBoardVO {
	private int seq;
	private String title;
	private String content;
	private Timestamp regdate;
	private String filename;
	private int readcount;
	private int ischeck;
	private int latitude;
	private int longtitude;
	private Date schedule1;
	private Date schedule2;
	
	public AdminBoardVO() {}
	
	public AdminBoardVO(String title, String content, String filename, int ischeck, Date schedule1, Date schedule2) {
		this.title = title;
		this.content = content;
		this.filename = filename;
		
		this.ischeck = ischeck;
		this.schedule1 = schedule1;
		this.schedule2 = schedule2;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getIscheck() {
		return ischeck;
	}
	public void setIscheck(int ischeck) {
		this.ischeck = ischeck;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public int getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(int longtitude) {
		this.longtitude = longtitude;
	}
	public Date getSchedule1() {
		return schedule1;
	}
	public void setSchedule1(Date schedule1) {
		this.schedule1 = schedule1;
	}
	public Date getSchedule2() {
		return schedule2;
	}
	public void setSchedule2(Date schedule2) {
		this.schedule2 = schedule2;
	}
	
}
