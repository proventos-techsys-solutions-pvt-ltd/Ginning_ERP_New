package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.Cheque;
import com.prov.db.OracleConnection;

public class AddCheque {
	
	public int addCheque(Cheque c)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String addAccountName = "{ ? = call ADD_CHEQUE(?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addAccountName);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(c.getChequeDate());
			
			if(c.getCustomerId() == 0) {
				cs.setNull(2, Types.NUMERIC);
			}else {
				cs.setInt(2, c.getCustomerId());
			}
			
			
			if(c.getInvoiceId() == 0) {
				cs.setNull(3, Types.NUMERIC);
			}else {
				cs.setInt(3, c.getInvoiceId());
			}
			cs.setInt(4,c.getBankId());
			cs.setString(5, c.getCustomerName());
			if(c.getInvoiceNo() == "" || c.getInvoiceNo() == null) {
				cs.setNull(6, Types.VARCHAR);
			}else {
				cs.setString(6, c.getInvoiceNo());
			}
			
			cs.setString(7, c.getBankName());
			cs.setString(8, c.getChequeNo());
			cs.setLong(9, c.getChequeAmount());
			cs.setDate(10, date);
			cs.setInt(11, c.getStatus());
			cs.setInt(12, c.getChequePaymentStatus());
			cs.setInt(13, c.getVoucherNo());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			c.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}
