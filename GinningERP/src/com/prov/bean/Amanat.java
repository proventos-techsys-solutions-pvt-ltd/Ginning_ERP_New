package com.prov.bean;

public class Amanat {
	
	@Override
	public String toString() {
		return "Amanat [id=" + id + ", gradeId=" + gradeId + ", customerId=" + customerId + ", rst=" + rst
				+ ", invoicedQty=" + invoicedQty + ", amanatDate=" + amanatDate + ", finalRate=" + finalRate
				+ ", difference=" + difference + "]";
	}

	private int id, gradeId, customerId, rst;
	
	private long invoicedQty;
		
	public long getInvoicedQty() {
		return invoicedQty;
	}

	public void setInvoicedQty(long invoicedQty) {
		this.invoicedQty = invoicedQty;
	}

	public int getRst() {
		return rst;
	}

	public void setRst(int rst) {
		this.rst = rst;
	}

	private String amanatDate, amanatNo;
	
	public String getAmanatNo() {
		return amanatNo;
	}

	public void setAmanatNo(String amanatNo) {
		this.amanatNo = amanatNo;
	}

	private double finalRate, difference;

	public double getDifference() {
		return difference;
	}

	public void setDifference(double difference) {
		this.difference = difference;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getAmanatDate() {
		return amanatDate;
	}

	public void setAmanatDate(String amanatDate) {
		this.amanatDate = amanatDate;
	}

	public double getFinalRate() {
		return finalRate;
	}

	public void setFinalRate(double finalRate) {
		this.finalRate = finalRate;
	}
	
}	