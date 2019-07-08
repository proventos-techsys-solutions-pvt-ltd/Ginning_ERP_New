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
    	
    	System.out.println(jsonArray);
    	
    	ArrayList<GradeDetails> gradeList = new ArrayList<GradeDetails>();
    	
    	for(int i=0; i<jsonArray.size(); i++ )
    	{
    		GradeDetails grade = new GradeDetails();
        	
        	grade.setWeighmentId(Integer.parseInt((String)json.get("weighmentId")));
        	grade.setMaterial(((String)json.get("material")).toUpperCase());
        	grade.setRst(Integer.parseInt((String)json.get("rst")));
        	grade.setAuthorizedBy(((String)json.get("authorizer")).toUpperCase());
        	
        	JSONObject gradeJson = (JSONObject)jsonArray.get(i);
        	
        	grade.setQuantity(Float.parseFloat((String)gradeJson.get("quantity")));
        	grade.setGrade(((String)gradeJson.get("grade")).toUpperCase());
        	grade.setMoisture(Float.parseFloat((String)gradeJson.get("moisture")));
        	grade.setRate(Float.parseFloat((String)gradeJson.get("rate")));
        	
        	gradeList.add(grade);
        	
    	}
    	
    	AddGradeDetails addGrades = new AddGradeDetails();
    	int i=0;
    	ArrayList<Integer> ids = new ArrayList<Integer>();
    	
    	for(GradeDetails grade: gradeList){
    		
    		ids.add(i, addGrades.addGradeDetails(grade));
    		i++;
    		
    	}

    	boolean contains = false;
    	for(int j=0;j<ids.size();j++)
    	{
    		if(ids.get(j)!=0){
    			contains=true;
    		}
    	}	
    	
    	if(!contains){
    		response.sendRedirect("errorPage.html");
    	}
    	else{
    		response.sendRedirect("../processing/GoodsReceiptNote.jsp");
    	}
    	
    %>