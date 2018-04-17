package model;

import java.util.Date;

public class MemberVO {
	
	private int num;
	private String memberid;
	private String passwd;
	private String nickname;
	private Date joindate;
	private Date  lastdate;
	private String listid;
	private String passwdq;
	private String passwdkey;
	
	public String getPasswdq() {
		return passwdq;
	}
	public void setPasswdq(String passwdq) {
		this.passwdq = passwdq;
	}
	public String getPasswdkey() {
		return passwdkey;
	}
	public void setPasswdkey(String passwdkey) {
		this.passwdkey = passwdkey;
	}
	public String getListid() {
		return listid;
	}
	public void setListid(String listid) {
		this.listid = listid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", memberid=" + memberid + ", passwd=" + passwd + ", nickname=" + nickname
				+ ", joindate=" + joindate + ", lastdate=" + lastdate + ", listid=" + listid + ", passwdq=" + passwdq
				+ ", passwdkey=" + passwdkey + "]";
	}
	
}
