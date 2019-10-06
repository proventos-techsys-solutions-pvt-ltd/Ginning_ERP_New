package com.prov.bean;

public class AccountName {
	
	private int id, accountId, accCategoryId, companyId, bankId;
	String accountLedger, ledgerDesc, ledgerDate;
	double openingBal;
	public double getOpeningBal() {
		return openingBal;
	}
	public void setOpeningBal(double openingBal) {
		this.openingBal = openingBal;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getAccCategoryId() {
		return accCategoryId;
	}
	public void setAccCategoryId(int accCategoryId) {
		this.accCategoryId = accCategoryId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getAccountLedger() {
		return accountLedger;
	}
	public void setAccountLedger(String accountLedger) {
		this.accountLedger = accountLedger;
	}
	public String getLedgerDesc() {
		return ledgerDesc;
	}
	public void setLedgerDesc(String ledgerDesc) {
		this.ledgerDesc = ledgerDesc;
	}
	public String getLedgerDate() {
		return ledgerDate;
	}
	public void setLedgerDate(String ledgerDate) {
		this.ledgerDate = ledgerDate;
	}

}
