package model;

public class QnACommentModel {
	private int idx;
	private String writerId;
	private int gseq;
	private String time;
	private String content;
	private int linkedArticleNum;
	
	public int getGseq() {
		return gseq;
	}
	public void setGseq(int gseq) {
		this.gseq = gseq;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLinkedArticleNum() {
		return linkedArticleNum;
	}
	public void setLinkedArticleNum(int linkedArticleNum) {
		this.linkedArticleNum = linkedArticleNum;
	}
	
}
