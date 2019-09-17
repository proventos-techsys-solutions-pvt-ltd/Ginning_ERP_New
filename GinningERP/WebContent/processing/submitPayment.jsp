<%-- page errorPage="../admin/Error.jsp" --%>  
<%@page import="com.prov.bean.PDC"%>
<%@page import="com.prov.dbupdation.UpdatePDC"%>
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
	
	String data = request.getParameter("data");
    System.out.print(data);
	
	JSONParser parse = new JSONParser();
	
	JSONObject obj = (JSONObject)parse.parse(data);
	UpdatePDC updatePdc = new UpdatePDC();
	
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
		
		session.setAttribute("chequeId", Integer.toString(id));
		response.sendRedirect("../report/Cheque.jsp");
		
		//out.print(id);
		//out.flush();
		
		
	}else if(((String)obj.get("dataType")).equals("rtgs")){

		Rtgs rtgs = new Rtgs();
	
		rtgs.setBankName(((String)obj.get("rtgsBank")).toUpperCase());
		rtgs.setRtgsAmount(Double.parseDouble((String)obj.get("rtgsAmount")));
		rtgs.setAccountNo((String)obj.get("rtgsAccountNo"));
		rtgs.setRtgsDate((String)obj.get("rtgsDate"));
		rtgs.setIfsc(((String)obj.get("rtgsIfsc")).toUpperCase());
		rtgs.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		rtgs.setCustomerName(((String)obj.get("customerName")).toUpperCase());
		rtgs.setInvoiceNo(((String)obj.get("invoiceNo")).toUpperCase());
		rtgs.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddRtgs addRtgs = new AddRtgs();
		
		id = addRtgs.addRtgsEntry(rtgs);

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
		
		//session.setAttribute("id", Integer.toString(id));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		out.print(id);
		out.flush();
		
			
	}else if(((String)obj.get("dataType")).equals("cash")){

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		updateInvoice.updatePendingAmount(Double.parseDouble((String)obj.get("cashAmount")),invoiceId);
		
		//session.setAttribute("id", Integer.toString(invoiceId));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		out.print(invoiceId);
		out.flush();
		
	}else if(((String)obj.get("dataType")).equals("pdc")){
		
		PDC pdc = new PDC();
		Cheque cheque = new Cheque();
		AddCheque addCheque = new AddCheque();
		
		pdc.setId(Integer.parseInt((String)obj.get("pdcId")));
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		cheque.setBankId(Integer.parseInt((String)obj.get("pdcBank")));
		cheque.setBankName((String)obj.get("invoiceId"));
		cheque.setChequeAmount(Double.parseDouble((String)obj.get("pdcAmount")));
		cheque.setChequeDate((String)obj.get("pdcDate"));
		cheque.setChequeNo((String)obj.get("pdcNo"));
		cheque.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		cheque.setCustomerName((String)obj.get("pdcPayeeName"));
		cheque.setInvoiceId(invoiceId);
		cheque.setInvoiceNo((String)obj.get("invoiceNo"));
		
		int chequeId = addCheque.addCheque(cheque);
		
		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(cheque.getChequeAmount(), invoiceId);
		
		updatePdc.addChequeId(chequeId, invoiceId);
		
		session.setAttribute("chequeId", Integer.toString(pdc.getId()));
		response.sendRedirect("../report/Cheque.jsp");
		//out.print(chequeId);
		//out.flush();
		
	}else if(((String)obj.get("dataType")).equals("pdcRtgs")){

		Rtgs rtgs = new Rtgs();
	
		rtgs.setBankName(((String)obj.get("pdcRtgsBank")).toUpperCase());
		rtgs.setRtgsAmount(Double.parseDouble((String)obj.get("pdcRtgsAmount")));
		rtgs.setAccountNo((String)obj.get("pdcRtgsAccountNo"));
		rtgs.setRtgsDate((String)obj.get("pdcRtgsDate"));
		rtgs.setIfsc(((String)obj.get("pdcRtgsIfsc")).toUpperCase());
		rtgs.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		rtgs.setCustomerName(((String)obj.get("customerName")).toUpperCase());
		rtgs.setInvoiceNo(((String)obj.get("invoiceNo")).toUpperCase());
		rtgs.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddRtgs addRtgs = new AddRtgs();
		
		id = addRtgs.addRtgsEntry(rtgs);

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
		
		updatePdc.addRtgsIdId(id, rtgs.getInvoiceId());
		
		//session.setAttribute("id", Integer.toString(id));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		
		out.print(id);
		out.flush();
			
	}else if(((String)obj.get("dataType")).equals("pdcCash")){

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		updateInvoice.updatePendingAmount(Double.parseDouble((String)obj.get("pdcCashAmount")),invoiceId);
		int glId = 0;
		
		updatePdc.addGlId(glId, invoiceId);
		
		//session.setAttribute("id", Integer.toString(invoiceId));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		
		out.print(glId);
		out.flush();
		
	}
	
%>