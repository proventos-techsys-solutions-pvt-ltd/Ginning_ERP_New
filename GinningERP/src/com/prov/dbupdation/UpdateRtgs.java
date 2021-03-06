package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Rtgs;
import com.prov.db.OracleConnection;

public class UpdateRtgs {
	
	public int updateRtgs(Rtgs r)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateRtgs = "{ ? = call UPDATE_RTGS(?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateRtgs);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(r.getRtgsDate());
			
			cs.setInt(2, r.getId());
			cs.setInt(3, r.getCustomerId());
			cs.setInt(4, r.getInvoiceId());
			cs.setString(5, r.getAccountNo());
			cs.setString(6, r.getBankName());
			cs.setString(7, r.getIfsc());
			cs.setLong(8, r.getRtgsAmount());
			cs.setDate(9, date);
			cs.setString(10, r.getCustomerName());
			cs.setString(11, r.getInvoiceNo());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			r.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public int addVoucherRtgs(int voucherNo, int rtgsId)
	{
		
		Connection con = null;
		int rows = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateRtgs = "UPDATE RTGS_MASTER\r\n" + 
							"SET\r\n" + 
							"    VOUCHER_NO = ?\r\n" + 
							"WHERE\r\n" + 
							"    ID = ?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateRtgs);
			stmt.setInt(1, voucherNo);
			stmt.setInt(2, rtgsId);
			rows = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful-"+rows);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rows;
		
	}

}
