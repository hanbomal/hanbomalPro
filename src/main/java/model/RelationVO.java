package model;

import java.sql.Date;

public class RelationVO {
	private String memberId;
	private String studynum;
	private String studyName;
	private int joinPoint; //참여율에 따른 포인트
	private String nickName;
	private Date joinDate;
	private Date lastDate; //마지막 접속 일자
	private String position; 
	private String leader; 
	private String status;
	private String photo;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getStudynum() {
		return studynum;
	}
	public void setStudynum(String studynum) {
		this.studynum = studynum;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public int getJoinPoint() {
		return joinPoint;
	}
	public void setJoinPoint(int joinPoint) {
		this.joinPoint = joinPoint;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "RelationVO [memberId=" + memberId + ", studynum=" + studynum + ", studyName=" + studyName
				+ ", joinPoint=" + joinPoint + ", nickName=" + nickName + ", joinDate=" + joinDate + ", lastDate="
				+ lastDate + ", position=" + position + ", leader=" + leader + ", status=" + status + ", photo=" + photo
				+ "]";
	}
}
