package com.prov.bean;

public class Cheque {
	
	private int id, customerId, bankId, invoiceId, status, chequePaymentStatus, voucherNo,companyId;
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public int getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
	}
	public int getChequePaymentStatus() {
		return chequePaymentStatus;
	}
	public void setChequePaymentStatus(int chequePaymentStatus) {
		this.chequePaymentStatus = chequePaymentStatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private String customerName, invoiceNo, bankName, chequeDate, chequeNo;
	private long chequeAmount;
	
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
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public int getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getChequeNo() {
		return chequeNo;
	}
	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}
	public String getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(String chequeDate) {
		this.chequeDate = chequeDate;
	}
	public long getChequeAmount() {
		return chequeAmount;
	}
	public void setChequeAmount(long chequeAmount) {
		this.chequeAmount = chequeAmount;
	}

}
