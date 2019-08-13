package com.prov.bean;

public class AccountCategory {
	
	private int id, accountGrouptId;
	private String categoryName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountGrouptId() {
		return accountGrouptId;
	}
	public void setAccountGrouptId(int accountGrouptId) {
		this.accountGrouptId = accountGrouptId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
