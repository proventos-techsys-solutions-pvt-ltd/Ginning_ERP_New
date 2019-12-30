<%@ page errorPage="../admin/Error.jsp" %>  
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="com.prov.bean.StockMast"%>
<%@ page import="com.prov.report.StockMasterReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	
	int companyId = Integer.parseInt(request.getParameter("companyId"));
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	if(startDate == "" && endDate == ""){
	
		StockMasterReport report = new StockMasterReport();
		
		if(companyId >0){
			
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
			
			out.print(jsonObj);
			out.flush();
			
		}else if(companyId == 0){
	
			JSONObject stockOpening = report.getTodaysOpeningStockForAll();
			JSONObject stockCurrent = report.getTodaysStockForAll();
			
			System.out.println("todayOpening"+stockOpening.toString());
			System.out.println(stockCurrent.toString());
			
			double rawCotton = stockCurrent.getDouble("rawCotton") - stockOpening.getDouble("rawCotton");
			double cottonBales = stockCurrent.getDouble("cottonBales") - stockOpening.getDouble("cottonBales");
			double cotonSeed = stockCurrent.getDouble("cottonSeed") - stockOpening.getDouble("cottonSeed");
			double cottonSeedOil = stockCurrent.getDouble("cottonSeedOil") - stockOpening.getDouble("cottonSeedOil");
			double cottonCake = stockCurrent.getDouble("cottonCakes") - stockOpening.getDouble("cottonCakes");
			
			JSONObject stockAddition = new JSONObject();
			
			stockAddition.put("rawCotton", rawCotton);
			stockAddition.put("cottonBales", cottonBales);
			stockAddition.put("cottonSeed", cotonSeed);
			stockAddition.put("cottonSeedOil", cottonSeedOil);
			stockAddition.put("cottonCakes", cottonCake);
			stockAddition.put("stockDate", stockCurrent.get("stockDate"));
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("openingStock", stockOpening);
			jsonObj.put("stockAddition", stockAddition);
			jsonObj.put("closingStock", stockCurrent);
			
			out.print(jsonObj);
			out.flush();
			
		}
	}else{

		StockMasterReport report = new StockMasterReport();
		
		if(companyId >0){
			
			StockMast todayOpeningStock = report.getStockForDate(companyId, startDate);
			
			StockMast todayClosingStock = report.getStockForDate(companyId, endDate);
			
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
			
			out.print(jsonObj);
			out.flush();
		}else if(companyId == 0){
	
			JSONObject stockOpening = report.getStockForAllByDate(startDate);
			JSONObject stockCurrent = report.getStockForAllByDate(endDate);
			
			System.out.println("todayOpening"+stockOpening.toString());
			System.out.println(stockCurrent.toString());
			
			double rawCotton = stockCurrent.getDouble("rawCotton") - stockOpening.getDouble("rawCotton");
			double cottonBales = stockCurrent.getDouble("cottonBales") - stockOpening.getDouble("cottonBales");
			double cotonSeed = stockCurrent.getDouble("cottonSeed") - stockOpening.getDouble("cottonSeed");
			double cottonSeedOil = stockCurrent.getDouble("cottonSeedOil") - stockOpening.getDouble("cottonSeedOil");
			double cottonCake = stockCurrent.getDouble("cottonCakes") - stockOpening.getDouble("cottonCakes");
			
			JSONObject stockAddition = new JSONObject();
			
			stockAddition.put("rawCotton", rawCotton);
			stockAddition.put("cottonBales", cottonBales);
			stockAddition.put("cottonSeed", cotonSeed);
			stockAddition.put("cottonSeedOil", cottonSeedOil);
			stockAddition.put("cottonCakes", cottonCake);
			stockAddition.put("stockDate", stockCurrent.get("stockDate"));
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("openingStock", stockOpening);
			jsonObj.put("stockAddition", stockAddition);
			jsonObj.put("closingStock", stockCurrent);
			
			System.out.println(jsonObj);
			
			out.print(jsonObj);
			out.flush();
		}
	}
	
	
%>