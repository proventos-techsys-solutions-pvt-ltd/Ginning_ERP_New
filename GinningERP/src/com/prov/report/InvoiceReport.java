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
			
			String invSql = "SELECT * FROM INVOICE_MAST WHERE ID=?";
			
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
			
			String invSql = "SELECT DISTINCT\r\n" + 
					"    IM.ID,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.COMPANY_ID,\r\n" + 
					"    IM.CUSTOMER_ID,\r\n" + 
					"    IM.PENDING,\r\n" + 
					"    IM.TOTAL,\r\n" + 
					"    IM.NET_AMOUNT,\r\n" + 
					"    IM.AMOUNTPAID,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.ADDRESS,\r\n" + 
					"    CM.MOBILE,\r\n" + 
					"    II.RST\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST    IM,\r\n" + 
					"    CUSTOMER_MAST   CM,\r\n" + 
					"    INVOICE_ITEMS   II\r\n" + 
					"WHERE\r\n" + 
					"    IM.CUSTOMER_ID = CM.ID\r\n" + 
					"    AND II.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.PENDING <> 0\r\n" + 
					"ORDER BY\r\n" + 
					"    IM.INVOICE_NO DESC";
			
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
			
			String invSql = "SELECT DISTINCT\r\n" + 
					"    IM.ID,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.COMPANY_ID,\r\n" + 
					"    IM.CUSTOMER_ID,\r\n" + 
					"    IM.PENDING,\r\n" + 
					"    IM.TOTAL,\r\n" + 
					"    IM.NET_AMOUNT,\r\n" + 
					"    IM.AMOUNTPAID,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.ADDRESS,\r\n" + 
					"    CM.MOBILE,\r\n" + 
					"    II.RST\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST    IM,\r\n" + 
					"    CUSTOMER_MAST   CM,\r\n" + 
					"    INVOICE_ITEMS   II\r\n" + 
					"WHERE\r\n" + 
					"    IM.CUSTOMER_ID = CM.ID\r\n" + 
					"    AND II.INVOICE_ID = IM.ID\r\n" + 
					"ORDER BY\r\n" + 
					"    IM.INVOICE_NO DESC";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			int i = 0;
			
			while (rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("invoiceId", rs.getString(1));
				
				String date = rs.getString(2);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
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
			
			String invSql = "SELECT\r\n" + 
						"    IM.ID,\r\n" + 
						"    IM.INVOICE_NO,\r\n" + 
						"    IM.NET_AMOUNT,\r\n" + 
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
						"    IM.PDC_AMOUNT,\r\n" + 
						"    IM.PAID_BY_OP,\r\n" + 
						"    CM.NAME,\r\n" + 
						"    CM.ADDRESS,\r\n" + 
						"    CM.MOBILE,\r\n" + 
						"    PDC.ID       PDC_ID,\r\n" + 
						"    PDC.PAY_DATE,\r\n" + 
						"    PDC.AMOUNT   PDC_AMT,\r\n" + 
						"    PDC.MODE_OF_PAYMENT,\r\n" + 
						"    AN.ACCOUNT_ID\r\n" + 
						"FROM\r\n" + 
						"    INVOICE_MAST    IM\r\n" + 
						"    INNER JOIN CUSTOMER_MAST   CM ON IM.CUSTOMER_ID = CM.ID\r\n" + 
						"    LEFT JOIN PDC_MAST        PDC ON PDC.INVOICE_ID = IM.ID,\r\n" + 
						"    ACCOUNT_NAME AN\r\n" + 
						"WHERE\r\n" + 
						"    IM.INVOICE_NO = ?\r\n" + 
						"AND AN.COMPANY_ID = IM.COMPANY_ID \r\n" + 
						"AND AN.ACC_CATEGORY_ID = 6"; 
				
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setString(1, invoiceNo);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				jsonObj.put("invoiceId", rs.getString(1));
				jsonObj.put("invoiceNo", rs.getString(2));
				jsonObj.put("totalAmount", rs.getString(3));
				jsonObj.put("amountPaid", rs.getString(4));
				jsonObj.put("pendingAmount", rs.getString(5));
				
				String date = rs.getString(6);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String properDate = format2.format(date1);
				jsonObj.put("invoiceDate", properDate);
				
				jsonObj.put("companyId", rs.getString(7));
				jsonObj.put("customerId", rs.getString(8));
				jsonObj.put("authorizer", rs.getString(9));
				jsonObj.put("invoiceNote", rs.getString(10));
				jsonObj.put("totalQuantity", rs.getString(11));
				jsonObj.put("cashAmount", rs.getString(12));
				jsonObj.put("chequeAmount", rs.getString(13));
				jsonObj.put("rtgsAmount", rs.getString(14));
				jsonObj.put("pdcAmount", rs.getString(15));
				jsonObj.put("paidByOperator", rs.getString(16));
				jsonObj.put("customerName", rs.getString(17));
				jsonObj.put("customerAddress", rs.getString(18));
				jsonObj.put("customerMobile", rs.getString(19));
				jsonObj.put("pdcId", rs.getString(20));
				String pdcDate = rs.getString(21);
				jsonObj.put("accountPayableId", rs.getString("ACCOUNT_ID"));
				if(pdcDate!=null) {
					Date date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(pdcDate);
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String properPdcDate = format.format(date2);
					jsonObj.put("pdcPayDate", properPdcDate);
					jsonObj.put("pdcAmount", rs.getString(22));
					jsonObj.put("pdcPaymentMode", rs.getString(23));
				}
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
        double invoicedQty = 0;
        String qty;
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    IM.ID            INV_ID,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.TOTAL         TOTAL_AMOUNT,\r\n" + 
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
					"    COMP.NAME        COMP_NAME,\r\n" + 
					"    COMP.ADDRESS     COMP_ADDR,\r\n" + 
					"    COMP.TELEPHONE   COMP_TEL,\r\n" + 
					"    COMP.GST,\r\n" + 
					"    COMP.STATE       COMP_STATE,\r\n" + 
					"    CUST.NAME        CUST_NAME,\r\n" + 
					"    CUST.ADDRESS     CUST_ADDR,\r\n" + 
					"    CUST.MOBILE      CUST_MOB,\r\n" + 
					"    II.ID            INV_ITEM_ID,\r\n" + 
					"    II.WEIGHMENT_ID,\r\n" + 
					"    II.GRADE_ID,\r\n" + 
					"    II.RST,\r\n" + 
					"    WM.VID           VEH_ID,\r\n" + 
					"    GD.MATERIAL,\r\n" + 
					"    GD.QUANTITY,\r\n" + 
					"    GD.GRADE,\r\n" + 
					"    GD.RATE,\r\n" + 
					"    GD.MOISTURE,\r\n" + 
					"    GD.AUTHORIZED_BY,\r\n" + 
					"    GM.DESCRIPTION,\r\n" + 
					"    CV.WEIGH_RATE,\r\n" + 
					"    COMP.EMAIL       COMP_EMAIL,\r\n" + 
					"    PDC.PAY_DATE,\r\n" + 
					"    PDC.MODE_OF_PAYMENT,\r\n" + 
					"    IM.ADVANCE,\r\n" + 
					"    II.QUANTITY      INVOICED_QTY,\r\n" + 
					"    II.RATE          INVOICE_RATE,\r\n" + 
					"    PDC.CHEQUE_ID    PDC_CHEQUE_ID,\r\n" + 
					"    PD.CHEQUE_ID     CHEQUE_ID,\r\n" + 
					"    PDR.PAY_DATE     RTGS_DATE,\r\n" + 
					"    CV.VEHICLE_NO\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST            IM\r\n" + 
					"    LEFT OUTER JOIN PDC_MAST                PDC ON PDC.INVOICE_ID = IM.ID\r\n" + 
					"    LEFT OUTER JOIN PAYMENT_DETAILS         PD ON PD.INVOICE_ID = IM.ID\r\n" + 
					"                                          AND PD.MODE_ID = 2\r\n" + 
					"    LEFT OUTER JOIN PAYMENT_DETAILS         PDR ON PDR.INVOICE_ID = IM.ID\r\n" + 
					"                                           AND PDR.MODE_ID = 3,\r\n" + 
					"    COMPANY_MASTER          COMP,\r\n" + 
					"    CUSTOMER_MAST           CUST,\r\n" + 
					"    INVOICE_ITEMS           II,\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    GRADE_DETAILS           GD,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CV,\r\n" + 
					"    GRADE_MASTER            GM\r\n" + 
					"WHERE\r\n" + 
					"    IM.ID = II.INVOICE_ID\r\n" + 
					"    AND IM.COMPANY_ID = COMP.ID\r\n" + 
					"    AND IM.CUSTOMER_ID = CUST.ID\r\n" + 
					"    AND II.GRADE_ID = GD.ID\r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID\r\n" + 
					"    AND GM.GRADE = GD.GRADE\r\n" + 
					"    AND WM.VID = CV.ID\r\n" + 
					"    AND IM.ID = ?"; 
				
			PreparedStatement stmt = con.prepareStatement(invSql, ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			
			stmt.setInt(1, invoiceId);
			SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy");
			rs = stmt.executeQuery();
			
			rs.first();
			
			jsonObj.put("invoiceId", rs.getInt(1));
			jsonObj.put("invoiceNo", rs.getString(2));
			jsonObj.put("totalAmount","Rs. "+ rs.getString(3)+" /-");
			
			
			jsonObj.put("amountPaid", rs.getLong(4));
			jsonObj.put("amountPending", rs.getLong(5));
			
			Date date2=new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").parse(rs.getString(6));
			String properDateInv = format2.format(date2);
			
			jsonObj.put("invoiceDate", properDateInv);
			jsonObj.put("companyId", rs.getInt(7));
			jsonObj.put("customerId", rs.getInt(8));
			jsonObj.put("authorizer", rs.getString(9));
			jsonObj.put("note", rs.getString(10));
			qty = rs.getString(11);
			jsonObj.put("totalQuantity", qty);
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
			jsonObj.put("advance", rs.getString(44));
			jsonObj.put("vehicleNo", rs.getString("VEHICLE_NO"));
			jsonObj.put("pdcId", rs.getString("PDC_CHEQUE_ID"));
			jsonObj.put("chequeId", rs.getString("CHEQUE_ID"));
			if(rs.getString("RTGS_DATE") != null) {
				Date date3=new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").parse(rs.getString("RTGS_DATE"));
				String properDate1 = format2.format(date3);
				jsonObj.put("rtgsDate", properDate1);
			}
			if(rs.getString(42) != null) {
				Date date1=new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").parse(rs.getString(42));
				String properDate = format2.format(date1);
				jsonObj.put("pdcDate",properDate);
			}else {
				jsonObj.put("pdcDate","NA");
			}
			if(rs.getString(43) != null) {
				int num = Integer.parseInt(rs.getString(43));
				if(num == 1) {
					jsonObj.put("pdcMode", "Cash");
				}else if(num == 2) {
					jsonObj.put("pdcMode", "Cheque");
				}else if(num == 3) {
					jsonObj.put("pdcMode", "RTGS");
				}
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
				invoiceItems.put("invoicedQty", rs.getString(45));
				invoiceItems.put("invoiceRate", rs.getString(46));
				
				double amount =  (invoiceItems.getDouble("invoicedQty")/100) * invoiceItems.getDouble("invoiceRate");
				invoiceItems.put("amount", amount);
				jsonArr.put(invoiceItems);
				
				invoicedQty = invoicedQty + rs.getDouble(45);
			}
			
			jsonObj.put("amanatQty", (Float.parseFloat(qty) - invoicedQty));
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
			
			String invSql = "SELECT\r\n" + 
					"    IM.ID,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.COMPANY_ID,\r\n" + 
					"    IM.CUSTOMER_ID,\r\n" + 
					"    IM.PENDING,\r\n" + 
					"    IM.TOTAL,\r\n" + 
					"    IM.NET_AMOUNT,\r\n" + 
					"    IM.AMOUNTPAID,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.ADDRESS,\r\n" + 
					"    CM.MOBILE\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST    IM,\r\n" + 
					"    CUSTOMER_MAST   CM\r\n" + 
					"WHERE\r\n" + 
					"    IM.CUSTOMER_ID = CM.ID\r\n" + 
					"    AND IM.INV_DATE = TRUNC(SYSDATE)\r\n" + 
					"    AND IM.PENDING > 0\r\n" + 
					"ORDER BY IM.INVOICE_NO DESC";
			
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
			
			String invSql = "SELECT  \r\n" + 
					"    IM.ID            INV_ID,  \r\n" + 
					"    IM.INVOICE_NO,  \r\n" + 
					"    IM.TOTAL         TOTAL_AMOUNT,  \r\n" + 
					"    IM.AMOUNTPAID,  \r\n" + 
					"    IM.PENDING,  \r\n" + 
					"    IM.INV_DATE,  \r\n" + 
					"    IM.COMPANY_ID,  \r\n" + 
					"    IM.CUSTOMER_ID,  \r\n" + 
					"    IM.AUTHORIZER,  \r\n" + 
					"    IM.NOTE,  \r\n" + 
					"    IM.TOTAL_QUANTITY,  \r\n" + 
					"    IM.CASH_AMOUNT,  \r\n" + 
					"    IM.CHEQUE_AMOUNT,  \r\n" + 
					"    IM.RTGS_AMOUNT,  \r\n" + 
					"    IM.PAID_BY_OP,  \r\n" + 
					"    IM.UNLOADING_CHARGES,  \r\n" + 
					"    IM.BONUS,  \r\n" + 
					"    IM.NET_AMOUNT,  \r\n" + 
					"    IM.PDC_AMOUNT,  \r\n" + 
					"    COMP.NAME        COMP_NAME,  \r\n" + 
					"    COMP.ADDRESS     COMP_ADDR,  \r\n" + 
					"    COMP.TELEPHONE   COMP_TEL,  \r\n" + 
					"    COMP.GST,  \r\n" + 
					"    COMP.STATE       COMP_STATE,  \r\n" + 
					"    CUST.NAME        CUST_NAME,  \r\n" + 
					"    CUST.ADDRESS     CUST_ADDR,  \r\n" + 
					"    CUST.MOBILE      CUST_MOB,  \r\n" + 
					"    II.ID            INV_ITEM_ID,  \r\n" + 
					"    II.WEIGHMENT_ID,  \r\n" + 
					"    II.GRADE_ID,  \r\n" + 
					"    II.RST,  \r\n" + 
					"    WM.VID           VEH_ID,  \r\n" + 
					"    GD.MATERIAL,  \r\n" + 
					"    GD.QUANTITY,  \r\n" + 
					"    GD.GRADE,  \r\n" + 
					"    GD.RATE,  \r\n" + 
					"    GD.MOISTURE,  \r\n" + 
					"    GD.PDC_AMOUNT    PDC_PER_GRADE,  \r\n" + 
					"    GD.PDC_DATE,  \r\n" + 
					"    GD.PDC_PAY_MODE,  \r\n" + 
					"    GD.AUTHORIZED_BY,  \r\n" + 
					"    GM.DESCRIPTION,  \r\n" + 
					"    CV.WEIGH_RATE,  \r\n" + 
					"    COMP.EMAIL       COMP_EMAIL,  \r\n" + 
					"    CUST.BLACKLISTED,  \r\n" + 
					"    CUST.MEMBERSHIP,  \r\n" + 
					"    IM.ADVANCE,  \r\n" + 
					"    NVL(AM.INVOICED_QTY, 0) AM_INVOICED_QTY, \r\n" + 
					"    NVL(AM.FINAL_RATE, 0) FINAL_RATE,\r\n" + 
					"    ii.quantity INVOICED_QTY,\r\n" + 
					"    ii.rate invoice_rate\r\n" + 
					"FROM  \r\n" + 
					"    INVOICE_MAST            IM,  \r\n" + 
					"    COMPANY_MASTER          COMP,  \r\n" + 
					"    CUSTOMER_MAST           CUST,  \r\n" + 
					"    INVOICE_ITEMS           II,  \r\n" + 
					"    WEIGH_MAST              WM, GRADE_DETAILS           GD  \r\n" + 
					"    LEFT OUTER JOIN AMANAT_MAST             AM ON GD.ID = AM.GRADE_ID,  \r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CV,  \r\n" + 
					"    GRADE_MASTER            GM  \r\n" + 
					"WHERE  \r\n" + 
					"    IM.ID = II.INVOICE_ID  \r\n" + 
					"    AND IM.COMPANY_ID = COMP.ID  \r\n" + 
					"    AND IM.CUSTOMER_ID = CUST.ID  \r\n" + 
					"    AND II.GRADE_ID = GD.ID  \r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID  \r\n" + 
					"    AND GM.GRADE = GD.GRADE  \r\n" + 
					"    AND WM.VID = CV.ID  \r\n" + 
					"    AND IM.INVOICE_NO = ?"; 
				
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
			jsonObj.put("advance", rs.getString(47));
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
				invoiceItems.put("invoicedQtyAm", rs.getString(48));
				invoiceItems.put("finalRateAm", rs.getString(49));
				invoiceItems.put("invoicedQty", rs.getString(50));
				invoiceItems.put("finalRate", rs.getString(51));
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
			
			String sql = "SELECT \r\n" + 
					"    GD.RST, \r\n" + 
					"    CM.NAME, \r\n" + 
					"    SUM(GD.QUANTITY) \r\n" + 
					"FROM \r\n" + 
					"    GRADE_DETAILS           GD, \r\n" + 
					"    CUSTOMER_MAST           CM, \r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM, \r\n" + 
					"    WEIGH_MAST              WM \r\n" + 
					"WHERE \r\n" + 
					"    NOT EXISTS ( \r\n" + 
					"        SELECT \r\n" + 
					"            * \r\n" + 
					"        FROM \r\n" + 
					"            INVOICE_ITEMS IM \r\n" + 
					"        WHERE \r\n" + 
					"            GD.ID = IM.GRADE_ID \r\n" + 
					"    ) \r\n" + 
					"        AND NOT EXISTS ( \r\n" + 
					"        SELECT \r\n" + 
					"            * \r\n" + 
					"        FROM \r\n" + 
					"            AMANAT_MAST AM \r\n" + 
					"        WHERE \r\n" + 
					"            GD.ID = AM.GRADE_ID \r\n" + 
					"    ) \r\n" + 
					"        AND WM.ID = GD.WEIGHMENT_ID \r\n" + 
					"        AND WM.VID = CVM.ID \r\n" + 
					"        AND CVM.CID = CM.ID \r\n" + 
					"GROUP BY \r\n" + 
					"    GD.RST, \r\n" + 
					"    CM.NAME \r\n" + 
					"ORDER BY \r\n" + 
					"    RST DESC";
			
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
	
	public int getInvoicePaymentStatus(String invoiceNo) {
		ResultSet rs = null;
		Connection con = null;
		int status = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT PAID_BY_OP FROM INVOICE_MAST WHERE INVOICE_NO = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, invoiceNo);
			
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
	
	public JSONObject getInvoicePaymentDetails(String invoiceNo) {
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    CASH_AMOUNT,\r\n" + 
					"    CHEQUE_AMOUNT,\r\n" + 
					"    RTGS_AMOUNT,\r\n" + 
					"    PDC_AMOUNT\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST\r\n" + 
					"WHERE\r\n" + 
					"    INVOICE_NO = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, invoiceNo);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				obj.put("cashAmount", rs.getString(1));
				obj.put("chequeAmount", rs.getString(2));
				obj.put("rtgsAmount", rs.getString(3));
				obj.put("pdpAmount", rs.getString(4));
				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	public JSONObject getInvoiceBasicDetails(String invoiceNo) {
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    IM.ID,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    IM.COMPANY_ID,\r\n" + 
					"    IM.CUSTOMER_ID,\r\n" + 
					"    IM.AUTHORIZER,\r\n" + 
					"    IM.NOTE,\r\n" + 
					"    IM.TOTAL_QUANTITY,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    CM.ADDRESS,\r\n" + 
					"    CM.MOBILE,\r\n" + 
					"    AN.ACCOUNT_ID,\r\n" + 
					"    IM.NET_AMOUNT\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST    IM,\r\n" + 
					"    CUSTOMER_MAST   CM,\r\n" + 
					"    ACCOUNT_NAME    AN\r\n" + 
					"WHERE\r\n" + 
					"    IM.INVOICE_NO = ?\r\n" + 
					"    AND IM.CUSTOMER_ID = CM.ID\r\n" + 
					"    AND AN.COMPANY_ID = IM.COMPANY_ID\r\n" + 
					"    AND AN.ACC_CATEGORY_ID = 6";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, invoiceNo);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				obj.put("id", rs.getString(1));
				obj.put("invoiceNo", rs.getString(2));
				
				String date = rs.getString(3);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String properDate = format2.format(date1);
				
				obj.put("invoiceDate", properDate);
				obj.put("companyId", rs.getString(4));
				obj.put("customerId", rs.getString(5));
				obj.put("authorizer", rs.getString(6));
				obj.put("note", rs.getString(7));
				obj.put("totalQuantity", rs.getString(8));
				obj.put("customerName", rs.getString(9));
				obj.put("customerAddress", rs.getString(10));
				obj.put("customerMobile", rs.getString(11));
				obj.put("accountPayableId", rs.getString(12));
				obj.put("totalAmount", rs.getString(13));
				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	public JSONArray pendingInvoiceReport() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray report = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    IM.ID,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    II.RST,\r\n" + 
					"    NVL(SUM(AMT.AMOUNT), 0) PENDING_AMOUNT\r\n" + 
					"FROM\r\n" + 
					"    (\r\n" + 
					"        SELECT\r\n" + 
					"            PD.AMOUNT,\r\n" + 
					"            PD.INVOICE_ID\r\n" + 
					"        FROM\r\n" + 
					"            PAYMENT_DETAILS PD\r\n" + 
					"        WHERE\r\n" + 
					"            PD.PAY_STATUS = 0\r\n" + 
					"        UNION\r\n" + 
					"        SELECT\r\n" + 
					"            PDC.AMOUNT AS AMOUNT,\r\n" + 
					"            PDC.INVOICE_ID\r\n" + 
					"        FROM\r\n" + 
					"            PDC_MAST PDC\r\n" + 
					"        WHERE\r\n" + 
					"            PDC.PAY_STATUS = 0\r\n" + 
					"    ) AMT,\r\n" + 
					"    INVOICE_MAST    IM,\r\n" + 
					"    CUSTOMER_MAST   CM,\r\n" + 
					"    (\r\n" + 
					"       SELECT\r\n" + 
					"            IT.RST,\r\n" + 
					"            IT.INVOICE_ID,\r\n" + 
					"            COUNT(*)\r\n" + 
					"        FROM\r\n" + 
					"            INVOICE_ITEMS IT\r\n" + 
					"        GROUP BY\r\n" + 
					"            IT.RST,\r\n" + 
					"            IT.INVOICE_ID\r\n" + 
					"    ) II\r\n" + 
					"WHERE\r\n" + 
					"    AMT.INVOICE_ID = IM.ID\r\n" + 
					"    AND CM.ID = IM.CUSTOMER_ID\r\n" + 
					"    AND II.INVOICE_ID = AMT.INVOICE_ID\r\n" + 
					"GROUP BY\r\n" + 
					"    IM.ID,\r\n" + 
					"    IM.INVOICE_NO,\r\n" + 
					"    IM.INV_DATE,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    II.RST\r\n" + 
					"ORDER BY\r\n" + 
					"    IM.ID DESC";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			int i = 0;
			
			while (rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("invoiceId", rs.getString(1));
				jsonObj.put("invoiceNo", rs.getString(2));
				
				String date = rs.getString(3);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				jsonObj.put("invoiceDate", properDate);
				jsonObj.put("customerName", rs.getString(4));
				jsonObj.put("pendingAmount", rs.getLong(6));				
				jsonObj.put("rst", rs.getString(5));
				if(report.length() != 0) {
					if(report.getJSONObject(i).getString("invoiceNo").equals(jsonObj.getString("invoiceNo"))){
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
	
	public JSONArray invoiceReportToExcel(String startDate, String endDate) {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray report = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT  \r\n" + 
					"    IM.ID,  \r\n" + 
					"    IM.INVOICE_NO,  \r\n" + 
					"    IM.TOTAL       TOTAL_AMOUNT,  \r\n" + 
					"    IM.INV_DATE,  \r\n" + 
					"    IM.NOTE,  \r\n" + 
					"    IM.TOTAL_QUANTITY,  \r\n" + 
					"    IM.UNLOADING_CHARGES,  \r\n" + 
					"    IM.BONUS,  \r\n" + 
					"    IM.ADVANCE,  \r\n" + 
					"    IM.PDC_AMOUNT,  \r\n" + 
					"    COMP.NAME      COMP_NAME,  \r\n" + 
					"    CUST.NAME      CUST_NAME,  \r\n" + 
					"    CUST.ADDRESS   CUST_ADDR,  \r\n" + 
					"    CUST.MOBILE    CUST_MOB,  \r\n" + 
					"    II.RST,  \r\n" + 
					"    GD.QUANTITY,  \r\n" + 
					"    GD.GRADE,  \r\n" + 
					"    GD.RATE,  \r\n" + 
					"    CV.WEIGH_RATE,  \r\n" + 
					"    CV.VEHICLE_NO,  \r\n" + 
					"    WRM.VEHICLE_NAME,\r\n" + 
					"    ii.quantity invoiced_qty,\r\n" + 
					"    ii.rate invoiced_rate\r\n" + 
					"FROM  \r\n" + 
					"    INVOICE_MAST            IM,  \r\n" + 
					"    COMPANY_MASTER          COMP,  \r\n" + 
					"    CUSTOMER_MAST           CUST,  \r\n" + 
					"    INVOICE_ITEMS           II,  \r\n" + 
					"    WEIGH_MAST              WM,  \r\n" + 
					"    GRADE_DETAILS           GD,  \r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CV,  \r\n" + 
					"    GRADE_MASTER            GM,  \r\n" + 
					"    WEIGH_RATE_MAST         WRM  \r\n" + 
					"WHERE  \r\n" + 
					"    IM.ID = II.INVOICE_ID  \r\n" + 
					"    AND IM.COMPANY_ID = COMP.ID  \r\n" + 
					"    AND IM.CUSTOMER_ID = CUST.ID  \r\n" + 
					"    AND II.GRADE_ID = GD.ID  \r\n" + 
					"    AND GD.WEIGHMENT_ID = WM.ID  \r\n" + 
					"    AND GM.GRADE = GD.GRADE  \r\n" + 
					"    AND WM.VID = CV.ID  \r\n" + 
					"    AND CV.V_TYPE_ID = WRM.ID  \r\n" + 
					"    AND IM.INV_DATE BETWEEN ? AND ? \r\n" + 
					"ORDER BY \r\n" + 
					"    IM.INV_DATE DESC";
			
			java.sql.Date startDateSql = java.sql.Date.valueOf(startDate);
			java.sql.Date endDateSql = java.sql.Date.valueOf(endDate);
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setDate(1, startDateSql);
			stmt.setDate(2, endDateSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("invoiceId", rs.getString(1));
				jsonObj.put("invoiceNo", rs.getString(2));
				jsonObj.put("totalAmount", rs.getString(3));
				
				String date = rs.getString(4);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				jsonObj.put("invoiceDate", properDate);
				
				jsonObj.put("note", rs.getString(5));
				jsonObj.put("totalQty", rs.getString(6));
				jsonObj.put("unloadingCharges", rs.getString(7));
				jsonObj.put("bonus", rs.getString(8));
				jsonObj.put("advance", rs.getString(9));
				jsonObj.put("pdcAmount", rs.getString(10));
				jsonObj.put("companyName", rs.getString(11));
				jsonObj.put("customerName", rs.getString(12));
				jsonObj.put("customerAddress", rs.getString(13));
				jsonObj.put("customerMobile", rs.getString(14));
				jsonObj.put("rst", rs.getString(15));
				jsonObj.put("quantity", rs.getString(16));
				jsonObj.put("grade", rs.getString(17));
				jsonObj.put("rate", rs.getString(18));
				jsonObj.put("weighRate", rs.getString(19));
				jsonObj.put("vehicleNo", rs.getString(20));
				jsonObj.put("vehicleName", rs.getString(21));
				jsonObj.put("invoicedQty", rs.getString(22));
				jsonObj.put("invoiceRate", rs.getString(23));
				
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