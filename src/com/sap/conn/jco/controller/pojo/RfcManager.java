package com.sap.conn.jco.controller.pojo;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.junit.Test;

import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.ext.Environment;

public final class RfcManager {

	 private static Logger logger = Logger.getLogger(RfcManager.class);

	    private static String ABAP_AS_POOLED = "ABAP_AS_WITH_POOL";

	    private static JCOProvider provider = null;

	    private static JCoDestination destination = null;

	    static {
	        Properties properties = loadProperties();

	        provider = new JCOProvider();

	        // catch IllegalStateException if an instance is already registered
	        try {
	            Environment.registerDestinationDataProvider(provider);
	        } catch (IllegalStateException e) {
	            logger.debug(e);
	        }

	        provider.changePropertiesForABAP_AS(ABAP_AS_POOLED, properties);
	    }

	    public static Properties loadProperties() {
	        RfcManager manager = new RfcManager();
	        Properties prop = new Properties();
	        try {
	            prop.load(manager.getClass().getResourceAsStream(
	                    "/sap_conf.properties"));
	        } catch (IOException e) {
	            logger.debug(e);
	        }
	        return prop;
	    }

	    public static JCoDestination getDestination() throws JCoException {
	        if (destination == null) {
	            destination = JCoDestinationManager.getDestination(ABAP_AS_POOLED);
	        }
	        return destination;
	    }

	    public static JCoFunction getFunction(String functionName) {
	        JCoFunction function = null;
	        try {
	            function = getDestination().getRepository()
	                    .getFunctionTemplate(functionName).getFunction();
	        } catch (JCoException e) {
	            logger.error("1111"+e);
	        } catch (NullPointerException e) {
	            logger.error(e);
	        }
	        return function;
	    }

	    public static void execute(JCoFunction function) {
	        logger.debug("SAP Function Name : " + function.getName());
	        JCoParameterList paramList = function.getImportParameterList();

	        if (paramList != null) {
	            logger.debug("Function Import Structure : " + paramList.toString());
	        }

	        try {
	            function.execute(getDestination());
	        } catch (JCoException e) {
	            logger.error("2222"+e);
	        }
	        paramList = function.getExportParameterList();

	        if (paramList != null) {
	            logger.debug("Function Export Structure : " + paramList.toString());
	        }
	    }

	    /*
	     * SAP Ping
	     */
	    @Test
	    public static String ping() {
	        String msg = null;
	        try {
	            getDestination().ping();
	            msg = "Destination " + ABAP_AS_POOLED + " is ok";
	        } catch (JCoException ex) {
	        	msg = "6666666"+ex.getMessage();
	           
	        }
	        logger.debug(msg);
	        return msg;
	    }

	    public static void main(String[] args) {
	        //RfcManager.ping();
	    	callRfcExample();
	    }
	    
	    
	    //call rfc
	    public static void callRfcExample() {
	        // 获取RFC 对象
	        JCoFunction function = RfcManager.getFunction("ZMOBILE_LOGIN");
	        // 设置import 参数
	        JCoParameterList importParam = function.getImportParameterList();
	        importParam.setValue("USER", "zabap00");
	        importParam.setValue("PASSWORD", "123456");
	        // 执行RFC
	        RfcManager.execute(function);

	        // 获取RFC返回的字段值
	        JCoParameterList exportParam = function.getExportParameterList();
	        String exParamA = exportParam.getString("EV_FLAG");
	        String exParamB = exportParam.getString("EV_MESSAGE");
	        System.out.println("-------------------返回的A："+exParamA);
	        System.out.println("-------------------返回的B："+exParamB);
	        // 遍历RFC返回的表对象
	        JCoTable tb = function.getTableParameterList().getTable("table_name");
	        for (int i = 0; i < tb.getNumRows(); i++) {
	            tb.setRow(i);
	            System.out.println("循环返回01："+tb.getString("field01"));
	            System.out.println("循环返回02："+tb.getString("field02"));
	        }
	    }
	    
	
}
