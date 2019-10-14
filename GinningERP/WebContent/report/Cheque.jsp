<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@ page contentType="application/pdf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%
	int chequeId = Integer.parseInt((String)request.getParameter("chequeId"));
 	session.removeAttribute("chequeId");
	
	ChequeReport cr = new ChequeReport();
	
	JSONObject printObj = cr.getChequeForPrinting(chequeId);
	
	JasperReports printReport = new JasperReports();
	
	//Loading Jasper file report from local file system.
	String jrxmlFile = session.getServletContext().getRealPath("/report/Cheque.jrxml");
		
	JasperPrint jasperPrint = printReport.compileAndPrint(jrxmlFile, printObj);
	
	//Exporting Report as PDF
	JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		
	response.getOutputStream().flush();
	response.getOutputStream().close();
	
	return; 
%>