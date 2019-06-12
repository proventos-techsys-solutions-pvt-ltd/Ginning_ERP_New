package com.prov.bean;

public class CreditVoucher {
	
	private int id, companyId, accountNameId;
	private String financialYear, voucherDate, voucherNo, voucherRef, description, preparedBy, authorizedBy;
	double creditAmount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getVoucherDate() {
		return voucherDate;
	}
	public void setVoucherDate(String voucherDate) {
		this.voucherDate = voucherDate;
	}
	public String getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getVoucherRef() {
		return voucherRef;
	}
	public void setVoucherRef(String voucherRef) {
		this.voucherRef = voucherRef;
	}
	public String getDescription() {
		return description;
	}
	public int getAccountNameId() {
		return accountNameId;
	}
	public void setAccountNameId(int accountNameId) {
		this.accountNameId = accountNameId;
	}
	public double getCreditAmount() {
		return creditAmount;
	}
	public void setCreditAmount(double creditAmount) {
		this.creditAmount = creditAmount;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPreparedBy() {
		return preparedBy;
	}
	public void setPreparedBy(String preparedBy) {
		this.preparedBy = preparedBy;
	}
	public String getAuthorizedBy() {
		return authorizedBy;
	}
	public void setAuthorizedBy(String authorizedBy) {
		this.authorizedBy = authorizedBy;
	}

}
