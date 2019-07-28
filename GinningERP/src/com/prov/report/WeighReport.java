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
				
			String weighSql = "SELECT WM.RST , WM.GROSS, CM.NAME \r\n" + 
							"FROM WEIGH_MAST WM, CUSTOMER_VEHICLE_MAST CVM, CUSTOMER_MAST CM\r\n" + 
							"WHERE WM.VID = CVM.ID AND\r\n" + 
							"CVM.CID = CM.ID AND\r\n" + 
							"WM.NET=0";
			
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
	
}
