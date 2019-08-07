<%@ page contentType="application/pdf"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page trimDirectiveWhitespaces="true" %>


    <% 
    
  	int invoiceId = Integer.parseInt((String)request.getAttribute("invoiceId"));
    request.removeAttribute("invoiceId");
    
    InvoiceReport invReport = new InvoiceReport();
	
	org.json.JSONObject printObj = invReport.getInvoiceForPrinting(invoiceId);

	JasperReports printReport = new JasperReports();

	//Loading Jasper file report from local file system.
	String jrxmlFile = session.getServletContext().getRealPath("/report/FinalInvoicePDF.jrxml");
		
	JasperPrint jasperPrint = printReport.compileAndPrint(jrxmlFile, printObj);
	
	//Exporting Report as PDF
	JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		
	response.getOutputStream().flush();
	response.getOutputStream().close();
	
	return;
		
    %>
    
    
    