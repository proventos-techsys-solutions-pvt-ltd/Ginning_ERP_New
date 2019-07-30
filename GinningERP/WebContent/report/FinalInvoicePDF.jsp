<%@ page contentType="application/pdf"%>
<%@page import="net.sf.jasperreports.engine.data.JsonDataSource"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="net.sf.jasperreports.engine.JasperPrintManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.report.InvoiceReport"%>

    <%
    	int invoiceId = Integer.parseInt((String) request.getAttribute("invoiceId"));

    	InvoiceReport invReport = new InvoiceReport();

    	org.json.JSONObject printObj = invReport.getInvoiceForPrinting(invoiceId);

    	JasperReports printReport = new JasperReports();

    	//Loading Jasper file report from local file system.
    	String jrxmlFile = session.getServletContext().getRealPath("/report/FinalInvoicePDF.jrxml");

    	InputStream input = new FileInputStream(new File(jrxmlFile));

    	//Generating the report.
    	JasperReport jasperReport = JasperCompileManager.compileReport(input);

    	ByteArrayInputStream jsonDataStream = new ByteArrayInputStream(printObj.toString().getBytes());

    	//Create json datasource from json stream
    	JsonDataSource ds = new JsonDataSource(jsonDataStream);

    	JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, ds);

    	//Exporting Report as PDF
    	JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

    	response.getOutputStream().flush();
    	response.getOutputStream().close();
    %>
    
    
    