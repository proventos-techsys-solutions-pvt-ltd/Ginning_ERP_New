package com.prov.bean;

public class PurchaseRate {
	
	private int id;
	
	private String pDate;
	
	private int companyId;
	
	private double rate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
		this.pDate = pDate;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	
}
