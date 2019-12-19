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

		String addInvoice = "{ ? = call ADD_INVOICE(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date date=Date.valueOf(i.getInvDate());			
			cs = con.prepareCall(addInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, i.getInvoiceNo());
			cs.setLong(3, i.getTotal());
			cs.setLong(4, i.getAmountPaid());
			cs.setLong(5, i.getPending());
			cs.setDate(6, date);
			cs.setInt(7, i.getCompanyId());
			cs.setInt(8, i.getCustomerId());
			cs.setString(9, i.getAuthorizer());
			cs.setString(10, i.getNote());
			cs.setLong(11, i.getTotalQuanity());
			cs.setLong(12, i.getCashAmount());
			cs.setLong(13, i.getChequeAmount());
			cs.setLong(14, i.getRtgsAmount());
			cs.setInt(15, i.getPaidByoperator());
			cs.setFloat(16, i.getUnloadingCharges());
			cs.setFloat(17, i.getBonusAmount());
			cs.setLong(18, i.getNetPayable());
			cs.setLong(19, i.getPdcAmount());
			cs.setInt(20, i.getVoucherNo());
			cs.setLong(21, i.getAdvance());
			if(i.getCashDate() != null) {
				Date cashDate = Date.valueOf(i.getCashDate());
				cs.setDate(22, cashDate);
			}else {
				cs.setNull(22, Types.DATE);
			}
			if(i.getChequeDate() != null) {
				Date chequeDate = Date.valueOf(i.getChequeDate());
				cs.setDate(23, chequeDate);
			}else {
				cs.setNull(23, Types.DATE);
			}
			if(i.getRtgsDate() != null) {
				Date rtgsDate = Date.valueOf(i.getRtgsDate());
				cs.setDate(24, rtgsDate);
			}else {
				cs.setNull(24, Types.DATE);
			}
			
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

	String addInvoice = "{ ? = call ADD_INVOICE_WITH_ID(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
	CallableStatement cs;
	try {
		
		Date date=Date.valueOf(i.getInvDate());			
		cs = con.prepareCall(addInvoice);
		
		cs.registerOutParameter(1, Types.NUMERIC);
		
		cs.setString(2, i.getInvoiceNo());
		cs.setLong(3, i.getTotal());
		cs.setLong(4, i.getAmountPaid());
		cs.setLong(5, i.getPending());
		cs.setDate(6, date);
		cs.setInt(7, i.getCompanyId());
		cs.setInt(8, i.getCustomerId());
		cs.setString(9, i.getAuthorizer());
		cs.setString(10, i.getNote());
		cs.setLong(11, i.getTotalQuanity());
		cs.setLong(12, i.getCashAmount());
		cs.setLong(13, i.getChequeAmount());
		cs.setLong(14, i.getRtgsAmount());
		cs.setInt(15, i.getPaidByoperator());
		cs.setFloat(16, i.getUnloadingCharges());
		cs.setFloat(17, i.getBonusAmount());
		cs.setLong(18, i.getNetPayable());
		cs.setLong(19, i.getPdcAmount());
		cs.setInt(20, i.getId());
		cs.setInt(21, i.getVoucherNo());
		cs.setDouble(22, i.getAdvance());
		
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
