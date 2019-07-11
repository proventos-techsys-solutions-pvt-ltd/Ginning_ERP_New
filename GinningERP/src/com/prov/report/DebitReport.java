package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.prov.bean.DebitVoucher;
import com.prov.db.OracleConnection;

public class DebitReport {
	
	public ArrayList<DebitVoucher> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<DebitVoucher> debitEntryList = new ArrayList<DebitVoucher>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM VOUCHER_DEBIT ORDER BY VOUCHER_NO";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				DebitVoucher debit = new DebitVoucher();

				debit.setId(rs.getInt(1));
				debit.setCompanyId(rs.getInt(2));
				debit.setFinancialYear(rs.getString(3));
				String date = rs.getString(4);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				debit.setVoucherDate(properDate);
				debit.setVoucherNo(rs.getString(5));
				debit.setVoucherRef(rs.getString(6));
				debit.setAccountNameId(rs.getInt(7));
				debit.setDescription(rs.getString(8));
				debit.setDebitAmount(rs.getDouble(9));
				debit.setPreparedBy(rs.getString(10));
				debit.setAuthorizedBy(rs.getString(11));
			
				debitEntryList.add(debit);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return debitEntryList;
	}


}
