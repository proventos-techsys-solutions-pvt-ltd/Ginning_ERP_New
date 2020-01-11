package com.prov.bean;

public class InvoiceItems {
	
	int id, invoiceId, weighmentId, gradeId, rst;
	double quantity;


	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public int getRst() {
		return rst;
	}

	public void setRst(int rst) {
		this.rst = rst;
	}

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

	public int getWeighmentId() {
		return weighmentId;
	}

	public void setWeighmentId(int weighmentId) {
		this.weighmentId = weighmentId;
	}
	
	

}
