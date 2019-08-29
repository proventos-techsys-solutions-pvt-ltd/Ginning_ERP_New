package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.PDC;
import com.prov.db.OracleConnection;

public class UpdatePDC {
	
	public int updatePDC(PDC p)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCheque = "{ ? = call UPDATE_PDC(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCheque);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(p.getChequeDate());
			
			cs.setInt(2, p.getId());
			cs.setInt(3, p.getCustomerId());
			cs.setInt(4, p.getInvoiceId());
			cs.setInt(5, p.getBankId());
			cs.setString(6, p.getPayeeName());
			cs.setDate(7, date);
			cs.setDouble(8, p.getChequeAmount());
			cs.setString(9, p.getChequeNo());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			p.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

	public int updatePDCData(PDC p)
	{
		
		Connection con = null;
		int rows = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCheque = "{ ? = call UPDATE_PDC(UPDATE PDC_MAST SET\r\n" + 
								"BANK_ID = ?,\r\n" + 
								"PAYEE_NAME = ?,\r\n" + 
								"CHEQUE_NO = ?\r\n" + 
								"WHERE ID = ?;) }";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(updateCheque);
			
			
			
			stmt.setInt(1, p.getBankId());
			stmt.setString(2, p.getPayeeName());
			stmt.setString(3, p.getChequeNo());
			stmt.setInt(4, p.getId());
			
			rows = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful-"+rows);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rows;
		
	}
	
	public int addChequeNoAndPayee(PDC p)
	{
		
		Connection con = null;
		int rows = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCheque = "UPDATE PDC_MAST \r\n" + 
								"SET \r\n" + 
								"PDC_MAST.CHEQUE_NO = ?,\r\n" + 
								"PDC_MAST.PAYEE_NAME = ?\r\n" + 
								"WHERE PDC_MAST.ID = ?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(updateCheque);
			
			
			
			stmt.setString(1, p.getChequeNo());
			stmt.setString(2, p.getPayeeName());
			stmt.setInt(3, p.getId());
			
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
