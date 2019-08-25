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
		
		String addPDC = "{ ? = call ADD_PDC(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addPDC);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(p.getChequeDate());
			
			cs.setInt(2, p.getCustomerId());
			cs.setInt(3, p.getInvoiceId());
			cs.setInt(4, p.getBankId());
			cs.setDate(5, date);
			cs.setDouble(6, p.getChequeAmount());
			cs.setString(7, p.getChequeNo());
			cs.setString(8, p.getPayeeName());
			
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
	

	public int addPDCWhileGrading(PDC p)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String addPDC = "{ ? = call ADD_PDC(?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addPDC);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(p.getChequeDate());
			
			cs.setInt(2, p.getCustomerId());
			cs.setDate(3, date);
			cs.setDouble(4, p.getChequeAmount());
			
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
