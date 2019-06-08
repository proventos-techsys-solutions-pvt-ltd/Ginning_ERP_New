package com.prov.bean;

public class Amanat {
	
	private int id;
	
	private int rst, cid, vid;
	
	private double contractRate, total, finalRate;
	
	public double getFinalRate() {
		return finalRate;
	}
	public void setFinalRate(double finalRate) {
		this.finalRate = finalRate;
	}
	public String getDateOfExpiry() {
		return dateOfExpiry;
	}
	public void setDateOfExpiry(String dateOfExpiry) {
		this.dateOfExpiry = dateOfExpiry;
	}
	private String amanatDate, dateOfExpiry;
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
	public double getContractRate() {
		return contractRate;
	}
	public void setContractRate(double contractRate) {
		this.contractRate = contractRate;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getAmanatDate() {
		return amanatDate;
	}
	public void setAmanatDate(String amanatDate) {
		this.amanatDate = amanatDate;
	}

}
