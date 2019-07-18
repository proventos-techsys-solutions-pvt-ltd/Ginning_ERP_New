package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.Amanat;
import com.prov.db.OracleConnection;

public class AmanatReport {

public Amanat getAmanatData(int amanatId) {
		
		ResultSet rs = null;
		Connection con = null;
		Amanat a = new Amanat();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM AMANAT_MAST WHERE ID=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, amanatId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				a.setId(rs.getInt(1));
				a.setGradeId(rs.getInt(2));
				a.setCustomerId(rs.getInt(3));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(4)));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				a.setAmanatDate(properDate);
				a.setFinalRate(rs.getDouble(5));
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
		
	}
	
public JSONArray getPendingAmanatData() {
	
	ResultSet rs = null;
	Connection con = null;
	JSONArray jsonArray = new JSONArray();
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT AM.ID, AM.AMANAT_DATE, AM.FINAL_RATE, AM.CUSTOMER_ID, AM.GRADE_ID, GD.QUANTITY, GD.GRADE, GD.RATE, GD.RST, CM.NAME, CM.ADDRESS, CM.MOBILE \r\n" + 
						"FROM AMANAT_MAST AM, GRADE_DETAILS GD, CUSTOMER_MAST CM\r\n" + 
						"WHERE AM.CUSTOMER_ID = CM.ID\r\n" + 
						"AND AM.GRADE_ID = GD.ID\r\n" + 
						"AND AM.FINAL_RATE=0";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("amanatId", rs.getInt(1));
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(2)));
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
			String properDate = format2.format(date1);
			obj.put("amanatDate", properDate);
			obj.put("finalRate", rs.getDouble(3));
			obj.put("customerId", rs.getInt(4));
			obj.put("gradeId", rs.getInt(5));
			obj.put("quantity", rs.getDouble(6));
			obj.put("grade", rs.getString(7));
			obj.put("contractRate", rs.getDouble(8));
			obj.put("rst", rs.getInt(9));
			obj.put("customerName", rs.getString(10));
			obj.put("customerAddress", rs.getString(11));
			obj.put("customerMobile", rs.getString(12));
			
			jsonArray.put(obj);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return jsonArray;
	}

public JSONArray getAmanatDataInvoicing(int rst) {
	
	ResultSet rs = null;
	Connection con = null;
	JSONArray jsonArray = new JSONArray();
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT GD.WEIGHMENT_ID, GD.MATERIAL, GD.QUANTITY, GD.GRADE, GD.RATE CONTRACT_RATE, GD.AUTHORIZED_BY, GD.MOISTURE, AM.ID AMANAT_ID, AM.GRADE_ID, AM.AMANAT_DATE, AM.CUSTOMER_ID, AM.FINAL_RATE, CM.NAME, CM.ADDRESS, CM.MOBILE, CM.BLACKLISTED, CM.MEMBERSHIP\r\n" + 
				"FROM GRADE_DETAILS GD, AMANAT_MAST AM, CUSTOMER_MAST CM\r\n" + 
				"WHERE\r\n" + 
				"GD.ID = AM.GRADE_ID AND\r\n" + 
				"AM.CUSTOMER_ID = CM.ID AND\r\n" + 
				"GD.RST="+rst;
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("weighmentId", rs.getInt(1));
			obj.put("material", rs.getString(2));
			obj.put("quantity", rs.getDouble(3));
			obj.put("grade", rs.getString(4));
			obj.put("rate", rs.getDouble(5));
			obj.put("authorizer", rs.getString(6));
			obj.put("moisture", rs.getFloat(7));
			obj.put("amanatId", rs.getInt(8));
			obj.put("gradeId", rs.getString(9));
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(10));
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
			String properDate = format2.format(date1);
			
			obj.put("amanatDate", properDate);
			obj.put("customerId", rs.getInt(11));
			obj.put("finalRate", rs.getDouble(12));
			obj.put("customerName", rs.getString(13));
			obj.put("customerAddress", rs.getString(14));
			obj.put("customerMobile", rs.getString(15));
			obj.put("customerBlacklisted", rs.getInt(16));
			obj.put("customerMembership", rs.getInt(17));
			obj.put("rst", rst);
			
			jsonArray.put(obj);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return jsonArray;
	}

}
