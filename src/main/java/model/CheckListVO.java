package model;

import java.sql.Date;

public class CheckListVO {
	private int num;
	private String studynum;
	private String boardid;
	private String reader;
	private String readerposition;
	private String profile;
	private Date readdate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStudynum() {
		return studynum;
	}
	public void setStudynum(String studynum) {
		this.studynum = studynum;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getReader() {
		return reader;
	}
	public void setReader(String reader) {
		this.reader = reader;
	}
	public String getReaderposition() {
		return readerposition;
	}
	public void setReaderposition(String readerposition) {
		this.readerposition = readerposition;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public Date getReaddate() {
		return readdate;
	}
	public void setReaddate(Date readdate) {
		this.readdate = readdate;
	}
}
