package vn.t3h.model;

public class Menu {
	
	private Integer id;
	private String lable;
	private String href;
	
	public Menu(Integer id, String lable, String href) {
		this.id = id;
		this.lable = lable;
		this.href = href;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public void setLable(String lb) {
		this.lable = lb;
	}
	
	public String getLable() {
		return this.lable;
	}
	
	public void setHref(String href) {
		this.href = href;
	}
	
	public String getHref() {
		return this.href;
	}
}
