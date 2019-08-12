package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.GeneralLedger;
import com.prov.db.OracleConnection;

public class GeneralLedgerReport {

	public JSONArray getReport() {
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArr = new JSONArray();
		GeneralLedger gl = new GeneralLedger();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
					"gl.ID,\r\n" + 
					"gl.VOUCHER_NO,\r\n" + 
					"gl.ACCOUNT_ID,\r\n" + 
					"gl.GROUP_ID,\r\n" + 
					"gl.ACC_LEDGER,\r\n" + 
					"gl.LEDGER_DESC,\r\n" + 
					"gl.LEDGER_DATE,\r\n" + 
					"gl.MONTH_ID,\r\n" + 
					"gl.OPENING_BAL,\r\n" + 
					"gl.DEBIT,\r\n" + 
					"gl.CREDIT,\r\n" + 
					"gl.CLOSING_BAL,\r\n" +
					"gl.COMPANY_ID,\r\n" +
					"ag.group_name\r\n" + 
					"FROM GENERAL_LEDGER gl, account_group ag \r\n" + 
					"where gl.group_id = ag.id";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				gl.setId(rs.getInt(1));
				gl.setVoucherNo(rs.getInt(2));
				gl.setAccountId(rs.getInt(3));
				gl.setGroupId(rs.getInt(4));
				gl.setAccountLedger(rs.getString(5));
				gl.setLedgerDesc(rs.getString(6));
				String date = rs.getString(7);
				
				Date date1 = format1.parse(date);
				String date2 = format2.format(date1);

				gl.setGlDate(date2);
				gl.setMonthId(rs.getInt(8));
				gl.setOpeningBal(rs.getDouble(9));
				gl.setDebit(rs.getDouble(10));
				gl.setCredit(rs.getDouble(11));
				gl.setClosingBal(rs.getDouble(12));
				gl.setCompanyId(rs.getInt(13));
				JSONObject obj = new JSONObject(gl);
				obj.put("groupName", rs.getString(14));
				
				jsonArr.put(obj);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArr;
	}
	
}
