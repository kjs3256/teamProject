package mate.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("MateVO")
public class MateVO {
	private int seq;
	private String title;
	private String nickname;
	private Timestamp regDate;
	
	public MateVO() {}

	
	public MateVO(String title, String nickname) {
		super();
		this.title = title;
		this.nickname = nickname;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}


}
