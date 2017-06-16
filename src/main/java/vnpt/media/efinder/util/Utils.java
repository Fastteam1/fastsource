/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.util;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.ResponseInfo;

/**
 *
 * @author vnpt2
 */
public class Utils {

    // Thông tin hang
    public static List<CustomerInfo> getCustomerListInSession(HttpServletRequest request) {
        // Thông tin khach hang
        List<CustomerInfo> listCustomers = (List<CustomerInfo>) request.getSession().getAttribute("customerInfo");
        // Tao moi thogn tin khach hang
        if (listCustomers == null) {
            listCustomers = new ArrayList<>();
            // Và lưu vào trong session.
            request.getSession().setAttribute("customerInfo", listCustomers);
        }

        return listCustomers;
    }

    public static void removeCustomerListInSession(HttpServletRequest request) {
        request.getSession().removeAttribute("customerInfo");
    }

    public static String readUrlGET(String urlString) {
        InputStreamReader isr = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(urlString);
            isr = new InputStreamReader(url.openStream(),
                    "UTF-8");
            reader = new BufferedReader(isr);
            StringBuffer buffer = new StringBuffer();
            int read;
            char[] chars = new char[1024];
            while ((read = reader.read(chars)) != -1) {
                buffer.append(chars, 0, read);
            }
            return buffer.toString();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
                if (isr != null) {
                    isr.close();
                }
            } catch (Exception e) {
            }
        }
    }

    public static <T> List<T> stringToArray(String s, Class<T[]> clazz) {
        JsonObject root = new Gson().fromJson(s, JsonObject.class);
        JsonElement data = root.get("data");
        T[] arr = new Gson().fromJson(data.toString(), clazz);
        return Arrays.asList(arr);
    }

    public static ResponseInfo stringToObjectResponse(String s) {
        Gson gson = new Gson();
        JsonObject root = gson.fromJson(s, JsonObject.class);
        String errorCode = root.get("errorCode").toString();
        String message = root.get("message").toString();
        JsonElement data = root.get("data");

        ResponseInfo responseInfo = new ResponseInfo();
        responseInfo.setData(data.toString());
        responseInfo.setErrorCode(errorCode);
        responseInfo.setMessage(message);
        return responseInfo;
    }

    public static String readUrl(String url) {
        try {
            String key = "eFinder";
            String userName = "username";
            String currentMils = "" + System.currentTimeMillis();
            String authenToken = SHA256(key.substring(2, 4) + userName + currentMils.substring(4, 7));
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setConnectTimeout(20000);
            con.setRequestProperty("username", "" + userName);
            con.setRequestProperty("current", "" + currentMils);
            con.setRequestProperty("authen", "" + authenToken);
            //add reuqest header
            con.setRequestMethod("GET");
            //con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestProperty("Content-Length", "");
            con.setRequestProperty("Content-Language", "en-US");
            con.setUseCaches(false);
            con.setDoInput(true);
            con.setDoOutput(true);

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
//        System.out.println("Post parameters : " + urlParameters);
            System.out.println("Response Code : " + responseCode);

            Reader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

            StringBuilder sb = new StringBuilder();
            for (int c; (c = in.read()) >= 0;) {
                sb.append((char) c);
            }

            return sb.toString();
        } catch (MalformedURLException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ProtocolException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "";
    }

    public static String SHA256(String message) {
        String digest = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(message.getBytes(StandardCharsets.UTF_8));
            // converting byte array to Hexadecimal String
            StringBuilder sb = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                sb.append(String.format("%02x", b & 0xff));
            }
            digest = sb.toString();
        } catch (Exception ex) {
            digest = "";
        }
        return digest;
    }

    public static String readUrlPOST(String url, String urlParameters) throws Exception {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setConnectTimeout(20000);

        String key = "eFinder";
        String userName = "username";
        String currentMils = "" + System.currentTimeMillis();
        String authenToken = SHA256(key.substring(2, 4) + userName + currentMils.substring(4, 7));

        con.setRequestProperty("username", "" + userName);
        con.setRequestProperty("current", "" + currentMils);
        con.setRequestProperty("authen", "" + authenToken);
        
        System.out.println("userName = "+userName);
        System.out.println("currentMils = "+currentMils);
        System.out.println("authenToken = "+authenToken);

        //add reuqest header
        con.setRequestMethod("POST");
        //con.setRequestProperty("User-Agent", USER_AGENT);
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        con.setRequestProperty("Content-Length", "");
        con.setRequestProperty("Content-Language", "en-US");
        con.setUseCaches(false);
        con.setDoInput(true);

        // Send post request
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + urlParameters);
        System.out.println("Response Code : " + responseCode);

        Reader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

        StringBuilder sb = new StringBuilder();
        for (int c; (c = in.read()) >= 0;) {
            sb.append((char) c);
        }

        return sb.toString();
    }

    public static void main(String[] args) throws Exception {
        //System.out.println(readUrlPOST("http://10.1.36.17:8080/ApiBase/api/info/employee/update?employeeId=29", "name=Trần Hoàng Long&phone=03213&department=fdsf&description=fsd&address=sdfsd&email=tranlongbkhn@gmail.com"));

        System.out.println(readUrl("http://10.1.36.36:8080/ApiBase/api/info/device?action=getlist&comId=1"));
    }
}
