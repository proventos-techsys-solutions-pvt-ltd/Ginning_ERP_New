package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.prov.bean.CreditVoucher;
import com.prov.db.OracleConnection;

public class CreditReport {
	
	public ArrayList<CreditVoucher> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<CreditVoucher> creditEntryList = new ArrayList<CreditVoucher>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM VOUCHER_credit ORDER BY VOUCHER_NO";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				CreditVoucher credit = new CreditVoucher();

				credit.setId(rs.getInt(1));
				credit.setCompanyId(rs.getInt(2));
				credit.setFinancialYear(rs.getString(3));
				String date = rs.getString(4);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				credit.setVoucherDate(properDate);
				credit.setVoucherNo(rs.getString(5));
				credit.setVoucherRef(rs.getString(6));
				credit.setAccountNameId(rs.getInt(7));
				credit.setDescription(rs.getString(8));
				credit.setCreditAmount(rs.getDouble(9));
				credit.setPreparedBy(rs.getString(10));
				credit.setAuthorizedBy(rs.getString(11));
			
				creditEntryList.add(credit);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return creditEntryList;
	}

}
