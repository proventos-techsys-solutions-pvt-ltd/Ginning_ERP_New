package com.prov.bean;

public class BankRecoMaster {
	
	long id, companyId, bankId, bankGlId;
	double closingBalLedger, closingBalBank;
	String date;
	public long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}
	public long getBankId() {
		return bankId;
	}
	public void setBankId(long bankId) {
		this.bankId = bankId;
	}
	public long getBankGlId() {
		return bankGlId;
	}
	public void setBankGlId(long bankGlId) {
		this.bankGlId = bankGlId;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public double getClosingBalLedger() {
		return closingBalLedger;
	}
	public void setClosingBalLedger(double closingBalLedger) {
		this.closingBalLedger = closingBalLedger;
	}
	public double getClosingBalBank() {
		return closingBalBank;
	}
	public void setClosingBalBank(double closingBalBank) {
		this.closingBalBank = closingBalBank;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

}
