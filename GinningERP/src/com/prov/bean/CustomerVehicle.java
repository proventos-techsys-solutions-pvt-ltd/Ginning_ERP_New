package com.prov.bean;

public class CustomerVehicle {
	
	private int id;
	
    private int cid;
    
	private String vehicleNo, vehicleType, grossWtTime, tareWtTime;

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

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	

}
