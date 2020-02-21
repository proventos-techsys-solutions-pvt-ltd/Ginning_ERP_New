package com.prov.bean;

public class RecoDetails {

	long id, recoId, voucherNo, transactionId;
	
	String recoDate;

	public long getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getRecoId() {
		return recoId;
	}

	public void setRecoId(long recoId) {
		this.recoId = recoId;
	}

	public long getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(long voucherNo) {
		this.voucherNo = voucherNo;
	}

	public String getRecoDate() {
		return recoDate;
	}

	public void setRecoDate(String recoDate) {
		this.recoDate = recoDate;
	}

}
