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
		
		String invSql = "SELECT\r\n" + 
					"    GD.ID,\r\n" + 
					"    GD.WEIGHMENT_ID,\r\n" + 
					"    GD.MATERIAL,\r\n" + 
					"    GD.QUANTITY,\r\n" + 
					"    GD.GRADE,\r\n" + 
					"    GD.RATE,\r\n" + 
					"    GD.AUTHORIZED_BY,\r\n" + 
					"    GD.MOISTURE,\r\n" + 
					"    GD.BONUS_PER_QTL,\r\n" + 
					"    AM.ID            AMANAT_ID,\r\n" + 
					"    AM.AMANAT_DATE,\r\n" + 
					"    AM.CUSTOMER_ID,\r\n" + 
					"    AM.FINAL_RATE,\r\n" + 
					"    AM.DIFF_FROM_SUPER,\r\n" + 
					"    AM.INVOICED_QTY,\r\n" + 
					"    WM.VID,\r\n" + 
					"    WM.RST,\r\n" + 
					"    WM.NET,\r\n" + 
					"    WM.WEIGHMENT_DATE,\r\n" + 
					"    CVM.WEIGH_RATE,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.ADDRESS,\r\n" + 
					"    CM.MOBILE,\r\n" + 
					"    CM.BLACKLISTED,\r\n" + 
					"    CM.MEMBERSHIP,\r\n" + 
					"    GM.DESCRIPTION   GRADE_DESC\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS           GD,\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    CUSTOMER_MAST           CM,\r\n" + 
					"    GRADE_MASTER            GM,\r\n" + 
					"    AMANAT_MAST             AM\r\n" + 
					"WHERE\r\n" + 
					"    GD.GRADE = GM.GRADE\r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID\r\n" + 
					"    AND GD.ID = AM.GRADE_ID\r\n" + 
					"    AND AM.CUSTOMER_ID = CM.ID\r\n" + 
					"    AND WM.VID = CVM.ID\r\n" + 
					"    AND GD.RST = "+rst;
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("gradeId", rs.getString(1));
			obj.put("weighmentId", rs.getString(2));
			obj.put("material", rs.getString(3));
			obj.put("quantity", rs.getString(4));
			obj.put("grade", rs.getString(5));
			obj.put("rate", rs.getString(6));
			obj.put("authorizer", rs.getString(7));
			obj.put("moisture", rs.getString(8));
			obj.put("bonusPerQtl", rs.getString(9));
			obj.put("amanatId", rs.getString(10));
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(11));
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
			String properDate = format2.format(date1);
			
			obj.put("amanatDate",properDate);
			obj.put("customerId", rs.getString(12));
			obj.put("finalRate", rs.getString(13));
			obj.put("differenceFromSuper", rs.getString(14));
			obj.put("invoicedQty", rs.getString(15));
			obj.put("vehicleId", rs.getString(16));
			obj.put("rst", rs.getString(17));
			obj.put("net", rs.getString(18));
			
			Date date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(19));
			String properDate1 = format2.format(date2);
			
			obj.put("weighmentDate", properDate1);
			obj.put("weighRate", rs.getString(20));
			obj.put("customerName", rs.getString(21));
			obj.put("customerAddress", rs.getString(22));
			obj.put("customerMobile", rs.getString(23));
			obj.put("customerBlacklisted", rs.getInt(24));
			obj.put("customerMembership", rs.getInt(25));
			obj.put("gradeDesc", rs.getString(26));
			
			jsonArray.put(obj);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return jsonArray;
	}


public JSONArray getAmanatPendingForInvoicing() {
	
	ResultSet rs = null;
	Connection con = null;
	JSONArray jsonArray = new JSONArray();
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT DISTINCT\r\n" + 
					"    SUM(GD.QUANTITY) - AM.INVOICED_QTY,\r\n" + 
					"    GD.RST,\r\n" + 
					"    CM.NAME\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS           GD,\r\n" + 
					"    CUSTOMER_MAST           CM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    AMANAT_MAST             AM\r\n" + 
					"WHERE\r\n" + 
					"    AM.GRADE_ID = GD.ID\r\n" + 
					"    AND AM.INVOICED_QTY <> GD.QUANTITY\r\n" + 
					"    AND WM.ID = GD.WEIGHMENT_ID\r\n" + 
					"    AND WM.VID = CVM.ID\r\n" + 
					"    AND CVM.CID = CM.ID\r\n" + 
					"    AND WM.NET > 0\r\n" + 
					"GROUP BY\r\n" + 
					"    GD.RST,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    AM.INVOICED_QTY\r\n" + 
					"ORDER BY\r\n" + 
					"    RST";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("quantity", rs.getString(1));
			obj.put("rst", rs.getString(2));
			obj.put("name", rs.getString(3));
			
			
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
