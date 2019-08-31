<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.bean.PDC"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.PDCReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
	    int pdcId = Integer.parseInt((String)session.getAttribute("pdcId"));
	 	session.removeAttribute("pdcId");
		
		PDCReport pr = new PDCReport();
		
		JSONObject printJson = pr.getPDCForPrinting(pdcId);
		
		JasperReports printReport = new JasperReports();
		
		//Loading Jasper file report from local file system.
		String jrxmlFile = session.getServletContext().getRealPath("/report/PDC.jrxml");
			
		JasperPrint jasperPrint = printReport.compileAndPrint(jrxmlFile, printJson);
		
		//Exporting Report as PDF
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
			
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		return;
    
    %>