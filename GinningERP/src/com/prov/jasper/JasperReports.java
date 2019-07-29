package com.prov.jasper;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JsonDataSource;

public class JasperReports {
	
	public JasperPrint compileAndPrint(InputStream sourceFile, JSONObject obj) {
		 JasperPrint jasperPrint =null;
		try {
			
			System.out.println("PrintObject ---- "+obj);
			
			JasperReport report = JasperCompileManager.compileReport(sourceFile);
	        
	        ByteArrayInputStream jsonDataStream = new ByteArrayInputStream(obj.toString().getBytes());
	       
	        //Create json datasource from json stream
	        JsonDataSource ds = new JsonDataSource(jsonDataStream);
	        
	        //Create HashMap to add report parameters
	        Map parameters = new HashMap();
	        
	        //Add title parameter. Make sure the key is same name as what you named the parameter in jasper report.
	        //Create Jasper Print object passing report, parameter json data source.
	        jasperPrint = JasperFillManager.fillReport(report, parameters, ds);
	        
			//JasperExportManager.exportReportToPdfFile(jasperPrint,dest);
			
			 //JasperPrintManager.printReport( jasperPrint, true);
	       
		} catch (JRException e) {
			e.printStackTrace();
		}
		  return jasperPrint;
	}
	
}
