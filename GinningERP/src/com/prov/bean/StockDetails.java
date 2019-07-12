package com.prov.bean;

public class StockDetails {
	
	private int id, invId, stockMastId, companyId; 
	private double totalQuantity, averageRate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInvId() {
		return invId;
	}
	public void setInvId(int invId) {
		this.invId = invId;
	}
	public int getStockMastId() {
		return stockMastId;
	}
	public void setStockMastId(int stockMastId) {
		this.stockMastId = stockMastId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public double getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(double totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public double getAverageRate() {
		return averageRate;
	}
	public void setAverageRate(double averageRate) {
		this.averageRate = averageRate;
	}
	
	
	
	
}
