<%@page import="com.prov.dbupdation.UpdateInvoice"%>
<%@page import="com.prov.dbinsertion.AddRtgs"%>
<%@page import="com.prov.dbinsertion.AddCheque"%>
<%@page import="com.prov.bean.Rtgs"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.bean.Cheque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	
	String chequeAmt = request.getParameter("output");
	
	JSONParser parse = new JSONParser();
	
	JSONObject obj = (JSONObject)parse.parse(chequeAmt);
	
	int id = 0;
	
	if(((String)obj.get("dataType")).equals("cheque")){

		Cheque cheque = new Cheque();
	
		cheque.setBankId(Integer.parseInt((String)obj.get("chequeBankId")));
		cheque.setBankName(((String)obj.get("chequeBankName")).toUpperCase());
		cheque.setChequeAmount(Double.parseDouble((String)obj.get("chequeAmount")));
		cheque.setChequeDate((String)obj.get("chequeDate"));
		cheque.setChequeNo((String)obj.get("chequeNo"));
		cheque.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		cheque.setCustomerName(((String)obj.get("chequeName")).toUpperCase());
		cheque.setInvoiceNo(((String)obj.get("invoiceNo")).toUpperCase());
		cheque.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddCheque addCheque = new AddCheque();
		
		id = addCheque.addCheque(cheque);
		
		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(cheque.getChequeAmount(), cheque.getInvoiceId());
		
		request.setAttribute("id", Integer.toString(id));
		request.getRequestDispatcher("../report/Cheque.jsp").forward(request, response);
		
		
		
	}else if(((String)obj.get("dataType")).equals("rtgs")){

		Rtgs rtgs = new Rtgs();
	
		rtgs.setBankName(((String)obj.get("rtgsBank")).toUpperCase());
		rtgs.setRtgsAmount(Double.parseDouble((String)obj.get("rtgsAmount")));
		rtgs.setAccountNo((String)obj.get("rtgsAccountNo"));
		rtgs.setRtgsDate((String)obj.get("rtgsDate"));
		rtgs.setIfsc(((String)obj.get("rtgsIfsc")).toUpperCase());
		rtgs.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		rtgs.setCustomerName(((String)obj.get("customerName")).toUpperCase());
		rtgs.setInvoiceNo((String)obj.get("invoiceNo"));
		rtgs.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddRtgs addRtgs = new AddRtgs();
		
		id = addRtgs.addCheque(rtgs);

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
		
		request.setAttribute("id", Integer.toString(id));
		request.getRequestDispatcher("../report/RTGSVoucher.jsp").forward(request, response);
			
	}else if(((String)obj.get("dataType")).equals("cash")){

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		updateInvoice.updatePendingAmount(Double.parseDouble((String)obj.get("cashAmount")),invoiceId);
		
		request.setAttribute("id", Integer.toString(invoiceId));
		request.getRequestDispatcher("../report/CashVoucher.jsp").forward(request, response);
	}
	
%>