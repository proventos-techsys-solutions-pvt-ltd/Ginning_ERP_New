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
    
    ds.setSetupDate((String)obj.get("date"));
    System.out.println(ds.getSetupDate());
    ds.setCompanyId(Integer.parseInt((String)obj.get("companyId")));
    ds.setBankId(Integer.parseInt((String)obj.get("todaysBankId")));
    ds.setCottonHeap((String)obj.get("heap"));
    ds.setFirstChequeNo(Long.parseLong((String)obj.get("firstChequeNo")));
    ds.setLastChequeNo(Long.parseLong((String)obj.get("lastChequeNo")));
    ds.setTotalCheques(Integer.parseInt((String)obj.get("totalCheques")));
   		
    AddDailySetup ads = new AddDailySetup();
    
    ads.addDailySetup(ds);
    
    JSONArray gradeArray = (JSONArray)obj.get("gradeRates");
    
    for(int i = 0; i<gradeArray.size(); i++){
    	GradeRateMaster gr = new GradeRateMaster();
    	
    	gr.setGradeId(Integer.parseInt((String)((JSONObject)gradeArray.get(i)).get("gradeId")));
    	gr.setRateDate((String)obj.get("date"));
    	gr.setRate(Double.parseDouble((String)((JSONObject)gradeArray.get(i)).get("gradeRate")));
    	
    	AddGradeRateMaster agr = new AddGradeRateMaster();
    	
    	agr.addGradeRateMaster(gr);
    }

    response.sendRedirect("../views/DailySetup.jsp");
    
    %>