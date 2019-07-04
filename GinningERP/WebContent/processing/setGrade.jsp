<%@page import="java.util.stream.IntStream"%>
<%@page import="com.prov.dbinsertion.AddGradeDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.prov.bean.GradeDetails"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.dbops.Grading"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	String gradeData = request.getParameter("output");
    
    	JSONParser parser = new JSONParser();
    	
    	JSONObject json = (JSONObject) parser.parse(gradeData);
    	
    	

    	JSONArray jsonArray = (JSONArray)json.get("gradeList");
    	
    	ArrayList<GradeDetails> gradeList = new ArrayList<GradeDetails>();
    	
    	for(int i=0; i<jsonArray.size(); i++ )
    	{
    		GradeDetails grade = new GradeDetails();
        	
        	grade.setWeighmentId((int)json.get("weighmentId"));
        	grade.setMaterial((String)json.get("material"));
        	grade.setRst((int)json.get("rst"));
        	grade.setAuthorizedBy((String)json.get("authorizer"));
        	
        	JSONObject gradeJson = (JSONObject)jsonArray.get(i);
        	
        	grade.setQuantity((double)gradeJson.get("quantity"));
        	grade.setGrade((String)gradeJson.get("grade"));
        	grade.setMoisture((double)json.get("moisture"));
        	grade.setMoisture((double)json.get("rate"));
        	
        	gradeList.add(grade);
        	
    	}
    	
    	AddGradeDetails addGrades = new AddGradeDetails();
    	
    	int ids[] = null;
    	int i=0;
    	
    	for(GradeDetails grade: gradeList){
    		
    		ids[0] = addGrades.addGradeDetails(grade);
    		i++;
    		
    	}

    	boolean contains = IntStream.of(ids).anyMatch(x -> x == 0);
    	
    	if(contains){
    		response.sendRedirect("errorPage.html");
    	}
    	else{
    		response.sendRedirect("../processing/GoodsReceiptNote.jsp");
    	}
    	
    %>