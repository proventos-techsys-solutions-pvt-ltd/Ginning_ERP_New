package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;
import com.prov.bean.Invoice;
import com.prov.db.OracleConnection;

public class AddInvoice {
	
public int addInvoice(Invoice i) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addInvoice = "{ ? = call ADD_INVOICE(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date date=Date.valueOf(i.getInvDate());			
			cs = con.prepareCall(addInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, i.getInvoiceNo());
			cs.setDouble(3, i.getTotal());
			cs.setDouble(4, i.getAmountPaid());
			cs.setDouble(5, i.getPending());
			cs.setDate(6, date);
			cs.setInt(7, i.getCompanyId());
			cs.setInt(8, i.getCustomerId());
			cs.setString(9, i.getAuthorizer());
			cs.setString(10, i.getNote());
			cs.setDouble(11, i.getTotalQuanity());
			cs.setDouble(12, i.getCashAmount());
			cs.setDouble(13, i.getChequeAmount());
			cs.setDouble(14, i.getRtgsAmount());
			cs.setInt(15, i.getPaidByoperator());
			cs.setFloat(16, i.getUnloadingCharges());
			cs.setFloat(17, i.getBonusAmount());
			cs.setDouble(18, i.getNetPayable());
			cs.setDouble(19, i.getPdcAmount());
			cs.setInt(20, i.getVoucherNo());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			i.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful - "+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

public int addInvoiceWithId(Invoice i) {
	
	Connection con = null;
	int id = 0;
	try {
		con = OracleConnection.getConnection();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	String addInvoice = "{ ? = call ADD_INVOICE_WITH_ID(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
	CallableStatement cs;
	try {
		
		Date date=Date.valueOf(i.getInvDate());			
		cs = con.prepareCall(addInvoice);
		
		cs.registerOutParameter(1, Types.NUMERIC);
		
		cs.setString(2, i.getInvoiceNo());
		cs.setDouble(3, i.getTotal());
		cs.setDouble(4, i.getAmountPaid());
		cs.setDouble(5, i.getPending());
		cs.setDate(6, date);
		cs.setInt(7, i.getCompanyId());
		cs.setInt(8, i.getCustomerId());
		cs.setString(9, i.getAuthorizer());
		cs.setString(10, i.getNote());
		cs.setDouble(11, i.getTotalQuanity());
		cs.setDouble(12, i.getCashAmount());
		cs.setDouble(13, i.getChequeAmount());
		cs.setDouble(14, i.getRtgsAmount());
		cs.setInt(15, i.getPaidByoperator());
		cs.setFloat(16, i.getUnloadingCharges());
		cs.setFloat(17, i.getBonusAmount());
		cs.setDouble(18, i.getNetPayable());
		cs.setDouble(19, i.getPdcAmount());
		cs.setInt(20, i.getId());
		cs.setInt(21, i.getVoucherNo());
		
		cs.executeUpdate();
		
		id = cs.getInt(1);
		
		i.setId(id);
		
		cs.close();
		con.close();
		
		System.out.println("Insertion Succesful - "+id);
		} catch (Exception e) {
		e.printStackTrace();
	}
	
	return id;
}

}
