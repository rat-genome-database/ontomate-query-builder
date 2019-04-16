package edu.mcw.rgd.service;

import java.io.FileInputStream;
import java.net.URI;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Properties;


import edu.mcw.rgd.Utils.BasicUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.hadoop.hbase.util.Bytes;


import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import edu.mcw.rgd.controller.QueryFormController;
import edu.mcw.rgd.model.CuratableCondition;



public class HBaseService {
	/*private static final Logger logger = Logger
			.getLogger(QueryFormController.class);*/


	private static String HBASE_REST_SERVICE_HOST= "gray04.rgd.mcw.edu:8080";
	private static String HBASE_TABLE="articles";


	public static Properties getHbaseServiceProperties(){
		Properties props= new Properties();
		FileInputStream fis=null;
		try{
			fis=new FileInputStream("~/properties/hbaseService.properties");
			props.load(fis);
		}catch (Exception e){
			e.printStackTrace();
		}
		return props;
	}

	public static String getHbaseField(String Pmid, String column) {
		try {
			String hbaseKey = new StringBuilder(Pmid).reverse().toString();

			URI uri = new URI("http",HBASE_REST_SERVICE_HOST, "/"+HBASE_TABLE+"/"+hbaseKey+"/"+column, null, null);
			String hbaseQueryStr = uri.toASCIIString(); 
			String value = BasicUtils.restGet(hbaseQueryStr, null);
			return value;
		} catch (Exception e) {
		/*	logger.error("Error accessing PubMed HBase at "+HBASE_REST_SERVICE_HOST+"!!!");*/
			e.printStackTrace();
		}
		return null;
	}

	public static void setHbaseField(String Pmid, String column, String value) throws Exception {
		try {
			String hbaseKey = new StringBuilder(Pmid).reverse().toString();
			URI uri = new URI("http",HBASE_REST_SERVICE_HOST, "/"+HBASE_TABLE+"/"+hbaseKey+"/"+column, null, null);
			String xmlData = "<CellSet><Row key=\"" + Bytes.toString(Base64.encodeBase64(Bytes.toBytes(hbaseKey))) + "\"><Cell column=\""+Bytes.toString(Base64.encodeBase64(Bytes.toBytes(column)))+"\">" + Bytes.toString(Base64.encodeBase64(Bytes.toBytes(value)))+"</Cell></Row></CellSet>";

			String hbaseQueryStr = uri.toASCIIString();
			BasicUtils.restPut(hbaseQueryStr, "text/xml", xmlData);
		} catch (Exception e) {
		/*	logger.error("Error accessing PubMed HBase at gray04.rgd.mcw.edu:8080!!!");*/
			throw e;
		}
	}
	
	public static void logActionToHbase(CuratableCondition curCond, String column) {
		if (curCond.getUserKey() == null || curCond.getUserKey().length() == 0) return; 
		if (curCond.getUserKey().equals("0")) {
			String remoteAddress = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes())
				       .getRequest().getRemoteAddr();
			if (remoteAddress.equals("141.106.161.149")) return;
			curCond.setUserKey(remoteAddress);
		}

		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
		/*	setHbaseField(curCond.getPmId(), column, curCond.getUserKey() + "|" + curCond.getUserFullName() + "|" + dateFormat.format(cal.getTime()));*/
			return ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}
	public static void main(String[] args) throws Exception {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		setHbaseField("19176382", "c:z", "93|Jyothi Thota|");
		System.out.println("DONE!!");
	}

}
