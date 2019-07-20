package com.prov.bean;

public class DailySetup {
	
	private int id, companyId;
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	private String setupDate, cottonHeap;
	private float cottonRate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSetupDate() {
		return setupDate;
	}
	public void setSetupDate(String setupDate) {
		this.setupDate = setupDate;
	}
	public String getCottonHeap() {
		return cottonHeap;
	}
	public void setCottonHeap(String cottonHeap) {
		this.cottonHeap = cottonHeap;
	}
	public float getCottonRate() {
		return cottonRate;
	}
	public void setCottonRate(float cottonRate) {
		this.cottonRate = cottonRate;
	}
	

}
