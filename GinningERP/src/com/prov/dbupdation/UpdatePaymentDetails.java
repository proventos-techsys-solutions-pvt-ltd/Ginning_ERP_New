package com.prov.dbupdation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;

import com.prov.bean.PaymentDetails;
import com.prov.db.OracleConnection;

public class UpdatePaymentDetails {
	
	
public int updatePaymentStatus(PaymentDetails pd) {
		
		int row=0;
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String updateWeighMast = "UPDATE PAYMENT_DETAILS\r\n" + 
									"SET\r\n" + 
									"    PAY_STATUS = 1,\r\n" + 
									"    CASH_VOUCH_NO = ?,\r\n" + 
									"    CHEQUE_ID = ?,\r\n" + 
									"    RTGS_ID = ?\r\n" + 
									"WHERE\r\n" + 
									"    INVOICE_ID = ?\r\n" + 
									"    AND MODE_ID = ?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateWeighMast);
			
			stmt.setInt(1, pd.getInvoiceId());
			stmt.setInt(2, pd.getModeId());
			if(pd.getCashVouhNo() == 0) {
				stmt.setNull(3, Types.NUMERIC);
			}else {
				stmt.setInt(3, pd.getCashVouhNo());
			}
			if(pd.getChequeId() == 0) {
				stmt.setNull(4, Types.NUMERIC);			
			}else {
				stmt.setInt(4, pd.getChequeId());
			}
			if(pd.getRtgsId() == 0) {
				stmt.setNull (5, Types.NUMERIC);
			}else {
				stmt.setInt(5, pd.getRtgsId());
			}
			

			row = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful--"+row);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	
	
	/*
	 * public int updatePaymentDetails(PaymentDetails pd) {
	 * 
	 * Connection con = null; int id = 0; try { con =
	 * OracleConnection.getConnection(); } catch (ClassNotFoundException e) {
	 * e.printStackTrace(); }
	 * 
	 * String updatePaymentDetails =
	 * "{ ? = call UPDATE_PAYMENTDETAILS(?,?,?,?,?,?,?) }"; CallableStatement cs;
	 * try { cs = con.prepareCall(updatePaymentDetails);
	 * 
	 * cs.registerOutParameter(1, Types.NUMERIC);
	 * 
	 * cs.setInt(2, pd.getId() ); cs.setInt(2, pd.getInvoiceId() ); cs.setString(3,
	 * pd.getPaymentMode() ); cs.setString(4, pd.getAccountName()); cs.setDouble(5,
	 * pd.getAmount()); cs.setInt(6, pd.getRtgsNo()); cs.setInt(7,
	 * pd.getChequeNo());
	 * 
	 * cs.executeUpdate();
	 * 
	 * id = cs.getInt(1);
	 * 
	 * pd.setId(id);
	 * 
	 * cs.close(); con.close();
	 * 
	 * System.out.println("Updation Succesful-"+id); } catch (SQLException e) {
	 * e.printStackTrace(); }
	 * 
	 * return id;
	 * 
	 * }
	 */
	
}
