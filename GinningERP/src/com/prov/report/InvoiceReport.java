package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.Invoice;
import com.prov.db.OracleConnection;
import com.prov.misc.NumberToWords;

public class InvoiceReport {
	
public Invoice getInvoiceData(int id) {
		
		ResultSet rs = null;
		Connection con = null;
		Invoice inv = new Invoice();
		
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM INVOICE_MAST WHERE id=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, id);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				inv.setId(rs.getInt(1));
				inv.setInvoiceNo(rs.getString(2));
				inv.setTotal(rs.getDouble(3));
				inv.setAmountPaid(rs.getDouble(4));
				inv.setPending(rs.getDouble(5));
				
				String date = rs.getString(6);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				inv.setInvDate(properDate);
				
				inv.setCompanyId(rs.getInt(7));
				inv.setCustomerId(rs.getInt(8));
				inv.setAuthorizer(rs.getString(9));
				inv.setNote(rs.getString(10));
				inv.setTotalQuanity(rs.getDouble(11));
				inv.setCashAmount(rs.getDouble(12));
				inv.setChequeAmount(rs.getDouble(13));
				inv.setRtgsAmount(rs.getDouble(14));
				inv.setPaidByoperator(rs.getInt(15));
				inv.setUnloadingCharges(rs.getFloat(16));
				inv.setBonusAmount(rs.getFloat(17));
				inv.setNetPayable(rs.getDouble(18));
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return inv;
		
	}


public ArrayList<Invoice> getReport() {
	
	ResultSet rs = null;
	Connection con = null;
	
	ArrayList<Invoice> reportList = new ArrayList<Invoice>();
	
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT * FROM INVOICE_MAST";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			
			Invoice inv = new Invoice();
			
			inv.setId(rs.getInt(1));
			inv.setInvoiceNo(rs.getString(2));
			inv.setTotal(rs.getDouble(3));
			inv.setAmountPaid(rs.getDouble(4));
			inv.setPending(rs.getDouble(5));
			
			String date = rs.getString(6);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);

			inv.setInvDate(properDate);
			inv.setCompanyId(rs.getInt(7));
			inv.setCustomerId(rs.getInt(8));
			inv.setAuthorizer(rs.getString(9));
			inv.setNote(rs.getString(10));
			inv.setTotalQuanity(rs.getDouble(11));
			inv.setCashAmount(rs.getDouble(12));
			inv.setChequeAmount(rs.getDouble(13));
			inv.setRtgsAmount(rs.getDouble(14));
			inv.setPaidByoperator(rs.getInt(15));
			inv.setUnloadingCharges(rs.getFloat(16));
			inv.setBonusAmount(rs.getFloat(17));
			inv.setNetPayable(rs.getDouble(18));
			reportList.add(inv);
			
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return reportList;
}

	public JSONArray getInvoiceReport() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray report = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT IM.ID, IM.INV_DATE, IM.INVOICE_NO, IM.COMPANY_ID, IM.CUSTOMER_ID, IM.PENDING, IM.TOTAL, IM.NET_AMOUNT, IM.AMOUNTPAID, CM.NAME, CM.ADDRESS, CM.MOBILE\r\n" + 
					"FROM INVOICE_MAST IM, CUSTOMER_MAST CM\r\n" + 
					"WHERE IM.CUSTOMER_ID = CM.ID";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("invoiceId", rs.getString(1));
				
				String date = rs.getString(2);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				jsonObj.put("invoiceDate", properDate);
				jsonObj.put("invoiceNo", rs.getString(3));
				jsonObj.put("companyId", rs.getInt(4));
				jsonObj.put("customerId", rs.getInt(5));
				jsonObj.put("pendingAmount", rs.getDouble(6));
				jsonObj.put("totalAmount", rs.getDouble(7));
				jsonObj.put("netPayable", rs.getDouble(8));
				jsonObj.put("amountPaid", rs.getDouble(9));
				jsonObj.put("customerName", rs.getString(10));
				jsonObj.put("customerAddress", rs.getString(11));
				jsonObj.put("customerMobile", rs.getString(12));
				
				report.put(jsonObj);
				
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return report;
	}
	
	public JSONObject getInvoiceForOperator(String invoiceNo) {
		ResultSet rs = null;
		Connection con = null;
		
		JSONObject jsonObj = new JSONObject();
		
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT IM.ID, IM.INVOICE_NO, IM.NET_AMOUNT, IM.AMOUNTPAID, IM.PENDING, IM.INV_DATE, IM.COMPANY_ID, IM.CUSTOMER_ID, IM.AUTHORIZER,  \r\n" + 
							"IM.NOTE, IM.TOTAL_QUANTITY, IM.CASH_AMOUNT, IM.CHEQUE_AMOUNT, IM.RTGS_AMOUNT, IM.PAID_BY_OP, CM.NAME, CM.ADDRESS, CM.MOBILE,\r\n" + 
							"PDC.ID PDC_ID, PDC.BANK_ID, PDC.PAYEE_NAME, PDC.CHEQUE_DATE, PDC.CHEQUE_AMOUNT PDC_AMT, PDC.CHEQUE_NO\r\n" + 
							"FROM INVOICE_MAST IM \r\n" + 
							"inner join CUSTOMER_MAST CM on IM.CUSTOMER_ID = CM.ID \r\n" + 
							"left join PDC_MAST PDC on PDC.INVOICE_ID = IM.ID\r\n" + 
							"WHERE\r\n" + 
							"IM.INVOICE_NO = ?"; 
				
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setString(1, invoiceNo);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				jsonObj.put("invoiceId", rs.getString(1));
				jsonObj.put("invoiceNo", rs.getString(2));
				jsonObj.put("totalAmount", rs.getDouble(3));
				jsonObj.put("amountPaid", rs.getDouble(4));
				jsonObj.put("pendingAmount", rs.getDouble(5));
				
				String date = rs.getString(6);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				jsonObj.put("invoiceDate", properDate);
				
				jsonObj.put("companyId", rs.getInt(7));
				jsonObj.put("customerId", rs.getInt(8));
				jsonObj.put("authorizer", rs.getString(9));
				jsonObj.put("invoiceNote", rs.getString(10));
				jsonObj.put("totalQuantity", rs.getDouble(11));
				jsonObj.put("cashAmount", rs.getDouble(12));
				jsonObj.put("chequeAmount", rs.getDouble(13));
				jsonObj.put("rtgsAmount", rs.getDouble(14));
				jsonObj.put("paidByOperator", rs.getDouble(15));
				jsonObj.put("customerName", rs.getString(16));
				jsonObj.put("customerAddress", rs.getString(17));
				jsonObj.put("customerMobile", rs.getString(18));
				jsonObj.put("pdcId", rs.getString(19));
				jsonObj.put("pdcBankId", rs.getString(20));
				jsonObj.put("pdcPayeeName", rs.getString(21));
				String pdcDate = rs.getString(22);
				if(pdcDate!=null) {
					Date date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(pdcDate);
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String properPdcDate = format.format(date2);
					jsonObj.put("pdcChequeDate", properPdcDate);
				}
				jsonObj.put("pdcAmount", rs.getString(23));
				jsonObj.put("pdcChequeNo", rs.getString(24));
				
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
	}
	
	public JSONObject getInvoiceForPrinting(int invoiceId) {
		
		System.out.println("InvoiceID---" + invoiceId);
		
		ResultSet rs = null;
		Connection con = null;
		NumberToWords numToWords = new NumberToWords();
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT \r\n" + 
					"		IM.ID INV_ID, \r\n" + 
					"		IM.INVOICE_NO,\r\n" + 
					"		IM.TOTAL TOTAL_AMOUNT,\r\n" + 
					"		IM.AMOUNTPAID,\r\n" + 
					"		IM.PENDING,\r\n" + 
					"		IM.INV_DATE,\r\n" + 
					"		IM.COMPANY_ID,\r\n" + 
					"		IM.CUSTOMER_ID,\r\n" + 
					"		IM.AUTHORIZER,\r\n" + 
					"		IM.NOTE,\r\n" + 
					"		IM.TOTAL_QUANTITY,\r\n" + 
					"		IM.CASH_AMOUNT,\r\n" + 
					"		IM.CHEQUE_AMOUNT,\r\n" + 
					"		IM.RTGS_AMOUNT,\r\n" + 
					"		IM.PAID_BY_OP,\r\n" + 
					"       IM.UNLOADING_CHARGES,\r\n"+	
					"       IM.BONUS,\r\n"+
					"       IM.NET_AMOUNT,\r\n"+
					"		COMP.NAME COMP_NAME,\r\n" + 
					"		COMP.ADDRESS COMP_ADDR,\r\n" + 
					"		COMP.TELEPHONE COMP_TEL,\r\n" + 
					"		COMP.GST,\r\n" +
					"		COMP.STATE COMP_STATE,\r\n" +
					"		CUST.NAME CUST_NAME,\r\n" + 
					"		CUST.ADDRESS CUST_ADDR,\r\n" + 
					"		CUST.MOBILE CUST_MOB,\r\n" + 
					"		II.ID INV_ITEM_ID,\r\n" + 
					"		II.WEIGHMENT_ID,\r\n" + 
					"		II.GRADE_ID,\r\n" + 
					"		II.RST,\r\n" + 
					"		WM.VID VEH_ID,\r\n" + 
					"		GD.MATERIAL,\r\n" + 
					"		GD.QUANTITY,\r\n" + 
					"		GD.GRADE,\r\n" + 
					"		GD.RATE,\r\n" + 
					"		GD.MOISTURE,\r\n" + 
					"		GD.AUTHORIZED_BY,\r\n" + 
					"		GM.DESCRIPTION,\r\n" + 
					"		CV.WEIGH_RATE, \r\n" + 
					"		COMP.EMAIL COMP_EMAIL\r\n" + 
					"FROM\r\n" + 
					"		INVOICE_MAST IM,\r\n" + 
					"		COMPANY_MASTER COMP,\r\n" + 
					"		CUSTOMER_MAST CUST,\r\n" + 
					"		invoice_items II,\r\n" + 
					"		weigh_mast WM,\r\n" + 
					"		grade_details GD,\r\n" + 
					"		customer_vehicle_mast CV,\r\n" + 
					"		grade_master GM\r\n" + 
					"WHERE \r\n" + 
					"		im.id = ii.invoice_id AND\r\n" + 
					"		im.company_id = comp.id AND\r\n" + 
					"		im.customer_id = cust.id AND\r\n" + 
					"		ii.grade_id = gd.id AND\r\n" + 
					"		gd.weighment_id = wm.id AND\r\n" + 
					"		GM.GRADE = gd.grade AND\r\n" + 
					"		wm.vid = cv.id AND\r\n" + 
					"		IM.ID=?"; 
				
			PreparedStatement stmt = con.prepareStatement(invSql, ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			
			stmt.setInt(1, invoiceId);
			
			rs = stmt.executeQuery();
			
			rs.first();
			
			jsonObj.put("invoiceId", rs.getInt(1));
			jsonObj.put("invoiceNo", rs.getString(2));
			jsonObj.put("totalAmount","Rs. "+ rs.getString(3)+" /-");
			
			
			jsonObj.put("amountPaid", rs.getDouble(4));
			jsonObj.put("amountPending", rs.getDouble(5));
			jsonObj.put("invoiceDate", rs.getString(6));
			jsonObj.put("companyId", rs.getInt(7));
			jsonObj.put("customerId", rs.getInt(8));
			jsonObj.put("authorizer", rs.getString(9));
			jsonObj.put("note", rs.getString(10));
			jsonObj.put("totalQuantity", rs.getString(11)+" Kgs");
			jsonObj.put("cashAmount", rs.getDouble(12));
			jsonObj.put("chequeAmount", rs.getDouble(13));
			jsonObj.put("rtgsAmount", rs.getDouble(14));
			jsonObj.put("paidByOperator", rs.getInt(15));
			jsonObj.put("unloadingCharges", rs.getFloat(16));
			jsonObj.put("bonusAmount", rs.getFloat(17));
			
			String amountInWords = numToWords.convertToIndianCurrency(rs.getString(18));
			
			jsonObj.put("totalInWords", amountInWords);
			
			jsonObj.put("netAmount","Rs. "+ rs.getString(18)+" /-");
			
			jsonObj.put("companyName", rs.getString(19));
			jsonObj.put("companyAddress", rs.getString(20));
			jsonObj.put("companyTelephone", rs.getString(21));
			jsonObj.put("companyGst", rs.getString(22));
			jsonObj.put("companyState", rs.getString(23));
			jsonObj.put("vendorName", rs.getString(24));
			jsonObj.put("vendorAddress", rs.getString(25));
			jsonObj.put("vendorMobile", rs.getString(26));
			jsonObj.put("weighRate", rs.getDouble(39));
			jsonObj.put("companyEmail", rs.getString(40));
			
			JSONArray jsonArr = new JSONArray();
			
			rs.previous();
			while (rs.next()) {
				
				
				JSONObject invoiceItems = new JSONObject();
				
				invoiceItems.put("invoiceItemId", rs.getInt(27));
				invoiceItems.put("weighmentId", rs.getInt(28));
				invoiceItems.put("gradeId", rs.getInt(29));
				invoiceItems.put("rst", rs.getInt(30));
				invoiceItems.put("vehicleId", rs.getInt(31));
				invoiceItems.put("material", rs.getString(32));
				invoiceItems.put("quantity", rs.getDouble(33));
				invoiceItems.put("grade", rs.getString(34));
				invoiceItems.put("rate", rs.getDouble(35));
				invoiceItems.put("moisture", rs.getFloat(36));
				invoiceItems.put("gradeAuthorizer", rs.getString(37));
				invoiceItems.put("gradeDescription", rs.getString(38));
				
				double amount =  (rs.getDouble(33)/100) * rs.getDouble(33);
						
				invoiceItems.put("amount", amount);
				
				jsonArr.put(invoiceItems);
				
			}
			
			jsonObj.put("invoiceItems", jsonArr);
			
			System.out.println(jsonObj);
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
		
	}
	
	public JSONArray getTodaysPendingInvoiceReport() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray report = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT IM.ID, IM.INV_DATE, IM.INVOICE_NO, IM.COMPANY_ID, IM.CUSTOMER_ID, IM.PENDING, IM.TOTAL, IM.NET_AMOUNT, IM.AMOUNTPAID, CM.NAME, CM.ADDRESS, CM.MOBILE\r\n" + 
							"FROM INVOICE_MAST IM, CUSTOMER_MAST CM\r\n" + 
							"WHERE \r\n" + 
							"im.customer_id = cm.id and\r\n" + 
							"im.inv_date = trunc(sysdate) and \r\n" + 
							"im.pending >0";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("invoiceId", rs.getString(1));
				
				String date = rs.getString(2);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				jsonObj.put("invoiceDate", properDate);
				jsonObj.put("invoiceNo", rs.getString(3));
				jsonObj.put("companyId", rs.getInt(4));
				jsonObj.put("customerId", rs.getInt(5));
				jsonObj.put("pendingAmount", rs.getDouble(6));
				jsonObj.put("totalAmount", rs.getDouble(7));
				jsonObj.put("netPayable", rs.getDouble(8));
				jsonObj.put("amountPaid", rs.getDouble(9));
				jsonObj.put("customerName", rs.getString(10));
				jsonObj.put("customerAddress", rs.getString(11));
				jsonObj.put("customerMobile", rs.getString(12));
				
				report.put(jsonObj);
				
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return report;
	}
}
