package com.prov.bean;

public class Transactions {
	
	
	@Override
	public String toString() {
		return "Transactions [id=" + id + ", vouchNo=" + vouchNo + ", accountId=" + accountId + ", transactionDate="
				+ transactionDate + ", contactId=" + contactId + ", narration=" + narration + ", vouchRef=" + vouchRef
				+ ", transactionType=" + transactionType + ", debit=" + debit + ", credit=" + credit + "]";
	}

	private int id, vouchNo, accountId;
	
	private String transactionDate, contactId, narration, vouchRef, transactionType;
	
	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	private double debit, credit;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVouchNo() {
		return vouchNo;
	}

	public void setVouchNo(int vouchNo) {
		this.vouchNo = vouchNo;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getContactId() {
		return contactId;
	}

	public void setContactId(String contactId) {
		this.contactId = contactId;
	}

	public String getNarration() {
		return narration;
	}

	public void setNarration(String narration) {
		this.narration = narration;
	}

	public String getVouchRef() {
		return vouchRef;
	}

	public void setVouchRef(String vouchRef) {
		this.vouchRef = vouchRef;
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
