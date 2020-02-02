<%@page import="com.prov.report.AmanatReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int invoiceId = Integer.parseInt((String)request.getParameter("invoiceId"));

InvoiceReport invReport = new InvoiceReport();

org.json.JSONObject printObj = invReport.getInvoiceForPrinting(invoiceId);

JSONArray invItems = printObj.getJSONArray("invoiceItems");
/*
for(int i=0; i<invItems.length(); i++){
	int gradeId = invItems.getJSONObject(i).getInt("gradeId");
	AmanatReport amanatReport = new AmanatReport();
	JSONObject obj = amanatReport.getAmanatDataForInvoiceReceipt(gradeId);
	if(obj.length() > 0){
		invItems.getJSONObject(i).put("invoicedQtyAm", obj.getDouble("invoicedQty"));
		invItems.getJSONObject(i).put("finalRate", obj.getDouble("finalRate"));
		double amount = (obj.getDouble("invoicedQtyAm")/100) * (obj.getDouble("finalRate"));
		invItems.getJSONObject(i).put("amount", amount);
		invItems.getJSONObject(i).put("amanat", "yes");
	}else{
		invItems.getJSONObject(i).put("amanat", "no");
	}
}
*/
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

out.print(printObj);
out.flush();

%>