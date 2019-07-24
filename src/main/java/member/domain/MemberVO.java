package member.domain;

import java.sql.Timestamp;

public class MemberVO {
	private String id;
	private String password;
	private Timestamp regdate;
	private String nickname;
	private String phone;
	public MemberVO() {}
	
	public MemberVO(String id, String password, Timestamp regdate, String nickname, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.regdate = regdate;
		this.nickname = nickname;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
