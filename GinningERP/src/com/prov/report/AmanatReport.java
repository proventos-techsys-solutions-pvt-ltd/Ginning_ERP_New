package com.prov.report;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
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


public JSONArray getAmanatReport() {
	
	ResultSet rs = null;
	Connection con = null;
	JSONArray jsonArray = new JSONArray();
	
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT DISTINCT\r\n" + 
				"    SUM(GD.QUANTITY) - AM.INVOICED_QTY,\r\n" + 
				"    GD.RST,\r\n" + 
				"    CM.NAME,\r\n" + 
				"    AM.DIFF_FROM_SUPER,\r\n" + 
				"    AM.AMANAT_DATE,\r\n" + 
				"    AM.AMANAT_NO,\r\n" + 
				"    AM.ID\r\n" + 
				"FROM\r\n" + 
				"    GRADE_DETAILS           GD,\r\n" + 
				"    CUSTOMER_MAST           CM,\r\n" + 
				"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
				"    WEIGH_MAST              WM,\r\n" + 
				"    AMANAT_MAST             AM\r\n" + 
				"WHERE\r\n" + 
				"    AM.GRADE_ID = GD.ID\r\n" + 
				"    AND WM.ID = GD.WEIGHMENT_ID\r\n" + 
				"    AND WM.VID = CVM.ID\r\n" + 
				"    AND CVM.CID = CM.ID\r\n" + 
				"    AND WM.NET > 0\r\n" + 
				"GROUP BY\r\n" + 
				"    GD.RST,\r\n" + 
				"    CM.NAME,\r\n" + 
				"    AM.INVOICED_QTY,\r\n" + 
				"    AM.DIFF_FROM_SUPER,\r\n" + 
				"    AM.AMANAT_DATE,"
				+ "AM.AMANAT_NO,"
				+ "AM.ID\r\n" + 
				"ORDER BY\r\n" + 
				"    RST";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("quantity", rs.getString(1));
			obj.put("rst", rs.getString(2));
			obj.put("name", rs.getString(3));
			obj.put("differenceFromSuper", rs.getString(4));
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(5)));
			String properDate=new SimpleDateFormat("MM/dd/yyyy").format(date1);
			
			obj.put("amanatDate", properDate);
			obj.put("amanatNo", rs.getString(6));
			obj.put("amanatId", rs.getString(7));
			
			
			jsonArray.put(obj);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return jsonArray;
	}

public JSONArray getAmanatDataForSlip(int rstNo) {
	
	ResultSet rs = null;
	Connection con = null;
	JSONArray jsonArray = new JSONArray();
	SimpleDateFormat format2 = new SimpleDateFormat("MM-dd-yyyy");
	
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT\r\n" + 
				"    GD.QUANTITY - AM.INVOICED_QTY,\r\n" + 
				"    GD.RST,\r\n" + 
				"    CM.NAME,\r\n" + 
				"    CM.ADDRESS,\r\n" + 
				"    CM.MOBILE,\r\n" + 
				"    MAX(GRM.RATE),\r\n" + 
				"    AM.AMANAT_DATE,\r\n" + 
				"    AM.DIFF_FROM_SUPER,\r\n" + 
				"    AM.AMANAT_NO\r\n" + 
				"FROM\r\n" + 
				"    GRADE_DETAILS           GD,\r\n" + 
				"    CUSTOMER_MAST           CM,\r\n" + 
				"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
				"    WEIGH_MAST              WM,\r\n" + 
				"    AMANAT_MAST             AM,\r\n" + 
				"    GRADE_RATE_MASTER       GRM\r\n" + 
				"WHERE\r\n" + 
				"    AM.GRADE_ID = GD.ID\r\n" + 
				"    AND AM.INVOICED_QTY <> GD.QUANTITY\r\n" + 
				"    AND WM.ID = GD.WEIGHMENT_ID\r\n" + 
				"    AND WM.VID = CVM.ID\r\n" + 
				"    AND CVM.CID = CM.ID\r\n" + 
				"    AND WM.NET > 0\r\n" + 
				"    AND TRUNC(CAST(GRM.RATE_DATE AS DATE)) = AM.AMANAT_DATE\r\n" + 
				"    AND AM.RST = ?\r\n" + 
				"GROUP BY\r\n" + 
				"    GD.QUANTITY - AM.INVOICED_QTY,\r\n" + 
				"    GD.RST,\r\n" + 
				"    CM.NAME,\r\n" + 
				"    CM.ADDRESS,\r\n" + 
				"    CM.MOBILE,\r\n" + 
				"    AM.AMANAT_DATE,\r\n" + 
				"    AM.DIFF_FROM_SUPER,\r\n" + 
				"    AM.AMANAT_NO\r\n" + 
				"ORDER BY\r\n" + 
				"    RST";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		stmt.setInt(1, rstNo);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			
			obj.put("quantity", rs.getString(1));
			obj.put("rst", rs.getString(2));
			obj.put("name", rs.getString(3));
			obj.put("address", rs.getString(4));
			obj.put("mobile", rs.getString(5));
			obj.put("superRate", rs.getString(6));
			obj.put("differenceFromSuper", rs.getString(8));
			
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(7)));
			String properDate = format2.format(date1);
			
			obj.put("amanatDate", properDate);
			obj.put("amanatNo", rs.getString(9));
			
			
			jsonArray.put(obj);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return jsonArray;
	}

	public static String getAmanatSeries() {
	
		Connection con = null;
		String amanatNo = "";
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "{ ? = call GET_AMANAT_SERIES() }";
			
			CallableStatement cs = con.prepareCall(invSql);	
			
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.execute();
		
			amanatNo =cs.getString(1); 
			
			cs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amanatNo;
	}
	
	
public long getAmanatInvoicedQty(int amanatId) {
		
		ResultSet rs = null;
		Connection con = null;
		long invoicedQty = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT invoiced_qty FROM AMANAT_MAST WHERE ID=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, amanatId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				invoicedQty = rs.getLong(1); 
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return invoicedQty;
		
	}

	public double totalAmanatQty() {
		ResultSet rs = null;
		Connection con = null;
		double amanatQty = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    NVL(SUM(GD.QUANTITY),0)\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS   GD,\r\n" + 
					"    AMANAT_MAST     AM\r\n" + 
					"WHERE\r\n" + 
					"    AM.GRADE_ID = GD.ID";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				amanatQty = rs.getDouble(1); 
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amanatQty;
	}
	
	public double totalAmanatQty(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		double amanatQty = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    NVL(SUM(GD.QUANTITY),0)\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS   GD,\r\n" + 
					"    AMANAT_MAST     AM,\r\n" + 
					"    WEIGH_MAST      WM,\r\n" + 
					"    DAILY_SETUP     DS\r\n" + 
					"WHERE\r\n" + 
					"    AM.GRADE_ID = GD.ID\r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID\r\n" + 
					"    AND DS.ID = WM.DS_ID\r\n" + 
					"    AND DS.COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			
			stmt.setInt(1, companyId);
			
			while (rs.next()) {
				amanatQty = rs.getDouble(1); 
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amanatQty;
	}
	
	
	public double totalAmanatQty(int companyId, String startDate,String endDate) {
		ResultSet rs = null;
		Connection con = null;
		double amanatQty = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    NVL(SUM(GD.QUANTITY),0)\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS   GD,\r\n" + 
					"    AMANAT_MAST     AM,\r\n" + 
					"    WEIGH_MAST      WM,\r\n" + 
					"    DAILY_SETUP     DS\r\n" + 
					"WHERE\r\n" + 
					"    AM.GRADE_ID = GD.ID\r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID\r\n" + 
					"    AND wm.weighment_date BETWEEN ? AND ?\r\n" + 
					"    AND DS.ID = WM.DS_ID\r\n" + 
					"    AND DS.COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			java.sql.Date startDateSql = java.sql.Date.valueOf(startDate);
			java.sql.Date endDateSql = java.sql.Date.valueOf(endDate);
			stmt.setDate(1, startDateSql);
			stmt.setDate(2, endDateSql);
			stmt.setInt(3, companyId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				amanatQty = rs.getDouble(1); 
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amanatQty;
	}
	
	public double totalAmanatQty(String startDate,String endDate) {
		ResultSet rs = null;
		Connection con = null;
		double amanatQty = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"   NVL(SUM(GD.QUANTITY),0)\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS   GD,\r\n" + 
					"    AMANAT_MAST     AM,\r\n" + 
					"    WEIGH_MAST      WM\r\n" + 
					"WHERE\r\n" + 
					"    AM.GRADE_ID = GD.ID\r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID\r\n" + 
					"    AND wm.weighment_date BETWEEN ? AND ?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			java.sql.Date startDateSql = java.sql.Date.valueOf(startDate);
			java.sql.Date endDateSql = java.sql.Date.valueOf(endDate);
			stmt.setDate(1, startDateSql);
			stmt.setDate(2, endDateSql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				amanatQty = rs.getDouble(1); 
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amanatQty;
	}

	public JSONObject getAmanatDataForInvoiceReceipt(int gradeId) {
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    GRADE_ID,\r\n" + 
					"    FINAL_RATE,\r\n" + 
					"    INVOICED_QTY\r\n" + 
					"FROM\r\n" + 
					"    AMANAT_MAST\r\n" + 
					"WHERE\r\n" + 
					"    GRADE_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			stmt.setInt(1, gradeId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				
				obj.put("amanatGradeId", rs.getInt(1));
				obj.put("finalRate", rs.getDouble(2));
				obj.put("invoicedQty", rs.getDouble(3));
				
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return obj;
	}
	
	public JSONArray getAmanatDataForExcel(String startDate, String endDate) {
		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    AM.ID   AMANAT_MAST_ID,\r\n" + 
					"    AM.GRADE_ID,\r\n" + 
					"    AM.CUSTOMER_ID,\r\n" + 
					"    AM.AMANAT_DATE,\r\n" + 
					"    AM.FINAL_RATE,\r\n" + 
					"    AM.RST,\r\n" + 
					"    AM.DIFF_FROM_SUPER,\r\n" + 
					"    AM.INVOICED_QTY,\r\n" + 
					"    AM.AMANAT_NO,\r\n" + 
					"    II.ID   INVOICE_ITEM_ID,\r\n" + 
					"    II.INVOICE_ID,\r\n" + 
					"    II.WEIGHMENT_ID,\r\n" + 
					"    GD.QUANTITY,\r\n" + 
					"    GD.GRADE,\r\n" + 
					"    GD.RATE,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.TOTAL,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    IM.COMPANY_ID,\r\n" + 
					"    IM.CUSTOMER_ID,\r\n" + 
					"    IM.AUTHORIZER,\r\n" + 
					"    IM.TOTAL_QUANTITY,\r\n" + 
					"    IM.UNLOADING_CHARGES,\r\n" + 
					"    IM.BONUS,\r\n" + 
					"    IM.NET_AMOUNT,\r\n" + 
					"    IM.PDC_AMOUNT,\r\n" + 
					"    IM.ADVANCE,\r\n" + 
					"    COMP.NAME,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.ADDRESS,\r\n" + 
					"    CM.MOBILE,\r\n" + 
					"    CVM.VEHICLE_NO,\r\n" + 
					"    WRM.VEHICLE_NAME,\r\n" + 
					"    WM.NET,\r\n" + 
					"    WM.WEIGHMENT_DATE\r\n" + 
					"FROM\r\n" + 
					"    AMANAT_MAST             AM,\r\n" + 
					"    INVOICE_ITEMS           II,\r\n" + 
					"    GRADE_DETAILS           GD,\r\n" + 
					"    INVOICE_MAST            IM,\r\n" + 
					"    COMPANY_MASTER          COMP,\r\n" + 
					"    CUSTOMER_MAST           CM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    WEIGH_RATE_MAST         WRM\r\n" + 
					"WHERE\r\n" + 
					"    AM.GRADE_ID = II.GRADE_ID\r\n" + 
					"    AND IM.ID = II.INVOICE_ID\r\n" + 
					"    AND COMP.ID = IM.COMPANY_ID\r\n" + 
					"    AND CM.ID = IM.CUSTOMER_ID\r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID\r\n" + 
					"    AND WM.VID = CVM.ID\r\n" + 
					"    AND CVM.V_TYPE_ID = WRM.ID\r\n" + 
					"    AND II.GRADE_ID = GD.ID\r\n" + 
					"    AND IM.INV_DATE BETWEEN ? AND ?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			java.sql.Date startDateSql = java.sql.Date.valueOf(startDate);
			java.sql.Date endDateSql = java.sql.Date.valueOf(endDate);
			stmt.setDate(1, startDateSql);
			stmt.setDate(2, endDateSql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("amanatId", rs.getString(1));
				obj.put("gradeId", rs.getString(2));
				obj.put("customerId", rs.getString(3));
				
				SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy");
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(4)));
				String properAmanatDate = format2.format(date1);

				obj.put("amanatDate", properAmanatDate);
				obj.put("finalRate", rs.getString(5));
				obj.put("rst", rs.getString(6));
				obj.put("differenceFromSuper", rs.getString(7));
				obj.put("invoicedQty", rs.getString(8));
				obj.put("amanatNo", rs.getString(9));
				obj.put("InvoiceItemId", rs.getString(10));
				obj.put("invoiceId", rs.getString(11));
				obj.put("weighmentId", rs.getString(12));
				obj.put("quantity", rs.getString(13));
				obj.put("grade", rs.getString(14));
				obj.put("rate", rs.getString(15));
				obj.put("invoiceNo", rs.getString(16));
				obj.put("toalAmount", rs.getString(17));
				
				Date date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(18)));
				String properInvoiceDate = format2.format(date2);
				obj.put("invoiceDate", properInvoiceDate);
				
				obj.put("companyId", rs.getString(19));
				obj.put("customerId", rs.getString(20));
				obj.put("authorizer", rs.getString(21));
				obj.put("totalQuantity", rs.getString(22));
				obj.put("unloadingCharges", rs.getString(23));
				obj.put("bonus", rs.getString(24));
				obj.put("netAmount", rs.getString(25));
				obj.put("pdcAmount", rs.getString(26));
				obj.put("advance", rs.getString(27));
				obj.put("companyName", rs.getString(28));
				obj.put("customerName", rs.getString(29));
				obj.put("customerAddress", rs.getString(30));
				obj.put("customerMobile", rs.getString(31));
				obj.put("vehicleNo", rs.getString(32));
				obj.put("vehicleName", rs.getString(33));
				obj.put("totalQty", rs.getString(34));
				obj.put("weighmentDate", rs.getString(35));
				
				arr.put(obj);
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}
	
}
