<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbops.CheckAlreadyGraded"%>
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
    	
    	System.out.println(json);

    	JSONArray jsonArray = (JSONArray)json.get("gradeList");
    	
    	ArrayList<GradeDetails> gradeList = new ArrayList<GradeDetails>();
    	
    	CheckAlreadyGraded checkGradeExists = new CheckAlreadyGraded();
    	
    	int rowCount = checkGradeExists.alreadyGraded(Integer.parseInt((String)json.get("rst")));
    	
    	float pdcRate = 0;
       	int pdcMonths = 0;
       	double pdcAmount = 0;
       	String pdcDate = null;
    	
    	if(rowCount == 0){
		   	for(int i=0; i<jsonArray.size(); i++ )
		   	{
		   		GradeDetails grade = new GradeDetails();
		       	
		       	grade.setWeighmentId(Integer.parseInt((String)json.get("weighmentId")));
		       	grade.setMaterial(((String)json.get("material")).toUpperCase());
		       	grade.setRst(Integer.parseInt((String)json.get("rst")));
		       	grade.setAuthorizedBy(((String)json.get("authorizer")).toUpperCase());
		       	grade.setBonusPerQtl(Float.parseFloat((String)json.get("bonusPerQtl")));
		       	pdcRate = Float.parseFloat((String)json.get("pdcRate"));
		       	pdcMonths = Integer.parseInt((String)json.get("pdcMonths"));
		       	
		       	JSONObject gradeJson = (JSONObject)jsonArray.get(i);
		       	
		       	grade.setQuantity(Float.parseFloat((String)gradeJson.get("quantity")));
		       	grade.setGrade(((String)gradeJson.get("grade")).toUpperCase());
		       	grade.setMoisture(Float.parseFloat((String)gradeJson.get("moisture")));
		       	grade.setRate(Float.parseFloat((String)gradeJson.get("rate")));
		       	if(((String)gradeJson.get("pdcCheck")).equalsIgnoreCase("true")){
		       		pdcAmount = (pdcRate*pdcMonths);
		       		grade.setPdcBonusAmount(pdcAmount);
		       		grade.setPdcDate((String)json.get("pdcDate"));
		       	}else if(((String)gradeJson.get("pdcCheck")).equalsIgnoreCase("false")){
		       		grade.setPdcBonusAmount(0);
		       		grade.setPdcDate(null);
		       	}
		       	
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
		   	
		   	session.setAttribute("gradeSubmitFlag", contains);
		   	response.sendRedirect("../admin/Grading.jsp");
    	}
    	
    %>