package model;

import java.util.Date;

public class GalleryVO {

	private Date regdate;
	private int studynum;
	private int num;
	private String name;
	private String title;
	private String content;
	private String filename;
	private int filesize;
	private String formatDate;
	
	
	
	
	public String getFormatDate() {
		return formatDate;
	}
	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getStudynum() {
		return studynum;
	}
	public void setStudynum(int studynum) {
		this.studynum = studynum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "GalleryVO [regdate=" + regdate + ", studynum=" + studynum + ", num=" + num + ", name=" + name
				+ ", title=" + title + ", content=" + content + ", filename=" + filename + ", filesize=" + filesize
				+ "]";
	}

	
	
	
	
}
