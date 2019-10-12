package com.prov.report;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
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
				inv.setTotal(rs.getLong(3));
				inv.setAmountPaid(rs.getLong(4));
				inv.setPending(rs.getLong(5));
				
				String date = rs.getString(6);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				inv.setInvDate(properDate);
				
				inv.setCompanyId(rs.getInt(7));
				inv.setCustomerId(rs.getInt(8));
				inv.setAuthorizer(rs.getString(9));
				inv.setNote(rs.getString(10));
				inv.setTotalQuanity(rs.getLong(11));
				inv.setCashAmount(rs.getLong(12));
				inv.setChequeAmount(rs.getLong(13));
				inv.setRtgsAmount(rs.getLong(14));
				inv.setPaidByoperator(rs.getInt(15));
				inv.setUnloadingCharges(rs.getFloat(16));
				inv.setBonusAmount(rs.getFloat(17));
				inv.setNetPayable(rs.getLong(18));
				inv.setPdcAmount(rs.getLong(19));
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
			inv.setTotal(rs.getLong(3));
			inv.setAmountPaid(rs.getLong(4));
			inv.setPending(rs.getLong(5));
			
			String date = rs.getString(6);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);

			inv.setInvDate(properDate);
			inv.setCompanyId(rs.getInt(7));
			inv.setCustomerId(rs.getInt(8));
			inv.setAuthorizer(rs.getString(9));
			inv.setNote(rs.getString(10));
			inv.setTotalQuanity(rs.getLong(11));
			inv.setCashAmount(rs.getLong(12));
			inv.setChequeAmount(rs.getLong(13));
			inv.setRtgsAmount(rs.getLong(14));
			inv.setPaidByoperator(rs.getInt(15));
			inv.setUnloadingCharges(rs.getFloat(16));
			inv.setBonusAmount(rs.getFloat(17));
			inv.setNetPayable(rs.getLong(18));
			inv.setPdcAmount(rs.getLong(19));
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
			
			String invSql = "SELECT DISTINCT  \r\n" + 
					"IM.ID, IM.INV_DATE, IM.INVOICE_NO, IM.COMPANY_ID, IM.CUSTOMER_ID, IM.PENDING, IM.TOTAL, IM.NET_AMOUNT, IM.AMOUNTPAID, \r\n" + 
					"CM.NAME, CM.ADDRESS, CM.MOBILE,\r\n" + 
					"II.RST\r\n" + 
					"FROM INVOICE_MAST IM, CUSTOMER_MAST CM, INVOICE_ITEMS II\r\n" + 
					"WHERE IM.CUSTOMER_ID = CM.ID AND\r\n" + 
					"II.INVOICE_ID = IM.ID AND\r\n" + 
					"IM.PENDING <> 0\r\n" + 
					"ORDER BY RST";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			int i = 0;
			
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
				jsonObj.put("pendingAmount", rs.getLong(6));
				jsonObj.put("totalAmount", rs.getLong(7));
				jsonObj.put("netPayable", rs.getLong(8));
				jsonObj.put("amountPaid", rs.getLong(9));
				jsonObj.put("customerName", rs.getString(10));
				jsonObj.put("customerAddress", rs.getString(11));
				jsonObj.put("customerMobile", rs.getString(12));
				jsonObj.put("rst", rs.getString(13));
				if(report.length() != 0) {
					if(report.getJSONObject(i).getString("invoiceNo").equals(jsonObj.getString("invoiceNo"))){
						//report.getJSONObject(i).append("rst", ","+jsonObj.getInt("rst"));
						String previousRst = report.getJSONObject(i).getString("rst");
						report.getJSONObject(i).remove("rst");
						report.getJSONObject(i).put("rst", previousRst+", "+jsonObj.getString("rst"));
						continue;
					}else if(!report.getJSONObject(i).getString("invoiceNo").equals(jsonObj.getString("invoiceNo")))
					{
						report.put(jsonObj);
						i++;
					}
				}else {
					report.put(jsonObj);
				}
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return report;
	}
	
	public JSONArray getAllInvoiceReport() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray report = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT DISTINCT  \r\n" + 
					"IM.ID, IM.INV_DATE, IM.INVOICE_NO, IM.COMPANY_ID, IM.CUSTOMER_ID, IM.PENDING, IM.TOTAL, IM.NET_AMOUNT, IM.AMOUNTPAID, \r\n" + 
					"CM.NAME, CM.ADDRESS, CM.MOBILE,\r\n" + 
					"II.RST\r\n" + 
					"FROM INVOICE_MAST IM, CUSTOMER_MAST CM, INVOICE_ITEMS II\r\n" + 
					"WHERE IM.CUSTOMER_ID = CM.ID AND\r\n" + 
					"II.INVOICE_ID = IM.ID\r\n" + 
					"ORDER BY RST";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			int i = 0;
			
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
				jsonObj.put("pendingAmount", rs.getLong(6));
				jsonObj.put("totalAmount", rs.getLong(7));
				jsonObj.put("netPayable", rs.getLong(8));
				jsonObj.put("amountPaid", rs.getLong(9));
				jsonObj.put("customerName", rs.getString(10));
				jsonObj.put("customerAddress", rs.getString(11));
				jsonObj.put("customerMobile", rs.getString(12));
				jsonObj.put("rst", rs.getString(13));
				if(report.length() != 0) {
					if(report.getJSONObject(i).getString("invoiceNo").equals(jsonObj.getString("invoiceNo"))){
						//report.getJSONObject(i).append("rst", ","+jsonObj.getInt("rst"));
						String previousRst = report.getJSONObject(i).getString("rst");
						report.getJSONObject(i).remove("rst");
						report.getJSONObject(i).put("rst", previousRst+", "+jsonObj.getString("rst"));
						continue;
					}else if(!report.getJSONObject(i).getString("invoiceNo").equals(jsonObj.getString("invoiceNo")))
					{
						report.put(jsonObj);
						i++;
					}
				}else {
					report.put(jsonObj);
				}
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
					"IM.NOTE, IM.TOTAL_QUANTITY, IM.CASH_AMOUNT, IM.CHEQUE_AMOUNT, IM.RTGS_AMOUNT, IM.PDC_AMOUNT, IM.PAID_BY_OP, CM.NAME, CM.ADDRESS, CM.MOBILE,\r\n" + 
					"PDC.ID PDC_ID, pdc.pay_date , pdc.amount PDC_AMT, pdc.mode_of_payment\r\n" + 
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
				jsonObj.put("totalAmount", rs.getLong(3));
				jsonObj.put("amountPaid", rs.getLong(4));
				jsonObj.put("pendingAmount", rs.getLong(5));
				
				String date = rs.getString(6);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String properDate = format2.format(date1);
				jsonObj.put("invoiceDate", properDate);
				
				jsonObj.put("companyId", rs.getInt(7));
				jsonObj.put("customerId", rs.getInt(8));
				jsonObj.put("authorizer", rs.getString(9));
				jsonObj.put("invoiceNote", rs.getString(10));
				jsonObj.put("totalQuantity", rs.getLong(11));
				jsonObj.put("cashAmount", rs.getLong(12));
				jsonObj.put("chequeAmount", rs.getLong(13));
				jsonObj.put("rtgsAmount", rs.getLong(14));
				jsonObj.put("pdcAmount", rs.getLong(15));
				jsonObj.put("paidByOperator", rs.getLong(16));
				jsonObj.put("customerName", rs.getString(17));
				jsonObj.put("customerAddress", rs.getString(18));
				jsonObj.put("customerMobile", rs.getString(19));
				jsonObj.put("pdcId", rs.getString(20));
				String pdcDate = rs.getString(21);
				if(pdcDate!=null) {
					Date date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(pdcDate);
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String properPdcDate = format.format(date2);
					jsonObj.put("pdcPayDate", properPdcDate);
				}
				jsonObj.put("pdcAmount", rs.getString(22));
				jsonObj.put("pdcPaymentMode", rs.getString(23));
				
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
	}
	
	public JSONObject getInvoiceForPrinting(int invoiceId) {
		
		ResultSet rs = null;
		Connection con = null;
		NumberToWords numToWords = new NumberToWords();
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    IM.ID INV_ID,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.TOTAL TOTAL_AMOUNT,\r\n" + 
					"    IM.AMOUNTPAID,\r\n" + 
					"    IM.PENDING,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    IM.COMPANY_ID,\r\n" + 
					"    IM.CUSTOMER_ID,\r\n" + 
					"    IM.AUTHORIZER,\r\n" + 
					"    IM.NOTE,\r\n" + 
					"    IM.TOTAL_QUANTITY,\r\n" + 
					"    IM.CASH_AMOUNT,\r\n" + 
					"    IM.CHEQUE_AMOUNT,\r\n" + 
					"    IM.RTGS_AMOUNT,\r\n" + 
					"    IM.PAID_BY_OP,\r\n" + 
					"    IM.UNLOADING_CHARGES,\r\n" + 
					"    IM.BONUS,\r\n" + 
					"    IM.NET_AMOUNT,\r\n" + 
					"    IM.PDC_AMOUNT,\r\n" + 
					"    COMP.NAME COMP_NAME,\r\n" + 
					"    COMP.ADDRESS COMP_ADDR,\r\n" + 
					"    COMP.TELEPHONE COMP_TEL,\r\n" + 
					"    COMP.GST,\r\n" + 
					"    COMP.STATE COMP_STATE,\r\n" + 
					"    CUST.NAME CUST_NAME,\r\n" + 
					"    CUST.ADDRESS CUST_ADDR,\r\n" + 
					"    CUST.MOBILE CUST_MOB,\r\n" + 
					"    II.ID INV_ITEM_ID,\r\n" + 
					"    II.WEIGHMENT_ID,\r\n" + 
					"    II.GRADE_ID,\r\n" + 
					"    II.RST,\r\n" + 
					"    WM.VID VEH_ID,\r\n" + 
					"    GD.MATERIAL,\r\n" + 
					"    GD.QUANTITY,\r\n" + 
					"    GD.GRADE,\r\n" + 
					"    GD.RATE,\r\n" + 
					"    GD.MOISTURE,\r\n" + 
					"    GD.AUTHORIZED_BY,\r\n" + 
					"    GM.DESCRIPTION,\r\n" + 
					"    CV.WEIGH_RATE,\r\n" + 
					"    COMP.EMAIL COMP_EMAIL,\r\n" + 
					"    PDC.PAY_DATE,\r\n" + 
					"    PDC.MODE_OF_PAYMENT\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST IM\r\n" + 
					"    left outer join \r\n" + 
					"    pdc_mast pdc\r\n" + 
					"    on pdc.invoice_id = IM.ID, \r\n" + 
					"    COMPANY_MASTER COMP,\r\n" + 
					"    CUSTOMER_MAST CUST,\r\n" + 
					"    invoice_items II,\r\n" + 
					"    weigh_mast WM,\r\n" + 
					"    grade_details GD,\r\n" + 
					"    customer_vehicle_mast CV,\r\n" + 
					"    grade_master GM\r\n" + 
					"WHERE\r\n" + 
					"    im.id = ii.invoice_id AND\r\n" + 
					"    im.company_id = comp.id AND\r\n" + 
					"    im.customer_id = cust.id AND\r\n" + 
					"    ii.grade_id = gd.id AND\r\n" + 
					"    gd.weighment_id = wm.id AND\r\n" + 
					"    GM.GRADE = gd.grade AND\r\n" + 
					"    wm.vid = cv.id  AND\r\n" + 
					"    IM.ID=?"; 
				
			PreparedStatement stmt = con.prepareStatement(invSql, ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			
			stmt.setInt(1, invoiceId);
			
			rs = stmt.executeQuery();
			
			rs.first();
			
			jsonObj.put("invoiceId", rs.getInt(1));
			jsonObj.put("invoiceNo", rs.getString(2));
			jsonObj.put("totalAmount","Rs. "+ rs.getString(3)+" /-");
			
			
			jsonObj.put("amountPaid", rs.getLong(4));
			jsonObj.put("amountPending", rs.getLong(5));
			jsonObj.put("invoiceDate", rs.getString(6));
			jsonObj.put("companyId", rs.getInt(7));
			jsonObj.put("customerId", rs.getInt(8));
			jsonObj.put("authorizer", rs.getString(9));
			jsonObj.put("note", rs.getString(10));
			jsonObj.put("totalQuantity", rs.getString(11)+" Kgs");
			jsonObj.put("cashAmount", rs.getLong(12));
			jsonObj.put("chequeAmount", rs.getLong(13));
			jsonObj.put("rtgsAmount", rs.getLong(14));
			jsonObj.put("paidByOperator", rs.getInt(15));
			jsonObj.put("unloadingCharges", rs.getFloat(16));
			jsonObj.put("bonusAmount", rs.getFloat(17));
			
			String amountInWords = numToWords.convertToIndianCurrency(rs.getString(18));
			
			jsonObj.put("totalInWords", amountInWords);
			
			jsonObj.put("netAmount","Rs. "+ rs.getString(18)+" /-");
			jsonObj.put("pdcAmount", rs.getLong(19));
			jsonObj.put("companyName", rs.getString(20));
			jsonObj.put("companyAddress", rs.getString(21));
			jsonObj.put("companyTelephone", rs.getString(22));
			jsonObj.put("companyGst", rs.getString(23));
			jsonObj.put("companyState", rs.getString(24));
			jsonObj.put("vendorName", rs.getString(25));
			jsonObj.put("vendorAddress", rs.getString(26));
			jsonObj.put("vendorMobile", rs.getString(27));
			jsonObj.put("weighRate", rs.getLong(40));
			jsonObj.put("companyEmail", rs.getString(41));
			if(rs.getString(42) != null) {
				jsonObj.put("pdcDate", rs.getString(42));
			}else {
				jsonObj.put("pdcDate","NA");
			}
			if(rs.getString(43) != null) {
				jsonObj.put("pdcMode", rs.getString(43));
			}else {
				jsonObj.put("pdcMode", "NA");
			}
			
			JSONArray jsonArr = new JSONArray();
			
			rs.previous();
			while (rs.next()) {
				
				
				JSONObject invoiceItems = new JSONObject();
				
				invoiceItems.put("invoiceItemId", rs.getInt(28));
				invoiceItems.put("weighmentId", rs.getInt(29));
				invoiceItems.put("gradeId", rs.getInt(30));
				invoiceItems.put("rst", rs.getInt(31));
				invoiceItems.put("vehicleId", rs.getInt(32));
				invoiceItems.put("material", rs.getString(33));
				invoiceItems.put("quantity", rs.getLong(34));
				invoiceItems.put("grade", rs.getString(35));
				invoiceItems.put("rate", rs.getLong(36));
				invoiceItems.put("moisture", rs.getFloat(37));
				invoiceItems.put("gradeAuthorizer", rs.getString(38));
				invoiceItems.put("gradeDescription", rs.getString(39));
				
				double amount =  (rs.getLong(34)/100) * rs.getLong(34);
						
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
				jsonObj.put("pendingAmount", rs.getLong(6));
				jsonObj.put("totalAmount", rs.getLong(7));
				jsonObj.put("netPayable", rs.getLong(8));
				jsonObj.put("amountPaid", rs.getLong(9));
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
	
	public String getInvoiceNoSeries(int companyId) {
	
		Connection con = null;
		String invoiceSeries = null;
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "{? = call GET_INVOICE_SERIES(?)}";
			
			CallableStatement stmt = con.prepareCall(invSql);
			
			stmt.registerOutParameter(1, Types.VARCHAR);
			stmt.setInt(2, companyId);
			
		    stmt.executeUpdate();
			
		    invoiceSeries = stmt.getString(1);
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return invoiceSeries;
	}
	
	public JSONObject getInvoiceDataForUpdation(String invoiceNo) {
		
		ResultSet rs = null;
		Connection con = null;
		NumberToWords numToWords = new NumberToWords();
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT \r\n" + 
					"							IM.ID INV_ID, \r\n" + 
					"							IM.INVOICE_NO,\r\n" + 
					"							IM.TOTAL TOTAL_AMOUNT,\r\n" + 
					"							IM.AMOUNTPAID,\r\n" + 
					"							IM.PENDING,\r\n" + 
					"							IM.INV_DATE,\r\n" + 
					"							IM.COMPANY_ID,\r\n" + 
					"							IM.CUSTOMER_ID,\r\n" + 
					"							IM.AUTHORIZER,\r\n" + 
					"							IM.NOTE,\r\n" + 
					"							IM.TOTAL_QUANTITY,\r\n" + 
					"							IM.CASH_AMOUNT,\r\n" + 
					"							IM.CHEQUE_AMOUNT,\r\n" + 
					"							IM.RTGS_AMOUNT,\r\n" + 
					"							IM.PAID_BY_OP,\r\n" + 
					"					       IM.UNLOADING_CHARGES,\r\n" + 
					"					       IM.BONUS,\r\n" + 
					"					       IM.NET_AMOUNT,\r\n" + 
					"					       IM.PDC_AMOUNT,\r\n" + 
					"							COMP.NAME COMP_NAME,\r\n" + 
					"							COMP.ADDRESS COMP_ADDR,\r\n" + 
					"							COMP.TELEPHONE COMP_TEL,\r\n" + 
					"							COMP.GST,\r\n" + 
					"							COMP.STATE COMP_STATE,\r\n" + 
					"							CUST.NAME CUST_NAME,\r\n" + 
					"							CUST.ADDRESS CUST_ADDR,\r\n" + 
					"							CUST.MOBILE CUST_MOB,\r\n" + 
					"							II.ID INV_ITEM_ID,\r\n" + 
					"							II.WEIGHMENT_ID,\r\n" + 
					"							II.GRADE_ID,\r\n" + 
					"							II.RST,\r\n" + 
					"							WM.VID VEH_ID,\r\n" + 
					"							GD.MATERIAL,\r\n" + 
					"							GD.QUANTITY,\r\n" + 
					"							GD.GRADE,\r\n" + 
					"							GD.RATE,\r\n" + 
					"							GD.MOISTURE,\r\n" + 
					"                            gd.pdc_amount PDC_PER_GRADE,\r\n" + 
					"                            gd.pdc_date,\r\n" + 
					"                            gd.pdc_pay_mode,\r\n" + 
					"							GD.AUTHORIZED_BY,\r\n" + 
					"							GM.DESCRIPTION,\r\n" + 
					"							CV.WEIGH_RATE, \r\n" + 
					"							COMP.EMAIL COMP_EMAIL,\r\n" + 
					"                            CUST.BLACKLISTED,\r\n" + 
					"                            CUST.MEMBERSHIP\r\n" + 
					"					FROM\r\n" + 
					"							INVOICE_MAST IM,\r\n" + 
					"							COMPANY_MASTER COMP,\r\n" + 
					"							CUSTOMER_MAST CUST,\r\n" + 
					"							invoice_items II,\r\n" + 
					"							weigh_mast WM,\r\n" + 
					"							grade_details GD,\r\n" + 
					"							customer_vehicle_mast CV,\r\n" + 
					"							grade_master GM\r\n" + 
					"					WHERE \r\n" + 
					"							im.id = ii.invoice_id AND\r\n" + 
					"							im.company_id = comp.id AND\r\n" + 
					"							im.customer_id = cust.id AND\r\n" + 
					"							ii.grade_id = gd.id AND\r\n" + 
					"							gd.weighment_id = wm.id AND\r\n" + 
					"							GM.GRADE = gd.grade AND\r\n" + 
					"							wm.vid = cv.id AND\r\n" + 
					"							IM.INVOICE_NO=?"; 
				
			PreparedStatement stmt = con.prepareStatement(invSql, ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			
			stmt.setString(1, invoiceNo);
			
			rs = stmt.executeQuery();
			
			rs.first();
			
			jsonObj.put("invoiceId", rs.getInt(1));
			jsonObj.put("invoiceNo", rs.getString(2));
			jsonObj.put("totalAmount","Rs. "+ rs.getString(3));
			
			
			jsonObj.put("amountPaid", rs.getLong(4));
			jsonObj.put("amountPending", rs.getLong(5));
			jsonObj.put("invoiceDate", rs.getString(6));
			jsonObj.put("companyId", rs.getInt(7));
			jsonObj.put("customerId", rs.getInt(8));
			jsonObj.put("authorizer", rs.getString(9));
			jsonObj.put("note", rs.getString(10));
			jsonObj.put("totalQuantity", rs.getString(11));
			jsonObj.put("cashAmount", rs.getLong(12));
			jsonObj.put("chequeAmount", rs.getLong(13));
			jsonObj.put("rtgsAmount", rs.getLong(14));
			jsonObj.put("paidByOperator", rs.getInt(15));
			jsonObj.put("unloadingCharges", rs.getFloat(16));
			jsonObj.put("bonusAmount", rs.getFloat(17));
			
			String amountInWords = numToWords.convertToIndianCurrency(rs.getString(18));
			
			jsonObj.put("totalInWords", amountInWords);
			
			jsonObj.put("netAmount","Rs. "+ rs.getString(18));
			jsonObj.put("pdcAmount", rs.getString(19));
			jsonObj.put("companyName", rs.getString(20));
			jsonObj.put("companyAddress", rs.getString(21));
			jsonObj.put("companyTelephone", rs.getString(22));
			jsonObj.put("companyGst", rs.getString(23));
			jsonObj.put("companyState", rs.getString(24));
			jsonObj.put("vendorName", rs.getString(25));
			jsonObj.put("vendorAddress", rs.getString(26));
			jsonObj.put("vendorMobile", rs.getString(27));
			jsonObj.put("weighRate", rs.getLong(43));
			jsonObj.put("companyEmail", rs.getString(44));
			jsonObj.put("vendorBlacklisted", rs.getString(45));
			jsonObj.put("vendorMembership", rs.getString(46));
			JSONArray jsonArr = new JSONArray();
			
			rs.previous();
			while (rs.next()) {
				
				JSONObject invoiceItems = new JSONObject();
				
				invoiceItems.put("invoiceItemId", rs.getInt(28));
				invoiceItems.put("weighmentId", rs.getInt(29));
				invoiceItems.put("gradeId", rs.getInt(30));
				invoiceItems.put("rst", rs.getInt(31));
				invoiceItems.put("vehicleId", rs.getInt(32));
				invoiceItems.put("material", rs.getString(33));
				invoiceItems.put("quantity", rs.getLong(34));
				invoiceItems.put("grade", rs.getString(35));
				invoiceItems.put("rate", rs.getLong(36));
				invoiceItems.put("moisture", rs.getFloat(37));
				invoiceItems.put("pdcAmountPerGrade", rs.getFloat(38));
				if(rs.getFloat(38) == 0) {
					invoiceItems.put("pdcDate", "null");
				}else {
					String date = rs.getString(39);
					Date date1=new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").parse(date);
					SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
					String properDate = format2.format(date1);
					invoiceItems.put("pdcDate",properDate);
				}
				if(rs.getFloat(38) == 0) {
					invoiceItems.put("PdcPaymentMode", "null");
				}else {
					invoiceItems.put("PdcPaymentMode", rs.getString(40));
				}
				
				invoiceItems.put("gradeAuthorizer", rs.getString(41));
				invoiceItems.put("gradeDescription", rs.getString(42));
				
				double amount =  (rs.getLong(34)/100) * rs.getLong(34);
						
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
	
	public JSONArray pendingInvoicingReport() {
		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT DISTINCT GD.RST, CM.NAME,  WM.NET\r\n" + 
						"FROM GRADE_DETAILS GD, CUSTOMER_MAST CM, CUSTOMER_VEHICLE_MAST CVM, WEIGH_MAST WM\r\n" + 
						"WHERE \r\n" + 
						"NOT EXISTS \r\n" + 
						"(SELECT * \r\n" + 
						"FROM INVOICE_ITEMS IM \r\n" + 
						"WHERE GD.RST = IM.RST)\r\n" + 
						"AND\r\n" + 
						"WM.ID = GD.WEIGHMENT_ID AND\r\n" + 
						"WM.VID = CVM.ID AND\r\n" + 
						"CVM.CID = CM.ID AND\r\n" + 
						"WM.NET>0\r\n" + 
						"ORDER BY RST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("rst",rs.getInt(1));
				obj.put("vendorName",rs.getString(2));
				obj.put("netWeight",rs.getString(3));
				
				arr.put(obj);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public int getInvoicePaymentStatus(int invoiceId) {
		ResultSet rs = null;
		Connection con = null;
		int status = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT PAID_BY_OP FROM INVOICE_MAST WHERE ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, invoiceId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				status = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
