package com.espatial.model;

public class Service {
	
	public final static int INSERT = 1;
	public final static int UPDATE = 2;
	public final static int DELETE = 3;
	
	private String id;
	private String title;
	private String subtitle;
	private String text;
	private int action;
	
	public Service() {
		action = Service.INSERT;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getAction() {
		return action;
	}
	public void setAction(int action) {
		this.action = action;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	

}
