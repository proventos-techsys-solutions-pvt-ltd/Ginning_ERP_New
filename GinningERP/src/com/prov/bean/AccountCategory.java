package com.prov.bean;

public class AccountCategory {
	
	private int id, companyId;
	private String accountCategory, itemOf;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getAccountCategory() {
		return accountCategory;
	}
	public void setAccountCategory(String accountCategory) {
		this.accountCategory = accountCategory;
	}
	public String getItemOf() {
		return itemOf;
	}
	public void setItemOf(String itemOf) {
		this.itemOf = itemOf;
	}
}
