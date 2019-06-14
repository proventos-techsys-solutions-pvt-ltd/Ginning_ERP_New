package com.prov.bean;

public class StockMast {
	
	private int id, companyId;
	
	private String stockDate;
	
	private double rawCotton, cottonBales, cottonSeed, cottonSeedOil, cottonCakes, avgRate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getStockDate() {
		return stockDate;
	}

	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}

	public double getRawCotton() {
		return rawCotton;
	}

	public void setRawCotton(double rawCotton) {
		this.rawCotton = rawCotton;
	}

	public double getCottonBales() {
		return cottonBales;
	}

	public void setCottonBales(double cottonBales) {
		this.cottonBales = cottonBales;
	}

	public double getCottonSeed() {
		return cottonSeed;
	}

	public void setCottonSeed(double cottonSeed) {
		this.cottonSeed = cottonSeed;
	}

	public double getCottonSeedOil() {
		return cottonSeedOil;
	}

	public void setCottonSeedOil(double cottonSeedOil) {
		this.cottonSeedOil = cottonSeedOil;
	}

	public double getCottonCakes() {
		return cottonCakes;
	}

	public void setCottonCakes(double cottonCakes) {
		this.cottonCakes = cottonCakes;
	}

	public double getAvgRate() {
		return avgRate;
	}

	public void setAvgRate(double avgRate) {
		this.avgRate = avgRate;
	}
	
	

}
