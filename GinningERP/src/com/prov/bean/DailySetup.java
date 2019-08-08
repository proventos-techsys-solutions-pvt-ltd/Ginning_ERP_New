package com.prov.bean;

public class DailySetup {
	
	private int id, companyId, bankId, totalCheques;
	public float bonusAmount;
	public float getBonusAmount() {
		return bonusAmount;
	}
	public void setBonusAmount(float bonusAmount) {
		this.bonusAmount = bonusAmount;
	}
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
	
	public String getFirstChequeNo() {
		return firstChequeNo;
	}
	public void setFirstChequeNo(String firstChequeNo) {
		this.firstChequeNo = firstChequeNo;
	}
	public String getLastChequeNo() {
		return lastChequeNo;
	}
	public void setLastChequeNo(String lastChequeNo) {
		this.lastChequeNo = lastChequeNo;
	}

	private String setupDate, cottonHeap, discardTime, setupTime;
	public String getDiscardTime() {
		return discardTime;
	}
	public void setDiscardTime(String discardTime) {
		this.discardTime = discardTime;
	}
	public String getSetupTime() {
		return setupTime;
	}
	public void setSetupTime(String setupTime) {
		this.setupTime = setupTime;
	}

	private String firstChequeNo, lastChequeNo;
	
	
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
