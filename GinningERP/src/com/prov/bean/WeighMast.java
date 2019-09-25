package com.prov.bean;

public class WeighMast {

	private int id, rst, vid, dsId; 

	public int getDsId() {
		return dsId;
	}

	public void setDsId(int dsId) {
		this.dsId = dsId;
	}

	private float gross, tare, net;
	
	private String material, grossWtTime, tareWtTime, weighmentDate, wbOperator;

	public String getWbOperator() {
		return wbOperator;
	}

	public void setWbOperator(String wbOperator) {
		this.wbOperator = wbOperator;
	}

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

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
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

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
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

	public String getWeighmentDate() {
		return weighmentDate;
	}

	public void setWeighmentDate(String weighmentDate) {
		this.weighmentDate = weighmentDate;
	}
	
	
}