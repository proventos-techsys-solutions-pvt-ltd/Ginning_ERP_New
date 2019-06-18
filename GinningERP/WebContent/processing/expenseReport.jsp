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

	DebitReport debitReportObj = new DebitReport();
	CreditReport creditReportObj = new CreditReport();
	CompanyReport cr = new CompanyReport();
	AccountReport ar = new AccountReport();
	AccountCategoryReport acr = new AccountCategoryReport();
	
	ArrayList<DebitVoucher> debitReport = debitReportObj.getReport();
	ArrayList<CreditVoucher> creditReport = creditReportObj.getReport();
	
	
	
	for(int i=0;i<debitReport.size();i++){
		Company c = cr.getCompanyData(debitReport.get(i).getCompanyId());
		AccountName account = ar.getReport(debitReport.get(i).getAccountNameId());
		AccountCategory accountCategory = acr.getReport(account.getAccountCategoryId());
		
		for(int j=0;j<creditReport.size();j++){
			if(debitReport.get(i).getVoucherNo().equals(creditReport.get(j).getVoucherNo())){
				JSONObject jsonObj = new JSONObject(debitReport.get(i));
				
				
			}
		}
	}
	
%>