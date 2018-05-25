package model;

import java.util.Date;

public class Board {

	private int bId;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int hit;
	private int groupId;
	private int groupSeq;
	private int parentId;
	private int fId;

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getGroupSeq() {
		return groupSeq;
	}

	public void setGroupSeq(int groupSeq) {
		this.groupSeq = groupSeq;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", hit=" + hit + ", groupId=" + groupId + ", groupSeq=" + groupSeq + ", parentId="
				+ parentId + ", fId=" + fId + "]";
	}

}
