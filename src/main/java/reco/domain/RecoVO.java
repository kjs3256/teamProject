package reco.domain;

public class RecoVO {
	private String id;
	private int seq;
	public RecoVO() {}
	
	public RecoVO(String id, int seq) {
		super();
		this.id = id;
		this.seq = seq;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
}
