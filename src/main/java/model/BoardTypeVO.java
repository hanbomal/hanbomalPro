package model;

import java.sql.Date;

public class BoardTypeVO {
	@Override
	public String toString() {
		return "BoardTypeVO [studynum=" + studynum + ", boardid=" + boardid + ", boardname=" + boardname
				+ ", createdate=" + createdate + "]";
	}
	private int studynum;
	private String boardid;
	private String boardname;
	private Date createdate;
	public int getStudynum() {
		return studynum;
	}
	public void setStudynum(int studynum) {
		this.studynum = studynum;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
}
