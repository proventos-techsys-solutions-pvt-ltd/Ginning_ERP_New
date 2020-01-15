
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="com.prov.report.PurchaseReport"%>
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
			jsonObj.put("filtered", "no");
			
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
			jsonObj.put("filtered", "no");
			
			out.print(jsonObj);
			out.flush();
			
		}
	}else{

		StockMasterReport report = new StockMasterReport();
		
		if(companyId >0){
			
			AmanatReport amanatReport = new AmanatReport();
			double amanatQty = amanatReport.totalAmanatQty(companyId,startDate,endDate);
			
			StockMast todayOpeningStock = report.getStockForStartDate(companyId, startDate);
			
			StockMast todayClosingStock = report.getStockForEndDate(companyId, endDate);
			
			StockMast todayStockAddition = new StockMast();
			
			todayStockAddition.setAvgRate(todayClosingStock.getAvgRate());
			todayStockAddition.setCompanyId(todayClosingStock.getCompanyId());
			if(Math.ceil(todayClosingStock.getRawCotton() - todayOpeningStock.getRawCotton()) < 0){
				todayStockAddition.setRawCotton(0);
				todayStockAddition.setCottonBales(0);
				todayStockAddition.setCottonSeed(0);
				todayStockAddition.setCottonSeedOil(0);
				todayStockAddition.setCottonCakes(0);
			}else{
				todayStockAddition.setRawCotton(Math.ceil(todayClosingStock.getRawCotton() - todayOpeningStock.getRawCotton()));
				todayStockAddition.setCottonBales(Math.ceil(todayClosingStock.getCottonBales() - todayOpeningStock.getCottonBales()));
				todayStockAddition.setCottonSeed(Math.ceil(todayClosingStock.getCottonSeed() - todayOpeningStock.getCottonSeed()));
				todayStockAddition.setCottonSeedOil(Math.ceil(todayClosingStock.getCottonSeedOil() - todayOpeningStock.getCottonSeedOil()));
				todayStockAddition.setCottonCakes(Math.ceil(todayClosingStock.getCottonCakes() - todayOpeningStock.getCottonCakes()));
			}
			
			todayStockAddition.setStockDate(todayClosingStock.getStockDate());
			
			JSONObject stockAddition = new JSONObject(todayStockAddition);
			
			JSONObject openingStock = new JSONObject(todayOpeningStock);
			
			JSONObject closingStock = new JSONObject(todayClosingStock);
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("openingStock", openingStock);
			jsonObj.put("stockAddition", stockAddition);
			jsonObj.put("closingStock", closingStock);
			jsonObj.put("amanatQty", amanatQty);
			
			PurchaseReport pr = new PurchaseReport();
			JSONObject json = pr.getTotalPurchaseBetweenDate(startDate,endDate, companyId);
			json.put("rtgsPdp", pr.getTotalPdpPurchaseBetweenDate("3",startDate,endDate, companyId ));
			json.put("cashPdp", pr.getTotalPdpPurchaseBetweenDate("1",startDate,endDate, companyId));
			json.put("chequePdp", pr.getTotalPdpPurchaseBetweenDate("2",startDate,endDate, companyId));
			
			long totalPurchase = json.getLong("chequeAmount") + json.getLong("cashAmount") + json.getLong("rtgsAmount");
			
			long totalPdpPurchase = json.getLong("chequePdp") + json.getLong("rtgsPdp") + json.getLong("cashPdp");
			json.put("totalPurchase", totalPurchase);
			json.put("totalPdpPurchase", totalPdpPurchase);
			jsonObj.put("purchaseReport", json);
			StockMasterReport stockMastReport = new StockMasterReport();
			jsonObj.put("averageRate", stockMastReport.getTodaysAverageRate(startDate, endDate, companyId));
			jsonObj.put("filtered", "yes");
			
			out.print(jsonObj);
			out.flush();
		}else if(companyId == 0){
	
			JSONObject stockOpening = report.getStockForAllByStartDate(startDate);
			JSONObject stockCurrent = report.getStockForAllByEndDate(endDate);
			
			AmanatReport amanatReport = new AmanatReport();
			double amanatQty = amanatReport.totalAmanatQty(startDate,endDate);
			JSONObject stockAddition = new JSONObject();
			
			double rawCotton = stockCurrent.getDouble("rawCotton") - stockOpening.getDouble("rawCotton");
			double cottonBales = stockCurrent.getDouble("cottonBales") - stockOpening.getDouble("cottonBales");
			double cotonSeed = stockCurrent.getDouble("cottonSeed") - stockOpening.getDouble("cottonSeed");
			double cottonSeedOil = stockCurrent.getDouble("cottonSeedOil") - stockOpening.getDouble("cottonSeedOil");
			double cottonCake = stockCurrent.getDouble("cottonCakes") - stockOpening.getDouble("cottonCakes");
			
			if(rawCotton< 0){
				stockAddition.put("rawCotton", 0);
				stockAddition.put("cottonBales", 0);
				stockAddition.put("cottonSeed", 0);
				stockAddition.put("cottonSeedOil", 0);
				stockAddition.put("cottonCakes", 0);
			}else{
				stockAddition.put("rawCotton", rawCotton);
				stockAddition.put("cottonBales", cottonBales);
				stockAddition.put("cottonSeed", cotonSeed);
				stockAddition.put("cottonSeedOil", cottonSeedOil);
				stockAddition.put("cottonCakes", cottonCake);
			}
			
			stockAddition.put("stockDate", stockCurrent.get("stockDate"));
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("openingStock", stockOpening);
			jsonObj.put("stockAddition", stockAddition);
			jsonObj.put("closingStock", stockCurrent);
			jsonObj.put("amanatQty", amanatQty);
			jsonObj.put("filtered", "yes");
			
			PurchaseReport pr = new PurchaseReport();
			JSONObject json = pr.getTotalPurchaseBetweenDate(startDate,endDate);
			json.put("rtgsPdp", pr.getTotalPdpPurchaseBetweenDate("3",startDate,endDate ));
			json.put("cashPdp", pr.getTotalPdpPurchaseBetweenDate("1",startDate,endDate));
			json.put("chequePdp", pr.getTotalPdpPurchaseBetweenDate("2",startDate,endDate));
			
			long totalPurchase = json.getLong("chequeAmount") + json.getLong("cashAmount") + json.getLong("rtgsAmount");
			
			long totalPdpPurchase = json.getLong("chequePdp") + json.getLong("rtgsPdp") + json.getLong("cashPdp");
			json.put("totalPurchase", totalPurchase);
			json.put("totalPdpPurchase", totalPdpPurchase);
			jsonObj.put("purchaseReport", json);
			StockMasterReport stockMastReport = new StockMasterReport();
			jsonObj.put("averageRate", stockMastReport.getTodaysAverageRate(startDate, endDate));
			
			out.print(jsonObj);
			out.flush();
		}
	}
	
	
%>