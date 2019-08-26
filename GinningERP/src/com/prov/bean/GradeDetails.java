package com.prov.bean;

public class GradeDetails {
	
	private int id, weighmentId, rst;
	double pdcAmount;
	
	String pdcDate;

	
	public double getPdcAmount() {
		return pdcAmount;
	}

	public void setPdcAmount(double pdcAmount) {
		this.pdcAmount = pdcAmount;
	}

	public String getPdcDate() {
		return pdcDate;
	}

	public void setPdcDate(String pdcDate) {
		this.pdcDate = pdcDate;
	}

	private String material, grade, authorizedBy;

	private float bonusPerQtl;
	
	public float getBonusPerQtl() {
		return bonusPerQtl;
	}

	public void setBonusPerQtl(float bonusPerQtl) {
		this.bonusPerQtl = bonusPerQtl;
	}

	private double quantity, rate, moisture;

	public double getMoisture() {
		return moisture;
	}

	public void setMoisture(double moisture) {
		this.moisture = moisture;
	}

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

	public int getRst() {
		return rst;
	}

	public void setRst(int rst) {
		this.rst = rst;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAuthorizedBy() {
		return authorizedBy;
	}

	public void setAuthorizedBy(String authorizedBy) {
		this.authorizedBy = authorizedBy;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}
	
	

}
