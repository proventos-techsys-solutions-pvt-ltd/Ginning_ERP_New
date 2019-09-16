package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.PDC;
import com.prov.db.OracleConnection;

public class AddPDC {
	
	public int addPDC(PDC p)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String addPDC = "{ ? = call ADD_PDC(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addPDC);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date payDate = Date.valueOf(p.getPayDate());
			
			cs.setInt(2, p.getCustomerId());
			cs.setInt(3, p.getInvoiceId());
			cs.setDouble(4, p.getAmount());
			cs.setDate(5, payDate);
			cs.setString(6, p.getModeOfPayment());
			if( p.getChequeId() == 0) {
				cs.setNull(7, Types.NUMERIC);
			}else if( p.getChequeId() > 0) {
				cs.setInt(7, p.getChequeId());
			}
			if(  p.getRtgsId() == 0) {
				cs.setNull(8, Types.NUMERIC);
			}else if(  p.getRtgsId() > 0) {
				cs.setInt(8,  p.getRtgsId());
			}
			if( p.getGlId() == 0) {
				cs.setNull(9, Types.NUMERIC);
			}else if( p.getGlId() > 0) {
				cs.setInt(9, p.getGlId());
			}
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			p.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}
}
