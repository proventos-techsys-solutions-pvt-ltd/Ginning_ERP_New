package com.prov.bean;

public class DailySetup {
	
	private int id, companyId, bankId, totalCheques;
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public int getTotalCheques() {
		return totalCheques;
	}
	public void setTotalCheques(int totalCheques) {
		this.totalCheques = totalCheques;
	}
	public long getFirstChequeNo() {
		return firstChequeNo;
	}
	public void setFirstChequeNo(long firstChequeNo) {
		this.firstChequeNo = firstChequeNo;
	}
	public long getLastChequeNo() {
		return lastChequeNo;
	}
	public void setLastChequeNo(long lastChequeNo) {
		this.lastChequeNo = lastChequeNo;
	}
	private String setupDate, cottonHeap;
	private long firstChequeNo, lastChequeNo;
	
	
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

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
	

}
