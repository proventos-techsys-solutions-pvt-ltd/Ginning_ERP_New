package com.prov.bean;

public class WeighMast {

	private int rst, cid, vid, weighRate; 
	
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

	public int getWeighRate() {
		return weighRate;
	}

	public void setWeighRate(int weighRate) {
		this.weighRate = weighRate;
	}

	public float getGross() {
		return gross;
	}

	public void setGross(float gross) {
		this.gross = gross;
	}

	public float getTare() {
		return tare;
	}

	public void setTare(float tare) {
		this.tare = tare;
	}

	public float getNet() {
		return net;
	}

	public void setNet(float net) {
		this.net = net;
	}

	public float getGradeRate() {
		return gradeRate;
	}

	public void setGradeRate(float gradeRate) {
		this.gradeRate = gradeRate;
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

	public String getGrossWtTime() {
		return grossWtTime;
	}

	public void setGrossWtTime(String grossWtTime) {
		this.grossWtTime = grossWtTime;
	}

	public String getTareWtTime() {
		return tareWtTime;
	}

	public void setTareWtTime(String tareWtTime) {
		this.tareWtTime = tareWtTime;
	}

	private float gross, tare, net, gradeRate;
	
	private String material, grade, grossWtTime, tareWtTime;

		
}
