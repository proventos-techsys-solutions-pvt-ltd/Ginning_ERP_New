<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.prov.dbinsertion.AddStockMast"%>
<%@page import="com.prov.dbinsertion.AddGradeRateMaster"%>
<%@page import="com.prov.bean.GradeRateMaster"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.prov.dbinsertion.AddDailySetup"%>
<%@page import="com.prov.bean.DailySetup"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    String output = request.getParameter("dailySetupOutput");
    
    JSONParser parser = new JSONParser();
    
    JSONObject obj = (JSONObject)parser.parse(output);
    
    DailySetup ds = new DailySetup();
    
    
    String date = (String)obj.get("date") + (String)obj.get("setupTime");
    
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    Date formattedDate =  sdf.parse(date);
    
    SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd-yyyy HH:mm");
    String formattedDateStr = sdf2.format(formattedDate);

    ds.setSetupDate(formattedDateStr);
    ds.setBonusAmount(Float.parseFloat((String)obj.get("bonusAmount")));
    ds.setCompanyId(Integer.parseInt((String)obj.get("companyId")));
    ds.setBankId(Integer.parseInt((String)obj.get("todaysBankId")));
    ds.setCottonHeap((String)obj.get("heap"));
    ds.setFirstChequeNo(Long.parseLong((String)obj.get("firstChequeNo")));
    ds.setLastChequeNo(Long.parseLong((String)obj.get("lastChequeNo")));
    ds.setTotalCheques(Integer.parseInt((String)obj.get("totalCheques")));
   		
    AddDailySetup ads = new AddDailySetup();
   
    int setupId = 0;
    
    setupId = ads.addDailySetup(ds);
    
    JSONArray gradeArray = (JSONArray)obj.get("gradeRates");
    
    for(int i = 0; i<gradeArray.size(); i++){
    	GradeRateMaster gr = new GradeRateMaster();
    	
    	gr.setGradeId(Integer.parseInt((String)((JSONObject)gradeArray.get(i)).get("gradeId")));
    	gr.setRateDate((String)obj.get("date"));
    	gr.setRate(Double.parseDouble((String)((JSONObject)gradeArray.get(i)).get("gradeRate")));
    	
    	AddGradeRateMaster agr = new AddGradeRateMaster();
    	
    	agr.addGradeRateMaster(gr);
    }
    
    AddStockMast addStock = new AddStockMast();
    
    addStock.addOpeningStock();

    request.setAttribute("setupId", Integer.toString(setupId));
    request.getRequestDispatcher("../views/DailySetup.jsp").forward(request, response);
    
    %>