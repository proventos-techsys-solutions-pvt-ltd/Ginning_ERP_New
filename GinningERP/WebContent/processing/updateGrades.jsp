<%@page import="com.prov.delete.DeleteGradeDetails"%>
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

	JSONArray jsonArray = (JSONArray)json.get("gradeList");
	
	System.out.println(jsonArray);
	
	ArrayList<GradeDetails> gradeList = new ArrayList<GradeDetails>();
	
	CheckAlreadyGraded checkGradeExists = new CheckAlreadyGraded();
	
	int rowCount = checkGradeExists.alreadyGraded(Integer.parseInt((String)json.get("rst")));
	
	if(rowCount !=0 ){
		DeleteGradeDetails delete = new DeleteGradeDetails();
		delete.deleteGradeDetails(Integer.parseInt((String)json.get("weighmentId")));
	}
	
	rowCount = checkGradeExists.alreadyGraded(Integer.parseInt((String)json.get("rst")));
	float pdcRate = 0;
   	int pdcMonths = 0;
   	double pdcAmount = 0;
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
	       		pdcAmount = ((grade.getQuantity()/100)*(pdcRate*pdcMonths))+((grade.getQuantity()/100)*grade.getRate());
	       		grade.setPdcAmount(pdcAmount);
	       		grade.setPdcDate((String)json.get("pdcDate"));
	       		System.out.println((String)json.get("pdcDate"));
	       	}else if(((String)gradeJson.get("pdcCheck")).equalsIgnoreCase("false")){
	       		grade.setPdcAmount(0);
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