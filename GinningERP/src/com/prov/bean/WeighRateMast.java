package com.prov.bean;

public class WeighRateMast {
	
	private int id;
	private String vehicle_name, vehicle_Desc;
	public String getVehicle_Desc() {
		return vehicle_Desc;
	}
	public void setVehicle_Desc(String vehicle_Desc) {
		this.vehicle_Desc = vehicle_Desc;
	}
	private double weighrate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVehicle_name() {
		return vehicle_name;
	}
	public void setVehicle_name(String vehicle_name) {
		this.vehicle_name = vehicle_name;
	}
	public double getWeighrate() {
		return weighrate;
	}
	public void setWeighrate(double weighrate) {
		this.weighrate = weighrate;
	}
	
}
