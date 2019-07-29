<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="net.sf.jasperreports.engine.JasperPrintManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    
  	int invoiceId = Integer.parseInt((String)request.getAttribute("invoiceId"));
    
    InvoiceReport invReport = new InvoiceReport();
	
	org.json.JSONObject printObj = invReport.getInvoiceForPrinting(invoiceId);

	JasperReports printReport = new JasperReports();
	
	

	String filePath = getServletContext().getRealPath("\\WebContent\\report\\FinalInvoicePDF.jrxml");
	System.out.println("ReportJson ----------- "+ filePath);
	
	JasperPrint print =  printReport.compileAndPrint("E:\\FinalInvoicePDF.jrxml", printObj,"E:\\sample.pdf");
	
	//Exporting Report as PDF
	JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
	
	response.getOutputStream().flush();
	response.getOutputStream().close();
	return;
    	
    %>
    
    
    