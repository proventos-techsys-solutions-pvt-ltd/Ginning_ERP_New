package com.prov.bean;

public class Invoice {
	
	private float bonusAmount;
	
	private int id, customerId, companyId, paidByoperator, voucherNo ;
	public int getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
	}
	public int getPaidByoperator() {
		return paidByoperator;
	}
	public void setPaidByoperator(int paidByoperator) {
		this.paidByoperator = paidByoperator;
	}
	private long total, amountPaid, pending, totalQuanity, cashAmount, chequeAmount, rtgsAmount, netPayable, pdcAmount, advance;
	
	public long getAdvance() {
		return advance;
	}
	public void setAdvance(long advance) {
		this.advance = advance;
	}
	public long getPdcAmount() {
		return pdcAmount;
	}
	public void setPdcAmount(long pdcAmount) {
		this.pdcAmount = pdcAmount;
	}
	public long getNetPayable() {
		return netPayable;
	}
	public void setNetPayable(long netPayable) {
		this.netPayable = netPayable;
	}
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
	public long getCashAmount() {
		return cashAmount;
	}
	public void setCashAmount(long cashAmount) {
		this.cashAmount = cashAmount;
	}
	public long getChequeAmount() {
		return chequeAmount;
	}
	public void setChequeAmount(long chequeAmount) {
		this.chequeAmount = chequeAmount;
	}
	public long getRtgsAmount() {
		return rtgsAmount;
	}
	public void setRtgsAmount(long rtgsAmount) {
		this.rtgsAmount = rtgsAmount;
	}
	public long getTotalQuanity() {
		return totalQuanity;
	}
	public void setTotalQuanity(long totalQuanity) {
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
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public long getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(long amountPaid) {
		this.amountPaid = amountPaid;
	}
	public long getPending() {
		return pending;
	}
	public void setPending(long pending) {
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
	
	