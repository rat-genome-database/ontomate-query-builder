package edu.mcw.rgd.Utils;

import edu.mcw.rgd.database.ncbi.pubmed.DocDBConnection;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by jthota on 1/24/2019.
 */
public class BasicUtils {
    public static String strExceptionStackTrace(Exception e) {
        StringWriter writer = new StringWriter();
        e.printStackTrace(new PrintWriter(writer));
        return writer.toString();
    }

    public static String getUTFstr(String input_str) {
        byte[] input_bytes = input_str.getBytes();
        try {
            String output_str = new String(input_bytes, "UTF-8");
            return output_str;
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

    public static String EscapeSQLStringValue(String input_value) {
        if (input_value != null) {
            return "'" + DocDBConnection.escapeSQL(input_value) + "'";
        } else {
            return "null";
        }
    }

    public static String EscapeSQLStringValueEmpty(String input_value) {
        if (input_value != null) {
            return "'" + DocDBConnection.escapeSQL(input_value) + "'";
        } else {
            return "";
        }
    }

    public static String restGet(String url, String contentType) throws Exception {
        try {
            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpGet getRequest = new HttpGet(url);
            if (contentType != null) getRequest.addHeader("accept", contentType);

            HttpResponse response = httpClient.execute(getRequest);

            if (response.getStatusLine().getStatusCode() != 200) {
                if (response.getStatusLine().getStatusCode() == 404) return "";
                throw new RuntimeException("Failed : HTTP error code : "
                        + response.getStatusLine().getStatusCode());
            }

            BufferedReader br = new BufferedReader(
                    new InputStreamReader((response.getEntity().getContent())));

            String outputLine = "", output = "";
            while ((outputLine = br.readLine()) != null) {
                output += outputLine;
            }

            httpClient.getConnectionManager().shutdown();
            return output;

        } catch (ClientProtocolException e) {

            throw e;

        } catch (IOException e) {

            throw e;
        }
    }
    public static List<String> restGet1(String url, String contentType) throws Exception {
        try {
            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpGet getRequest = new HttpGet(url);
            if (contentType != null) getRequest.addHeader("accept", contentType);
            List<String> outputs= new ArrayList<>();
            HttpResponse response = httpClient.execute(getRequest);

            if (response.getStatusLine().getStatusCode() != 200) {
                if (response.getStatusLine().getStatusCode() == 404) return outputs;
                throw new RuntimeException("Failed : HTTP error code : "
                        + response.getStatusLine().getStatusCode());
            }

            BufferedReader br = new BufferedReader(
                    new InputStreamReader((response.getEntity().getContent())));

            String outputLine = "", output = "";
            while ((outputLine = br.readLine()) != null) {
                outputs.add(outputLine.trim());
            }

            httpClient.getConnectionManager().shutdown();
            return outputs;

        } catch (ClientProtocolException e) {

            throw e;

        } catch (IOException e) {

            throw e;
        }
    }
    public static String restGet(String url) throws Exception {
        try {
            return restGet(url, "application/json");
        } catch (Exception e) {
            throw e;
        }
    }

    public static String restPut(String url, String contentType, String params) throws Exception {
        try {
            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpPut putRequest = new HttpPut(url);
            if (contentType != null) putRequest.addHeader("Content-Type", contentType);

            ByteArrayEntity requestEntity = new ByteArrayEntity(Bytes.toBytes(params));
            putRequest.setEntity(requestEntity);
            HttpResponse response = httpClient.execute(putRequest);

            if (response.getStatusLine().getStatusCode() != 200) {
                if (response.getStatusLine().getStatusCode() == 404) return "";
                throw new RuntimeException("Failed : HTTP error code : "
                        + response.getStatusLine().getStatusCode());
            }

            httpClient.getConnectionManager().shutdown();
            return "";

        } catch (ClientProtocolException e) {

            throw e;

        } catch (IOException e) {

            throw e;
        }
    }

    public static String getNCBIQueryPara(String queryString, String paraName) {
        Pattern p = Pattern.compile("(" + paraName + "|" + paraName.toLowerCase() +
                ")=(.+?) [a-zA-Z]+?=");
        Matcher m = p.matcher(queryString);
        if (m.find()) return m.group(2);
        return "";
    }

    public static String removeComments(String inputStr) {
        String returnStr = inputStr.replaceAll("(?ms)/\\*.+?\\*/", "");
        returnStr = returnStr.replaceAll("(?ms)^\\s*//.+?$", "");
        return returnStr;
    }

    public static String removeEmptyLines(String inputStr) {
        String returnStr = inputStr.replaceAll("(?ms)^\\s*", "");
        return returnStr;
    }

}
