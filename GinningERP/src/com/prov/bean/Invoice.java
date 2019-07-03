package com.prov.bean;

public class Invoice {
	
	private int id, weighmentId, companyId ;
	private double total, amountPaid, pending;
	private String invoiceNo, invDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWeighmentId() {
		return weighmentId;
	}
	public void setWeighmentId(int weighmentId) {
		this.weighmentId = weighmentId;
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
	
	