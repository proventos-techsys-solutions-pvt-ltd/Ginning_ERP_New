<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.bean.Bank"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.BankReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.StockMast"%>
<%@page import="com.prov.report.StockMasterReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	
    int companyId = Integer.parseInt(request.getParameter("companyId"));
    
    JSONObject parentJson = new JSONObject();

	StockMasterReport report = new StockMasterReport();
	
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
	
	JSONObject stockObj = new JSONObject();
	
	stockObj.put("openingStock", openingStock);
	stockObj.put("stockAddition", stockAddition);
	stockObj.put("closingStock", closingStock);
	
	parentJson.put("stock", stockObj);
	
	BankReport br = new BankReport();
	
	ArrayList<Bank> banks = br.getBankReport(companyId);
	
	JSONArray banksJson = new JSONArray();
	JSONObject cashAccount = null;
	
	for(Bank b:banks){
		if(b.getIfsc() == null && b.getMicr() == null){
			 cashAccount = new JSONObject(b);
		}
		else{
			banksJson.put(new JSONObject(b));
		}
	}
	
	parentJson.put("banks", banksJson);
	parentJson.put("cashAccount", cashAccount);
	
	out.print(parentJson);
	out.flush();
	
    
    %>