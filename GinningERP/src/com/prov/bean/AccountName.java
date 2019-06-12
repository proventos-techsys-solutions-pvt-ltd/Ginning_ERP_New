package com.prov.bean;

public class AccountName {
	
	private int id, companyId, accountCategoryId;
	private String accountName;
	private double openingBalance;
	
	public double getOpeningBalance() {
		return openingBalance;
	}
	public void setOpeningBalance(double openingBalance) {
		this.openingBalance = openingBalance;
	}
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
	public int getAccountCategoryId() {
		return accountCategoryId;
	}
	public void setAccountCategoryId(int accountCategoryId) {
		this.accountCategoryId = accountCategoryId;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

}
