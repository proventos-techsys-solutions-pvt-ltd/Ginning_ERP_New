package com.prov.bean;

public class Invoice {
	
	private int id;
	
	private int rst, cid, vid;
	
	private double netWeight, finalRate, total, amountPaid, pending;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRst() {
		return rst;
	}

	public void setRst(int rst) {
		this.rst = rst;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
	}

	public double getNetWeight() {
		return netWeight;
	}

	public void setNetWeight(double netWeight) {
		this.netWeight = netWeight;
	}

	public double getFinalRate() {
		return finalRate;
	}

	public void setFinalRate(double finalRate) {
		this.finalRate = finalRate;
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

	
}
