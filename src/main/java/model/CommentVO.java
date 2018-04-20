package model;

import java.sql.Date;

public class CommentVO {
	private int studynum;
	private int num;
	private String boardid;
	private String content;
	private String profile;
	private String writer;
	private Date commentdate;
	
	public Date getCommentdate() {
		return commentdate;
	}
	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getStudynum() {
		return studynum;
	}
	public void setStudynum(int studynum) {
		this.studynum = studynum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
