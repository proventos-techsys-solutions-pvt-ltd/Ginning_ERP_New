package com.prov.bean;

public class Amanat {
	
	private int id, gradeId, customerId;
		
	private String amanatDate;
	
	private double finalRate;

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