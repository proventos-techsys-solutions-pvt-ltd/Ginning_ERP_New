<%@page import="com.prov.bean.Bank"%>
<%@page import="com.prov.report.BankReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.AccountCategoryReport"%>
<%@page import="com.prov.report.AccountReport"%>
<%@page import="com.prov.bean.AccountCategory"%>
<%@page import="com.prov.bean.AccountName"%>
<%@page import="com.prov.report.CompanyReport"%>
<%@page import="com.prov.bean.Company"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.CreditVoucher"%>
<%@page import="com.prov.bean.DebitVoucher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.CreditReport"%>
<%@page import="com.prov.report.DebitReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	int companyId = Integer.parseInt(request.getParameter("companyId"));
	
	DebitReport debitReportObj = new DebitReport();
	CreditReport creditReportObj = new CreditReport();
	CompanyReport cr = new CompanyReport();
	AccountReport ar = new AccountReport();
	AccountCategoryReport acr = new AccountCategoryReport();
	BankReport bankReport = new BankReport();
	
	ArrayList<DebitVoucher> debitReport = debitReportObj.getReport();
	ArrayList<CreditVoucher> creditReport = creditReportObj.getReport();
	
	JSONArray jsonArray = new JSONArray();
	
	for(int i=0;i<debitReport.size();i++){
		
		if(companyId != debitReport.get(i).getCompanyId()){
			debitReport.remove(i);
			continue;
		}
		Company c = cr.getCompanyData(debitReport.get(i).getCompanyId());
		AccountName accountDebit = ar.getReport(debitReport.get(i).getAccountNameId());
		AccountCategory accountCategory = acr.getReport(accountDebit.getAccountCategoryId());
		
		for(int j=0;j<creditReport.size();j++){
			if(companyId != creditReport.get(i).getCompanyId()){
				creditReport.remove(i);
				continue;
			}
			if(debitReport.get(i).getVoucherNo().equals(creditReport.get(j).getVoucherNo())){
				Bank bank = bankReport.getReport(creditReport.get(j).getAccountNameId());
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("voucherNo", debitReport.get(i).getVoucherNo());
				jsonObj.put("voucherDate",debitReport.get(i).getVoucherDate());
				jsonObj.put("accountCategory", accountCategory.getAccountCategory());
				jsonObj.put("expenseReference", debitReport.get(i).getVoucherRef());
				jsonObj.put("description", debitReport.get(i).getDescription());
				jsonObj.put("amount", debitReport.get(i).getDebitAmount());
				jsonObj.put("modeOfPayment", bank.getBankName());				
				
				jsonArray.put(jsonObj);
				
				
			}
		}
	}
	
	out.print(jsonArray);
%>	
	