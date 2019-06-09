package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.prov.bean.Amanat;
import com.prov.bean.Customer;
import com.prov.bean.WeighMast;
import com.prov.db.OracleConnection;

public class AmanatReport {

public Amanat getAmanatData(int rst) {
		
		ResultSet rs = null;
		Connection con = null;
		Amanat a = new Amanat();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM AMANAT_MAST WHERE RST=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				a.setId(rs.getInt(1));
				a.setRst(rs.getInt(2));
				a.setCid(rs.getInt(3));
				a.setVid(rs.getInt(4));
				a.setContractRate(rs.getDouble(5));
				a.setTotal(rs.getDouble(6));
				a.setAmanatDate(rs.getString(7));
				a.setDateOfExpiry(rs.getString(8));
				a.setFinalRate(rs.getDouble(9));
				a.setInvId(rs.getInt(10));
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
		
	}
	
public ArrayList<Amanat> getAmanatData() {
	
	ResultSet rs = null;
	Connection con = null;
	ArrayList<Amanat> list = new ArrayList<Amanat>();
	CustomerReport cr = new CustomerReport();
	WeighReport wr = new WeighReport();
	
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT * FROM AMANAT_MAST WHERE FINAL_RATE=0 ORDER BY DATE_EXPIRY";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Amanat a = new Amanat();
			
			
			
			a.setId(rs.getInt(1));
			a.setRst(rs.getInt(2));
			a.setCid(rs.getInt(3));
			a.setVid(rs.getInt(4));
			a.setContractRate(rs.getDouble(5));
			a.setTotal(rs.getDouble(6));
			
			String date = rs.getString(7);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
			String properDate = format2.format(date1);
			a.setAmanatDate(properDate);
			
			date = rs.getString(8);
			date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date); 
			properDate = format2.format(date1);
			a.setDateOfExpiry(properDate);
			
			a.setFinalRate(rs.getDouble(9));
			a.setInvId(rs.getInt(10));
			Customer c = cr.getReport(a.getCid());
			WeighMast w = wr.getReport(a.getRst());
			a.setCustomerName(c.getName());
			a.setMaterial(w.getMaterial());
			a.setQuantity(w.getNet());
			a.setAddress(c.getAddress());
			
			list.add(a);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
	
}


}
