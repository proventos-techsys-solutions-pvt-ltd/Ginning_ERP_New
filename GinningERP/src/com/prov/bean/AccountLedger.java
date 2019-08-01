package com.prov.bean;

public class AccountLedger {
	
	private int monthId, accountId, groupId;
	
	private String ledgerDate, accountLedger, ledgerDesc;
	
	private double openingBal;

	public int getMonthId() {
		return monthId;
	}

	public void setMonthId(int monthId) {
		this.monthId = monthId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getLedgerDate() {
		return ledgerDate;
	}

	public void setLedgerDate(String ledgerDate) {
		this.ledgerDate = ledgerDate;
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

	public double getOpeningBal() {
		return openingBal;
	}

	public void setOpeningBal(double openingBal) {
		this.openingBal = openingBal;
	}

}
