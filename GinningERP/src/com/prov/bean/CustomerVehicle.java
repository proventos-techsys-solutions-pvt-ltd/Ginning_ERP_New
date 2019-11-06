package com.prov.bean;

public class CustomerVehicle {
	
	private int id, cid, rst, vTypeId;
	private String vehicleNo, frontImage, rearImage;
	public String getFrontImage() {
		return frontImage;
	}
	public void setFrontImage(String frontImage) {
		this.frontImage = frontImage;
	}
	public String getRearImage() {
		return rearImage;
	}
	public void setRearImage(String rearImage) {
		this.rearImage = rearImage;
	}
	private Double weighRate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getRst() {
		return rst;
	}
	public void setRst(int rst) {
		this.rst = rst;
	}
	public int getvTypeId() {
		return vTypeId;
	}
	public void setvTypeId(int vTypeId) {
		this.vTypeId = vTypeId;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public Double getWeighRate() {
		return weighRate;
	}
	public void setWeighRate(Double weighRate) {
		this.weighRate = weighRate;
	}
	
	
}	