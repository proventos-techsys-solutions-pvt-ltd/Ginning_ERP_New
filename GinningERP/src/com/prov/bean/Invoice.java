package com.prov.bean;

public class Invoice {
	
	private float bonusAmount;
	
	private int id, customerId, companyId, paidByoperator ;
	public int getPaidByoperator() {
		return paidByoperator;
	}
	public void setPaidByoperator(int paidByoperator) {
		this.paidByoperator = paidByoperator;
	}
	private double total, amountPaid, pending, totalQuanity, cashAmount, chequeAmount, rtgsAmount ;
	
	public float getBonusAmount() {
		return bonusAmount;
	}
	public void setBonusAmount(float bonusAmount) {
		this.bonusAmount = bonusAmount;
	}
	private float unloadingCharges;
	
	public float getUnloadingCharges() {
		return unloadingCharges;
	}
	public void setUnloadingCharges(float unloadingCharges) {
		this.unloadingCharges = unloadingCharges;
	}
	public double getCashAmount() {
		return cashAmount;
	}
	public void setCashAmount(double cashAmount) {
		this.cashAmount = cashAmount;
	}
	public double getChequeAmount() {
		return chequeAmount;
	}
	public void setChequeAmount(double chequeAmount) {
		this.chequeAmount = chequeAmount;
	}
	public double getRtgsAmount() {
		return rtgsAmount;
	}
	public void setRtgsAmount(double rtgsAmount) {
		this.rtgsAmount = rtgsAmount;
	}
	public double getTotalQuanity() {
		return totalQuanity;
	}
	public void setTotalQuanity(double totalQuanity) {
		this.totalQuanity = totalQuanity;
	}
	private String invoiceNo, invDate, authorizer, note;
	
	public String getAuthorizer() {
		return authorizer;
	}
	public void setAuthorizer(String authorizer) {
		this.authorizer = authorizer;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(double amountPaid) {
		this.amountPaid = amountPaid;
	}
	public double getPending() {
		return pending;
	}
	public void setPending(double pending) {
		this.pending = pending;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getInvDate() {
		return invDate;
	}
	public void setInvDate(String invDate) {
		this.invDate = invDate;
	}
	
	
}	
	
	