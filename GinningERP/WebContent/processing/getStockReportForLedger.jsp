<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.StockMast"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="com.prov.report.StockMasterReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

int companyId = Integer.parseInt(request.getParameter("companyId"));

StockMasterReport report = new StockMasterReport();

if(companyId >0){
	
	AmanatReport amanatReport = new AmanatReport();
	
	double amanatQty = amanatReport.totalAmanatQty(companyId);
	
	StockMast todayOpeningStock = report.getTodaysOpeningStock(companyId);
	
	StockMast todayClosingStock = report.getTodaysStockReport(companyId);
	
	StockMast todayStockAddition = new StockMast();
	
	todayStockAddition.setAvgRate(todayClosingStock.getAvgRate());
	todayStockAddition.setCompanyId(todayClosingStock.getCompanyId());
	todayStockAddition.setRawCotton(Math.ceil(todayClosingStock.getRawCotton() - todayOpeningStock.getRawCotton()));
	todayStockAddition.setCottonBales(Math.ceil(todayClosingStock.getCottonBales() - todayOpeningStock.getCottonBales()));
	todayStockAddition.setCottonSeed(Math.ceil(todayClosingStock.getCottonSeed() - todayOpeningStock.getCottonSeed()));
	todayStockAddition.setCottonSeedOil(Math.ceil(todayClosingStock.getCottonSeedOil() - todayOpeningStock.getCottonSeedOil()));
	todayStockAddition.setCottonCakes(Math.ceil(todayClosingStock.getCottonCakes() - todayOpeningStock.getCottonCakes()));
	todayStockAddition.setStockDate(todayClosingStock.getStockDate());
	
	JSONObject stockAddition = new JSONObject(todayStockAddition);
	
	JSONObject openingStock = new JSONObject(todayOpeningStock);
	
	JSONObject closingStock = new JSONObject(todayClosingStock);
	
	JSONObject jsonObj = new JSONObject();
	
	jsonObj.put("openingStock", openingStock);
	jsonObj.put("stockAddition", stockAddition);
	jsonObj.put("closingStock", closingStock);
	jsonObj.put("amanatQty", amanatQty);
	
	out.print(jsonObj);
	out.flush();
	
}else if(companyId == 0){

	JSONObject stockOpening = report.getTodaysOpeningStockForAll();
	JSONObject stockCurrent = report.getTodaysStockForAll();
		
	AmanatReport amanatReport = new AmanatReport();
	double amanatQty = amanatReport.totalAmanatQty();
	
	JSONObject stockAddition = new JSONObject();
	if(stockCurrent.length() > 0){
	
		double rawCotton = stockCurrent.getDouble("rawCotton") - stockOpening.getDouble("rawCotton");
		double cottonBales = stockCurrent.getDouble("cottonBales") - stockOpening.getDouble("cottonBales");
		double cotonSeed = stockCurrent.getDouble("cottonSeed") - stockOpening.getDouble("cottonSeed");
		double cottonSeedOil = stockCurrent.getDouble("cottonSeedOil") - stockOpening.getDouble("cottonSeedOil");
		double cottonCake = stockCurrent.getDouble("cottonCakes") - stockOpening.getDouble("cottonCakes");
		
		stockAddition.put("rawCotton", rawCotton);
		stockAddition.put("cottonBales", cottonBales);
		stockAddition.put("cottonSeed", cotonSeed);
		stockAddition.put("cottonSeedOil", cottonSeedOil);
		stockAddition.put("cottonCakes", cottonCake);
		stockAddition.put("stockDate", stockCurrent.get("stockDate"));
	}
	
	JSONObject jsonObj = new JSONObject();
	
	jsonObj.put("openingStock", stockOpening);
	jsonObj.put("stockAddition", stockAddition);
	jsonObj.put("closingStock", stockCurrent);
	jsonObj.put("amanatQty", amanatQty);
	
	out.print(jsonObj);
	out.flush();
	
}	

%>