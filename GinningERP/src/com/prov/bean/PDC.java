package com.prov.bean;

public class PDC {
	
	private int id, customerId, invoiceId, chequeId, rtgsId, glId;
	public int getChequeId() {
		return chequeId;
	}
	public void setChequeId(int chequeId) {
		this.chequeId = chequeId;
	}
	public int getRtgsId() {
		return rtgsId;
	}
	public void setRtgsId(int rtgsId) {
		this.rtgsId = rtgsId;
	}
	public int getGlId() {
		return glId;
	}
	public void setGlId(int glId) {
		this.glId = glId;
	}
	private String payDate, modeOfPayment;
	private double amount;
	
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
	public int getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
}
