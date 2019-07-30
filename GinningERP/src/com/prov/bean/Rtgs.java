package com.prov.bean;

public class Rtgs {
	
	private int id, invoiceId, customerId;
	private String accountNo, bankName, ifsc, rtgsDate, customerName;
	private double rtgsAmount;

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
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public String getRtgsDate() {
		return rtgsDate;
	}
	public void setRtgsDate(String rtgsDate) {
		this.rtgsDate = rtgsDate;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public double getRtgsAmount() {
		return rtgsAmount;
	}
	public void setRtgsAmount(double rtgsAmount) {
		this.rtgsAmount = rtgsAmount;
	}
	
	

}
