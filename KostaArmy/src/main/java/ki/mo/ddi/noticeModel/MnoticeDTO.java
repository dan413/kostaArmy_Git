package ki.mo.ddi.noticeModel;

import java.sql.Timestamp;

public class MnoticeDTO {
	private int num , hit;
	private String dept,title,writer,content;
	private Timestamp idate;
	private String position;
	private String mmr;
	private String cadre_num;
	private String cadre_group;
	public String getCadre_group() {
		return cadre_group;
	}
	public void setCadre_group(String cadre_group) {
		this.cadre_group = cadre_group;
	}
	public String getCadre_num() {
		return cadre_num;
	}
	public void setCadre_num(String cadre_num) {
		this.cadre_num = cadre_num;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getMmr() {
		return mmr;
	}
	public void setMmr(String mmr) {
		this.mmr = mmr;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getIdate() {
		return idate;
	}
	public void setIdate(Timestamp idate) {
		this.idate = idate;
	}
	@Override
	public String toString() {
		return "MnoticeDTO [num=" + num + ", hit=" + hit + ", dept=" + dept + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", idate=" + idate + "]";
	}
	
}