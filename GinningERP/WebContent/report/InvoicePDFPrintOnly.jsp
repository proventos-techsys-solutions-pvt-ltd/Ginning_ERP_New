<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.misc.MergeJSON"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="org.json.JSONArray"%>
<%@ page contentType="application/pdf"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page trimDirectiveWhitespaces="true" %>


    <% 
    
  	int invoiceId = Integer.parseInt((String)request.getParameter("invoiceId"));
    
    InvoiceReport invReport = new InvoiceReport();
	
	org.json.JSONObject printObj = invReport.getInvoiceForPrinting(invoiceId);
	
	if(printObj.has("chequeId")){
		ChequeReport chqRep = new ChequeReport();
		Cheque chqJson =chqRep.getChequeReport(Integer.parseInt(printObj.getString("chequeId")));
		printObj.put("chequeNo", chqJson.getChequeNo());
		Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(chqJson.getChequeDate());
		SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy");
		String properDate = format2.format(date1);
		
		
		printObj.put("chequeDate", properDate);
	}else{
		printObj.put("chequeNo", "");
		printObj.put("chequeDate", "");
	}
	if(printObj.has("pdcId")){
		ChequeReport chqRep = new ChequeReport();
		Cheque chqJson =chqRep.getChequeReport(Integer.parseInt(printObj.getString("pdcId")));
		printObj.put("pdcNo", chqJson.getChequeNo());
	}else{
		printObj.put("pdcNo", "");
	}
	
	JSONArray invoiceItems = printObj.getJSONArray("invoiceItems");
	

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
    
    
    