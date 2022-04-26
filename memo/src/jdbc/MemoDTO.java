package jdbc;

public class MemoDTO {
	private String mid;
	private String uid;
	private String mtext;
	private String mdone;
	private String mtime;
	
	public String getMid() {
		return mid;
	}
	public String getUid() {
		return uid;
	}
	public String getMtext() {
		return mtext;
	}
	public String getMdone() {
		return mdone;
	}
	public String getMtime() {
		return mtime;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setMtext(String mtext) {
		this.mtext = mtext;
	}
	public void setMdone(String mdone) {
		this.mdone = mdone;
	}
	public void setMtime(String mtime) {
		this.mtime = mtime;
	}
	
	
	
	public MemoDTO(String mid, String uid, String mtext, String mdone, String mtime) {
		
		this.mid = mid;
		this.uid = uid;
		this.mtext = mtext;
		this.mdone = mdone;
		this.mtime = mtime;
	}
	
	public MemoDTO() {
		
	}

}
