package com.prov.bean;

public class PaymentDetails {

	private int id, invoiceId, rtgsId, chequeId, modeId, cashVouhNo, paymentStatus; 
	
	private long amount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	public int getRtgsId() {
		return rtgsId;
	}

	public void setRtgsId(int rtgsId) {
		this.rtgsId = rtgsId;
	}

	public int getChequeId() {
		return chequeId;
	}

	public void setChequeId(int chequeId) {
		this.chequeId = chequeId;
	}

	public int getModeId() {
		return modeId;
	}

	public void setModeId(int modeId) {
		this.modeId = modeId;
	}

	public int getCashVouhNo() {
		return cashVouhNo;
	}

	public void setCashVouhNo(int cashVouhNo) {
		this.cashVouhNo = cashVouhNo;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	
}
