package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.prov.bean.Bank;
import com.prov.db.OracleConnection;

public class BankReport {
	
	public ArrayList<Bank> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Bank> bankList = new ArrayList<Bank>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM BANK_MAST ORDER BY BANK_NAME";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Bank b = new Bank();
				
				b.setId(rs.getInt(1));
				b.setCompanyId(rs.getInt(2));
				b.setBankName(rs.getString(3));
				b.setIfsc(rs.getString(4));
				b.setMicr(rs.getString(5));
				b.setAccountNo(rs.getString(6));
				
				String date = rs.getString(7);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				b.setDate(properDate);
			
				bankList.add(b);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bankList;
	}

	public Bank getReport(int bankId) {
		ResultSet rs = null;
		Connection con = null;
		Bank b = new Bank();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM BANK_MAST WHERE ID="+bankId;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				
				b.setId(rs.getInt(1));
				b.setCompanyId(rs.getInt(2));
				b.setBankName(rs.getString(3));
				b.setIfsc(rs.getString(4));
				b.setMicr(rs.getString(5));
				b.setAccountNo(rs.getString(6));
				
				String date = rs.getString(7);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				b.setDate(properDate);
			
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public ArrayList<Bank> getBankReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Bank> bankList = new ArrayList<Bank>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM BANK_MAST WHERE COMPANY_ID="+companyId;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Bank b = new Bank();
				b.setId(rs.getInt(1));
				b.setCompanyId(rs.getInt(2));
				b.setBankName(rs.getString(3));
				b.setIfsc(rs.getString(4));
				b.setMicr(rs.getString(5));
				b.setAccountNo(rs.getString(6));
				
				String date = rs.getString(7);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				b.setDate(properDate);
				
				bankList.add(b);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bankList;
	}
}
