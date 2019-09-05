<%@page import="com.prov.report.RstReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page contentType="application/pdf"%>
<%@ page trimDirectiveWhitespaces="true" %>
 <% 
    
  	int weighmentId = Integer.parseInt((String)session.getAttribute("weighmentId"));
    
 	//session.removeAttribute("weighmentId");
    
    RstReport report = new RstReport();
    
    JSONObject jsonObj = report.getRSTForPrint(weighmentId);
    
	JasperReports printReport = new JasperReports();

	//Loading Jasper file report from local file system.
	String jrxmlFile = session.getServletContext().getRealPath("/report/RST.jrxml");
		
	JasperPrint jasperPrint = printReport.compileAndPrint(jrxmlFile, jsonObj);
	
	//Exporting Report as PDF
	JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		
	response.getOutputStream().flush();
	response.getOutputStream().close();
	
	return;
		
    %>