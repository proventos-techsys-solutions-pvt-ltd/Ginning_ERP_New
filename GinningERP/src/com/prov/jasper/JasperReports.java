package com.prov.jasper;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.json.JSONObject;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JsonDataSource;

public class JasperReports {
	
	public JasperPrint compileAndPrint(String sourceFile, JSONObject obj) {
		 JasperPrint jasperPrint =null;
		try {
			
	    	InputStream input = new FileInputStream(new File(sourceFile));

			//Generating the report.
			JasperReport jasperReport = JasperCompileManager.compileReport(input);
			
			ByteArrayInputStream jsonDataStream = new ByteArrayInputStream(obj.toString().getBytes());
		       
		    JsonDataSource ds = new JsonDataSource(jsonDataStream);
		        
			jasperPrint = JasperFillManager.fillReport(jasperReport, null, ds);
	       
		} catch (JRException e) {
			e.printStackTrace();
		}
		 catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		  return jasperPrint;
	}
	
}
