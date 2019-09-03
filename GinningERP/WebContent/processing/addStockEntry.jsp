<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddStockMast"%>
<%@page import="com.prov.bean.StockMast"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	String date = request.getParameter("date");
    	double rawMaterial = Double.parseDouble(request.getParameter("rawMaterial"));
    	double cottonBaleQty = Double.parseDouble(request.getParameter("cottonBaleQty"));
    	double cottonSeedQty = Double.parseDouble(request.getParameter("cottonSeedQty"));
    	double cottonSeedOilQty = Double.parseDouble(request.getParameter("cottonSeedOilQty"));
    	double cottonCakeQty = Double.parseDouble(request.getParameter("cottonCakeQty"));

    	StockMast stock = new StockMast();
    	
    	stock.setCompanyId(companyId);
    	stock.setStockDate(date);
    	stock.setRawCotton(rawMaterial);
    	stock.setCottonBales(cottonBaleQty);
    	stock.setCottonSeed(cottonSeedQty);
    	stock.setCottonSeedOil(cottonSeedOilQty);
    	stock.setCottonCakes(cottonCakeQty);
    	
    	AddStockMast stockEntry = new AddStockMast();
    	
    	int stockId = stockEntry.addStockMast(stock);
    	
   		session.setAttribute("stockId", Integer.toString(stockId));
    	response.sendRedirect("../views/SetupStock.jsp");
    %>