package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.WeighMast;
import com.prov.db.OracleConnection;

public class WeighReport {
	
	public WeighMast getReport(int id) {

	ResultSet rs = null;
	Connection con = null;
	
	WeighMast wm = new WeighMast();
	
	try {
		
		con=OracleConnection.getConnection();
			
		String weighSql = "SELECT * FROM WEIGH_MAST WHERE ID="+id;
		
		PreparedStatement stmt = con.prepareStatement(weighSql);
		
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			wm.setId(rs.getInt(1));
			wm.setRst(rs.getInt(2));
			wm.setVid(rs.getInt(3));
			wm.setMaterial(rs.getString(4));
			wm.setGross(rs.getFloat(5));
			wm.setTare(rs.getFloat(6));
			wm.setNet(rs.getFloat(7));
			String grossTime = rs.getString(8);
			
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(grossTime);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);
			wm.setGrossWtTime(properDate);
			
			String tareTime = rs.getString(9);
			
			date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(tareTime); 
			properDate = format2.format(date1);
			wm.setTareWtTime(properDate);
			
			String weighmentDate = rs.getString(10);
			
			date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(weighmentDate); 
			properDate = format2.format(date1);
			wm.setWeighmentDate(properDate);
			wm.setDsId(rs.getInt(11));

			}
		
		stmt.close();
		rs.close();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wm;
	
	}
	
	
	public ArrayList<WeighMast> getReport() {

		ResultSet rs = null;
		Connection con = null;
		
		ArrayList<WeighMast> list = new ArrayList<WeighMast>();
		
		try {
			
			con=OracleConnection.getConnection();
				
			String weighSql = "SELECT * FROM WEIGH_MAST ORDER BY RST";
			
			PreparedStatement stmt = con.prepareStatement(weighSql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				WeighMast wm = new WeighMast();
				
				wm.setId(rs.getInt(1));
				wm.setRst(rs.getInt(2));
				wm.setVid(rs.getInt(3));
				wm.setMaterial(rs.getString(4));
				wm.setGross(rs.getFloat(5));
				wm.setTare(rs.getFloat(6));
				wm.setNet(rs.getFloat(7));
				wm.setGrossWtTime(rs.getString(8));
				wm.setTareWtTime(rs.getString(9));
				String weighmentDate = rs.getString(10);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(weighmentDate); 
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String properDate = format2.format(date1);
				wm.setWeighmentDate(properDate);
				wm.setDsId(rs.getInt(11));
				list.add(wm);				
				}
			
			stmt.close();
			rs.close();
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		
		}
	
	public JSONArray pendingTareReport() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray jsonArray = new JSONArray();
		
		try {
			
			con=OracleConnection.getConnection();
				
			String weighSql = "SELECT\r\n" + 
					"    WM.RST,\r\n" + 
					"    WM.GROSS,\r\n" + 
					"    CM.NAME\r\n" + 
					"FROM\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    CUSTOMER_MAST           CM\r\n" + 
					"WHERE\r\n" + 
					"    WM.VID = CVM.ID\r\n" + 
					"    AND CVM.CID = CM.ID\r\n" + 
					"    AND WM.NET = 0\r\n" + 
					"ORDER BY\r\n" + 
					"    RST DESC";
			
			PreparedStatement stmt = con.prepareStatement(weighSql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("rst", rs.getInt(1));
				obj.put("grossWt",rs.getDouble(2));
				obj.put("customerName", rs.getString(3));


				jsonArray.put(obj);		
			}
			
			stmt.close();
			rs.close();
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return jsonArray;
	}
	
	public JSONArray todaysCompletedRst() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray jsonArray = new JSONArray();
		
		try {
			
			con=OracleConnection.getConnection();
				
			String weighSql = "SELECT\r\n" + 
					"    WM.RST,\r\n" + 
					"    WM.NET,\r\n" + 
					"    CM.NAME\r\n" + 
					"FROM\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    CUSTOMER_MAST           CM\r\n" + 
					"WHERE\r\n" + 
					"    WM.VID = CVM.ID\r\n" + 
					"    AND CVM.CID = CM.ID\r\n" + 
					"    AND WM.NET > 0\r\n" + 
					"    AND TRUNC(WEIGHMENT_DATE) = TRUNC(SYSDATE)\r\n" + 
					"ORDER BY\r\n" + 
					"    RST DESC";
			
			PreparedStatement stmt = con.prepareStatement(weighSql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("rst", rs.getInt(1));
				obj.put("netWt",rs.getDouble(2));
				obj.put("customerName", rs.getString(3));


				jsonArray.put(obj);		
			}
			
			stmt.close();
			rs.close();
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return jsonArray;
	}
	
	
	public JSONArray getWeighBridgeReport() {

		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		
		try {
			
			con=OracleConnection.getConnection();
				
			String weighSql = "SELECT\r\n" + 
					"    WM.ID,\r\n" + 
					"    WM.RST,\r\n" + 
					"    WM.VID,\r\n" + 
					"    WM.MATERIAL,\r\n" + 
					"    WM.GROSS,\r\n" + 
					"    WM.TARE,\r\n" + 
					"    WM.NET,\r\n" + 
					"    WM.GROSSWT_TIME,\r\n" + 
					"    WM.TAREWT_TIME,\r\n" + 
					"    WM.WEIGHMENT_DATE,\r\n" + 
					"    WM.DS_ID,\r\n" + 
					"    WM.WB_OPERATOR,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.MOBILE,\r\n" + 
					"    CVM.VEHICLE_NO,\r\n" + 
					"    WRM.VEHICLE_NAME\r\n" + 
					"FROM\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    CUSTOMER_MAST           CM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    WEIGH_RATE_MAST         WRM\r\n" + 
					"WHERE\r\n" + 
					"    WM.VID = CVM.ID\r\n" + 
					"    AND CVM.CID = CM.ID\r\n" + 
					"    AND CVM.V_TYPE_ID = WRM.ID\r\n" + 
					"ORDER BY\r\n" + 
					"    RST DESC";
			
			PreparedStatement stmt = con.prepareStatement(weighSql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				JSONObject obj = new JSONObject();
				
				obj.put("wmId", rs.getString(1));
				obj.put("rst", rs.getString(2));
				obj.put("vid", rs.getString(3));
				obj.put("material", rs.getString(4));
				obj.put("gross", rs.getString(5));
				obj.put("tare", rs.getString(6));
				obj.put("net", rs.getString(7));
				obj.put("grossTime", rs.getString(8));
				obj.put("tareTime", rs.getString(9));
				
				String weighmentDate = rs.getString(10);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(weighmentDate); 
				SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
				String properDate = format2.format(date1);
				
				obj.put("weighDate", properDate);
				obj.put("dsId", rs.getString(11));
				obj.put("wbOperator", rs.getString(12));
				obj.put("vendorName", rs.getString(13));
				obj.put("vendorMobile", rs.getString(14));
				obj.put("vehicleNo", rs.getString(15));
				obj.put("vehicleName", rs.getString(16));
				
				arr.put(obj);
			}
			stmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
				e.printStackTrace();
		}
			return arr;
	}
}
