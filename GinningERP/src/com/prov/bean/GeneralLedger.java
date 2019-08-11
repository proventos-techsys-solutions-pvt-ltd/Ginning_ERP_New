package com.prov.bean;

public class GeneralLedger {
	
	private int id, voucherNo, accountId, monthId, groupId;
	
	private String glDate, accountLedger, ledgerDesc;

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
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

	public double getClosingBal() {
		return closingBal;
	}

	public void setClosingBal(double closingBal) {
		this.closingBal = closingBal;
	}

	private double openingBal, debit, credit, closingBal;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getMonthId() {
		return monthId;
	}

	public void setMonthId(int monthId) {
		this.monthId = monthId;
	}

	public String getGlDate() {
		return glDate;
	}

	public void setGlDate(String glDate) {
		this.glDate = glDate;
	}

	public double getOpeningBal() {
		return openingBal;
	}

	public void setOpeningBal(double openingBal) {
		this.openingBal = openingBal;
	}

	public double getDebit() {
		return debit;
	}

	public void setDebit(double debit) {
		this.debit = debit;
	}

	public double getCredit() {
		return credit;
	}

	public void setCredit(double credit) {
		this.credit = credit;
	}
	
	
}
